const express = require('express');
const Admin = require("../models/admin");
const Driver = require("../models/driver");


const adminDriverRequest_Router = express.Router();

adminDriverRequest_Router.get('/api/admin/driverRequest', async function (req, res) {
    try {

        let drivers = await Driver.find({isActive : 0},
            { _id: 1, isActive : 1})

        res.send(drivers)

    } catch (error) {
        res.status(501).json({ error: error.message });
    }
});

adminDriverRequest_Router.post('/api/admin/driverRequest', async function (req, res) {
    try {
        const _id = req.body._id

        let driver = await Driver.findById(_id)

        if(driver){

            res.send(driver)
        }
        else{

            console.log("uups. Driver not found")
        }

    } catch (error) {
        res.status(501).json({ error: error.message });
    }
});

adminDriverRequest_Router.put('/api/admin/driverRequest', async function (req, res) {
    try {
        const _id = req.body._id
        const isActive = req.body.isActive
        let driver = await Driver.findById(_id)


        
        if(driver){
            await driver.updateOne({isActive : isActive})
            res.send(200)
        }
        else{

            console.log("uups. Driver not found")
        }

    } catch (error) {
        res.status(501).json({ error: error.message });
    }
});



module.exports = adminDriverRequest_Router; 