const mongoose = require('mongoose')

const Connection = () => {
    mongoose
        .connect('mongodb+srv://toastware:habilsheild343*@cluster0.qtshlnw.mongodb.net/?retryWrites=true&w=majority')
        .then(() => {
            console.log('db connection succesfully')
        })
        .catch((err) => {
            console.log('DB connection error' + err)
        });
};

module.exports = Connection