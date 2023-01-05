const express = require('express');
const Admin = require("../models/admin");

const adminAuth_router = express.Router();

adminAuth_router.options('*', (req, res) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.send();
  });

adminAuth_router.post('/api/admin/signup', async function (req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);
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
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);
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
