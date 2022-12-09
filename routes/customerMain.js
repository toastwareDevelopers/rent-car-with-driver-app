const express = require('express');
const Customer = require("../models/customer");
const Driver = require("../models/driver");

const CustomerProfileRouter = express.Router();


CustomerProfileRouter.get('/customer/main', async function (req, res) {
    

    try {

        const { _id } = req.query.ID;

        profile = await Customer.findOne(_id);

        let drivers = await Driver.find()

        if (profile) {

            res.send(profile+drivers[Math.floor(Math.random() * drivers.length)]
            +drivers[Math.floor(Math.random() * drivers.length)]+drivers[Math.floor(Math.random() * drivers.length)])
        }

        else {

            return res.status(404).json({ msg: "Page not found" });
        }

    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

module.exports = CustomerProfileRouter; 