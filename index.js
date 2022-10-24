const express = require('express');

const customerAuthRouter = require("./routes/customerAuth");
const connection = require('./db.js')

connection()

const PORT = 3000;
const app = express();


app.use(express.json());
app.use(customerAuthRouter);


app.listen(PORT, () => {
    console.log('connected ad port ' + PORT);
});