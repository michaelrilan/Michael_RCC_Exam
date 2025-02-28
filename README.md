<h1 align="center">RCC Test Michael Rilan</h1>

<br/>
<h3><b> Setting up the Database </b></h3>

<ul>
<h5>CREATE DATABASE rcc_exam;</h5> </li>

<li>Import the .sql File </li>
</ul>


<br/>
<h3><b>Run the Server </b></h3>


<li>Download and install the Postman application to your computer by clicking this link:to this link: https://www.postman.com/downloads/</li>
<li>Import the Michael_Rilan.postman_collection to your Postman App</li>
<li>In the terminal, type this command to run the server : "node app.js"</li>
<li>Open the Postman app and follow the link depending on the request method below: </li>

<br/>
<h4><b>POST Request Register</b></h4>
<li>Link:  http://localhost:3200/register</li>
<li>JSON Data:</li>
<p>
    {
        "email": "email:String",
        "password": "password:String"
    }
</p>


<br/>
<h4><b>POST Request Login</b></h4>
<li>Link:  http://localhost:3200/login</li>

<li>JSON Data:</li>
<p>
    {
        "email": "email:String",
        "password": "password:String"
    }
</p>
<h4><b>POST Request Order</b></h4>
<li>Link:  http://localhost:3200/order</li>
<li>Get the jwtToken from login and put it on "Header Tab" with a key of "Bearer" and the value is the accessToken from login</li>

<li>JSON Data:</li>
<p>
    {
    "product_id": integer,
    "quantity": integer
}
</p>

</ul>
