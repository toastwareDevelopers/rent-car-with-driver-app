const express = require('express');
const Admin = require("../models/admin");

const adminAuth_router = express.Router();

adminAuth_router.post('/api/admin//signup', async function (req, res) {
    try {
        const {name,password} = req.body;
        

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

module.exports = adminAuth_router; 
