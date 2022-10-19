const express = require('express');
const mongoose = require("mongoose");

const driverAuthRouter = require("./routes/driverAuth");

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://toastware:habilsheild343*@cluster0.qtshlnw.mongodb.net/?retryWrites=true&w=majority"

app.use(express.json());
app.use(driverAuthRouter);


mongoose.connect(DB).then(function ( ) {
    console.log("Connection Successful")
}).catch(e => {
    console.log(e);
})
;

app.listen(PORT, () =>{
    console.log('connected ad port ' + PORT);
});
