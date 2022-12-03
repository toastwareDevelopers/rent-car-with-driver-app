const mongoose = require('mongoose')

const Connection = () => {
    mongoose
        .connect(process.env.DB_URL)
        .then( () => {
            console.log('db connection succesfully')
        })
        .catch((err)=>{
            console.log('DB connection error' + err)
        });
};

module.exports = Connection