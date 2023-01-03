const express = require('express');
const Admin = require("../models/admin");

const adminAuth_router = express.Router();

adminAuth_router.post('/api/admin/signup', async function (req, res) {
    try {
        const { name, password } = req.body;


        let admin = new Admin({
            name,
            password
        });

        admin = await admin.save()
        res.send(admin);

    } catch (error) {
        res.status(501).json({ error: error.message });
    }
});

adminAuth_router.post('/api/admin/signin', async function (req, res) {
    try {
        const { name, password } = req.body;

        const admin = await Admin.findOne({ name });
        
        if (!admin) {

            res.json("invalid admin")
        }

        if (admin.password === password) {

            res.sendStatus(200);
        }
        else {
            res.json("invalid admin");
        }
    } catch (error) {
        res.status(501).json({ error: error.message });
    }
});

module.exports = adminAuth_router; 
