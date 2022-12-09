const express = require('express');
const mongoose = require("mongoose");
const dotenv = require("dotenv");

const customerAuthRouter = require("./routes/customerAuth");
const loginAuthRouter = require("./routes/loginAuth");
const customerMainRouter = require("./routes/customerMain");
const customerEditRouter = require("./routes/customerEdit");
const customerProfileRouter = require("./routes/customerProfile");
const connection = require('./db.js')

dotenv.config()
const app = express();


app.use(express.json());
app.use(customerAuthRouter);
app.use(customerEditRouter);
app.use(customerProfileRouter);
app.use(loginAuthRouter);
app.use(customerMainRouter);

/* Connecting to the MongoDB Atlas cluster. */
connection()

/* Listening to the port 3000. */
app.listen(3000, () =>{
    console.log('connected ad port ' + 3000);
});