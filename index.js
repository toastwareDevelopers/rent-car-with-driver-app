/* Importing the express and mongoose packages. */
const express = require('express');
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const loginAuthRouter = require("./routes/loginAuth");
const driverAuthRouter = require("./routes/driverAuth");
const driverEditRouter = require("./routes/driverEdit");
const driverProfileRouter = require("./routes/driverProfile");
const customerAuthRouter = require("./routes/customerAuth");
const customerMainRouter = require("./routes/customerMain");
const customerEditRouter = require("./routes/customerEdit");
const customerProfileRouter = require("./routes/customerProfile");
const tripCreateRouter = require("./routes/createTrip");
const getModelRouter = require("./routes/getModel");

/* Creating a server on port 3000. */
const PORT = 3000;

/* Creating an instance of the express server. */
const app = express();
const connection = require('./db.js')

// middleware
app.use(express.json());
app.use(loginAuthRouter);
app.use(customerAuthRouter);
app.use(customerEditRouter);
app.use(customerMainRouter);
app.use(customerProfileRouter);
app.use(driverEditRouter);
app.use(driverAuthRouter);
app.use(driverProfileRouter);
app.use(tripCreateRouter);
app.use(getModelRouter);

//connections
connection()

app.listen(PORT, () =>{
    console.log('connected ad port ' + PORT);
});


