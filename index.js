const express = require('express');
const mongoose = require("mongoose");

const customerAuthRouter = require("./routes/customerAuth");

const PORT = 3000;
const app = express();
const DB = 'mongodb+srv://123asd:123asd@my.ipblsxg.mongodb.net/?retryWrites=true&w=majority'

app.use(express.json());
app.use(customerAuthRouter);


mongoose.connect(DB).then(function () {
    console.log("Connection Successful")
}).catch(e => {
    console.log(e);
});

app.listen(PORT, () => {
    console.log('connected ad port ' + PORT);
});