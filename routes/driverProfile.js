const express = require('express');
const Driver = require("../models/driver");

const DriverProfileRouter = express.Router();

DriverProfileRouter.get('/driver/profile', async function (req, res) {

    try {

        const { _id } = req.query.ID;

        profile = await Driver.findOne(_id);

        if (profile) {
            res.send(profile);
        }

        else {
            return res.status(404).json({ msg: "Page not found" });
        }

    } catch (error) {
        res.status(500).json({ error: error.message });
    }

});

module.exports = DriverProfileRouter; 