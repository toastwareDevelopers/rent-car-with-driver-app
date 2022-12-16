const express = require('express');
const Customer = require("../models/customer");

const CustomerProfileRouter = express.Router();

CustomerProfileRouter.get('/customer/profile', async function (req, res) {

    try {

        const { _id } = req.query.ID;

        profile = await Customer.findOne(_id);

        if (profile) {
            
            res.send(profile)
        }

        else {

            return res.status(404).json({ msg: "Page not found" });
        }

    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

module.exports = CustomerProfileRouter; 