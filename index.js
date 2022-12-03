// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const loginAuthRouter = require("./routes/loginAuth");
const driverAuthRouter = require("./routes/driverAuth");
const customerAuthRouter = require("./routes/customerAuth");
const customerMainRouter = require("./routes/customerMain");
const customerEditRouter = require("./routes/customerEdit");
const customerProfileRouter = require("./routes/customerProfile");

// INIT
const PORT = 3000;
const app = express();
const connection = require('./db.js')

app.use(express.json());
app.use(customerAuthRouter);
app.use(customerEditRouter);
app.use(customerProfileRouter);
app.use(loginAuthRouter);
app.use(customerMainRouter);

/* Connecting to the MongoDB Atlas cluster. */
connection()

/* Listening to the port 3000. */
app.listen(PORT, () =>{
    console.log('connected ad port ' + PORT);
});


