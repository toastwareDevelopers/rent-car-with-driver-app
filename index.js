// IMPORTS FROM PACKAGES
const express = require('express');
const { default: mongoose } = require('mongoose');

// IMPORTS FROM OTHER FILES
const loginAuthRouter = require("./routes/loginAuth");
// INIT
const PORT = 3000;
const DB = "mongodb+srv://toastware:habilsheild343*@cluster0.qtshlnw.mongodb.net/?retryWrites=true&w=majority";

const app = express();

// middleware
app.use(express.json());
app.use(loginAuthRouter);

//connections
mongoose
.connect(DB)
.then(() => {
    console.log("connected to DB");
})
.catch((e) => {
    console.log(e)
});


app.listen(PORT,"0.0.0.0", () =>{
    console.log("connected at port " + PORT);

});
// Create an api
// http://<youripaddress>/index
app.get('/index',(req, res) => {
    res.send("hello world");
})
