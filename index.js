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
=======
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
app.listen(process.env.PORT, () =>{
    console.log('connected ad port ' + process.env.PORT);
});
>>>>>>> feature/backend/customer
