/* Importing the express and mongoose packages. */
const express = require('express');
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES



/* Creating a server on port 3000. */
const PORT = 3000;

/* Creating an instance of the express server. */
const app = express();
const connection = require('./db.js');
const adminDriverRequestRouter = require('./routes/adminDriverRequest.js');


// middleware
app.use(express.json());
app.use(adminDriverRequestRouter)

//connections
connection()

app.listen(PORT, () =>{
    console.log('connected ad port ' + PORT);
});


