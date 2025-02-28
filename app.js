const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");
const port = 3200;
const app = express();
const bcrypt = require('bcrypt');
// const dotenv = require('dotenv');
const jwt = require('jsonwebtoken');
const router = express.Router()
JWT_SECRET_KEY = "secret_key"

app.use(bodyParser.json());

// // Set up Global configuration access
// dotenv.config();
const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "rcc_exam"
  });

  
const authenticateToken = (req, res, next) => {
  const token = req.header("Authorization")?.replace("Bearer", "");
  if (!token) {
    return res.status(401).json({ error: "Access denied" });
  }
  try {
    const decoded = jwt.verify(token, JWT_SECRET_KEY);
    req.userId = decoded.userId;
    next();
  } catch (error) {
    res.status(401).json({ error: "Invalid token" });
  }
};



app.post("/register", async (req, res) => {
  const { email, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  connection.query(
    "SELECT * FROM USERS WHERE EMAIL = ?",
    [email],
    (err, results) => {
      try {
        if (results.length > 0) {
          res.send({ message: "Email already taken" });
        } else {
          connection.query(
            "INSERT INTO users (email, password) VALUES (?, ?)",
            [email, hashedPassword],
            (err, results) => {
              if (results.affectedRows > 0) {
                res.send({ message: "User successfully registered" });
              } else {
                res.send({ message: "Something went wrong!" });
              }
            },
          );
        }
      } catch (err) {
        res.json({ message: err });
      }
    },
  );
});


app.post("/login", (req, res) => {
  const { email, password } = req.body;
  connection.query(
    "SELECT * FROM USERS WHERE EMAIL = ?",
    [email],
    async (err, results) => {
      if (results.length > 0) {
        const user = results[0];
        const isMatch = await bcrypt.compare(password, user.password);
        if (isMatch) {
          let jwtSecretKey = JWT_SECRET_KEY;
          const token = jwt.sign({ userId: user.id }, jwtSecretKey, {
            expiresIn: "1h",
          });
          res.send({ access_token: token });
        } else {
          res.send({ message: "Invalid credentials" });
        }
      }
    },
  );
});



app.post("/order", (req, res) => {
  const { product_id, quantity } = req.body;
  let tokenHeaderKey = "Bearer";
  let jwtSecretKey = JWT_SECRET_KEY;
  try {
    const token = req.header(tokenHeaderKey);
    const verified = jwt.verify(token, jwtSecretKey);
    if (verified) {
      connection.query(
        "SELECT * FROM PRODUCTS WHERE ID = ?",
        [product_id],
        (err, results) => {
          try {
            const orders = results[0];
            if (orders.AvailableStock < quantity) {
              res.send({
                message:
                  "Failed to order this product due to unavailability of the stock",
              });
            } else {
              connection.query(
                "INSERT INTO orders (product_id, quantity) VALUES (?, ?)",
                [product_id, quantity],
                (err, results) => {
                  if (results.affectedRows > 0) {
                    current_quantity = orders.AvailableStock - quantity;
                    connection.query(
                      "UPDATE PRODUCTS SET AVAILABLESTOCK = ? WHERE ID = ?",
                      [current_quantity, product_id],
                      (err, results) => {
                        try {
                          if (results.affectedRows > 0) {
                            res.send({
                              message:
                                "You have successfully ordered this product.",
                            });
                          }
                        } catch (error) {
                          res.json({ message: err });
                        }
                      },
                    );
                  } else {
                    res.send({ message: "Something went wrong!" });
                  }
                },
              );
            }
          } catch (err) {
            res.json({ message: err });
          }
        },
      );
    } else {
      return res.status(401).send({ message: "Invalid credentials" });
    }
  } catch (error) {
    // Access Denied
    return res.status(401).send(error);
  }
});

app.listen(port, function(err){
    if (err) console.log("Error in server setup")
    console.log("Server listening on Port", port);
})