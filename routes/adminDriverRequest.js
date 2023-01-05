const express = require('express');
const Admin = require("../models/admin");
const Driver = require("../models/driver");


const adminDriverRequest_Router = express.Router();

adminDriverRequest_Router.options('*', (req, res) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    res.send();
  });


adminDriverRequest_Router.get('/api/admin/driverRequest', async function (req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);
    try {

        let drivers = await Driver.find({isActive : 0},
            { _id: 1, isActive : 1})

        res.send(drivers)

    } catch (error) {
        res.status(501).json({ error: error.message });
    }
});

adminDriverRequest_Router.post('/api/admin/driverRequest', async function (req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);
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
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);
    try {
        const _id = req.body._id
        const isActive = req.body.isActive
        let driver = await Driver.findById(_id)


        
        if(driver){
            await driver.updateOne({isActive : isActive})
            await sendMail("toastwaredevelopers@gmail.com", 2)
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