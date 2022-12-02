/* Importing the express and mongoose packages. */
const express = require('express');
const mongoose = require("mongoose");


/* Importing the routes from the routes folder. */
const driverAuthRouter = require("./routes/driverAuth");
const customerAuthRouter = require("./routes/customerAuth");
const loginAuthRouter = require("./routes/loginAuth");
const tripCreateRouter = require("./routes/createTrip");
const getModelRouter = require("./routes/getModel");
const driverEditRouter = require("./routes/driverEdit");



/* Creating a server on port 3000. */
const PORT = 3000;

/* Creating an instance of the express server. */
const app = express();

/* A connection string to a MongoDB Atlas cluster. */
const DB = "mongodb+srv://toastware:habilsheild343*@cluster0.qtshlnw.mongodb.net/?retryWrites=true&w=majority"

/* Importing the db.js file. */
const connection = require('./db.js')



/* Telling the server to use the routes in the routes folder. */

app.use(express.json());
app.use(driverAuthRouter);
app.use(customerAuthRouter);
app.use(loginAuthRouter);
app.use(tripCreateRouter);
app.use(getModelRouter);
app.use(driverEditRouter);


/* Connecting to the MongoDB Atlas cluster. */
mongoose.connect(DB).then(function ( ) {
    console.log("Connection Successful")
}).catch(e => {
    console.log(e);
});

/* Listening to the port 3000. */
app.listen(PORT, () =>{
    console.log('connected ad port ' + PORT);
});
