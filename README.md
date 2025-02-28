<h1 align="center">RCC Test Michael Rilan</h1>

<br/>
<h3><b> Setting up the Database </b></h3>

<ul>
<li>Install MySQL to your computer and create database by following this syntax : 
<h5>CREATE DATABASE game_track_db;</h5> </li>

<li>Import the .sql File inside the "database" folder</li>
<li>Please change the password inside the "/backend/index.js" file depending on the root password of your MySQL Database.</li>

</ul>


<br/>
<h3><b>Testing the API </b></h3>


<li>Download and install the Postman application to your computer by clicking this link:to this link: https://www.postman.com/downloads/</li>
<li>Open a terminal and change the directory to "game_track_system/backend" Folder</li>
<li>In the terminal, type this command to run the server : "node index.js"</li>
<li>Open the Postman app and follow the link depending on the request method below: </li>
<br/>
<h4><b>GET Request </b></h4>
<li>Link to get all the data:  http://localhost:3200/gameTrack</li>
<li>Link to get the specific data:  http://localhost:3200/gameTrack/{id}</li>

<br/>
<h4><b>POST Request </b></h4>
<li>Link:  http://localhost:3200/gameTrack</li>
<li>JSON Data:</li>
<p>
    {
        "title": "Any game title",
        "platforms": "any platform",
        "release_date": "yyyy-mm-dd",
        "library_status": "wishlist || owned || now playing || completed",
        "rating": "0.0 - 10.0 nullable",
        "tags": "any tags"
    }
</p>


<br/>
<h4><b>PUT Request </b></h4>
<li>Link:  http://localhost:3200/gameTrack</li>
<li>JSON Data:</li>
<p>
    {   
        "id": "Specific ID inside the database"
        "title": "Any game title",
        "platforms": "any platform",
        "library_status": "wishlist || owned || now playing || completed",
        "rating": "0.0 - 10.0 nullable",
        "tags": "any tags"
    }
</p>

<br/>
<h4><b>DELETE Request </b></h4>
<li>Link:  http://localhost:3200/gameTrack/{id}</li>



<br/>
<h3><b>Run the Application(frontend and backend) </b></h3>
<ul>
<li>Open a terminal and change the directory to "game_track_system/backend" Folder</li>
<li>In the terminal, type this command to run the server : "node index.js"</li>
<li>Open a NEW terminal and change the directory to "game_track_system/frontend" Folder</li>
<li>In the terminal, type this command to run the server : "npm start"</li>
<li>The Browser will automatically open, if not, you can type the link provided by the terminal after you type "npm start"</li>

</ul>
