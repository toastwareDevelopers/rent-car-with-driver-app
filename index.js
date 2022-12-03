<<<<<<< HEAD
// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const driverAuthRouter = require("./routes/driverAuth");
const customerAuthRouter = require("./routes/customerAuth");
const loginAuthRouter = require("./routes/loginAuth");

// INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://toastware:habilsheild343*@cluster0.qtshlnw.mongodb.net/?retryWrites=true&w=majority"
const connection = require('./db.js')

// middleware
app.use(express.json());
app.use(driverAuthRouter);
app.use(customerAuthRouter);
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
