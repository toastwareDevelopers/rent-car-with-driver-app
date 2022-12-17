const express = require('express');
const Customer = require("../models/customer");
const sMail = require("../middlewares/sendMail.js");
const { getMaxListeners } = require('../models/customer');
const CustomerProfileRouter = express.Router();

CustomerProfileRouter.post('/customer/profile', async function (req, res) {

    try {

        // const id = req.body._id;

        // const profile = await Customer.findById(id);
        // console.log(profile)
        // if (profile) {
        //     await profile.updateOne({ $unset: { mailActivision: 1 } })
            //await sMail("toastwaredevelopers@gmail.com",profile)
        //     res.sendStatus(200)
        // }
        // else {

        //     return res.status(404).json({ msg: "Page not found" });
        // }

    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

module.exports = CustomerProfileRouter; 