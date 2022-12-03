/* Importing the express and mongoose packages. */
const express = require('express');
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const loginAuthRouter = require("./routes/loginAuth");
const driverAuthRouter = require("./routes/driverAuth");
const customerAuthRouter = require("./routes/customerAuth");
const customerMainRouter = require("./routes/customerMain");
const customerEditRouter = require("./routes/customerEdit");
const customerProfileRouter = require("./routes/customerProfile");

/* Creating a server on port 3000. */
const PORT = 3000;

/* Creating an instance of the express server. */
const app = express();
const DB = "mongodb+srv://toastware:habilsheild343*@cluster0.qtshlnw.mongodb.net/?retryWrites=true&w=majority"
const connection = require('./db.js')

// middleware
app.use(express.json());
app.use(customerAuthRouter);
app.use(customerEditRouter);
app.use(customerProfileRouter);
app.use(loginAuthRouter);

//connections
mongoose.connect(DB).then(function ( ) {
    console.log("Connection Successful")
}).catch(e => {
    console.log(e);
});

app.listen(PORT, () =>{
    console.log('connected ad port ' + PORT);
});


