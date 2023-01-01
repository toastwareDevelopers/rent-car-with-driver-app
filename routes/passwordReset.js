const express = require('express');
const Customer = require("../models/customer");
const Driver = require("../models/driver");
const { getMaxListeners } = require('../models/customer');
const passwordResetRouter = express.Router();
const bcryptjs = require('bcryptjs');
const nodemailer = require("nodemailer");
const jwt = require('jsonwebtoken');
const sendMail = require('../middlewares/sendMail.js')

passwordResetRouter.post('/api/passwordReset/mail', async function (req, res) {

    try {
        const mail = req.body.email

        var profile = await Customer.findOne({ email: mail })

        if (profile == null) {
            profile = await Driver.findOne({ email: mail })
        }
        if (profile) {
            var charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = "";
            for (var i = 0, n = charset.length; i < 8; ++i) {
                random += charset.charAt(Math.floor(Math.random() * n));
            }
            const hashedPassword = await bcryptjs.hash(random, 8);
            await profile.updateOne({ password: hashedPassword }, { runValidators: true });
            await sendMail(email, random, "Bilader niye unutuyon passwordu")
            res.sendStatus(200)
        }

        else
            return res.status(404).json({ msg: "Mail not found" });



    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

// passwordResetRouter.post('/api/passwordReset/key', async function (req, res) {

//     try {

//         const validationNumber = req.body.validationNumber;
//         const mail = req.body.email;
//         const password = req.body.password

//         var profile = await Customer.findOne({ email: mail })

//         if (profile == null) {
//             profile = await Driver.findOne({ email: mail })
//         }

//         if (profile) {
//             if (profile.mailActivision.activisionKey == validationNumber) {
//                 await profile.updateOne({ $unset: { mailActivision: 1 } })

//                 const hashedPassword = await bcryptjs.hash(password, 8);
//                 await profile.updateOne({ password: hashedPassword }, { runValidators: true });
//                 res.sendStatus(200)
//             }

//             else
//                 return res.status(404).json({ msg: "Invalid key" });

//         }
//         else {

//             return res.status(404).json({ msg: "Mail not found" });
//         }

//     } catch (error) {

//         res.status(500).json({ error: error.message });
//     }

// });

module.exports = passwordResetRouter; 
