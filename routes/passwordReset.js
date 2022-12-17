const express = require('express');
const Customer = require("../models/customer");
const Driver = require("../models/driver");
const { getMaxListeners } = require('../models/customer');
const passwordResetRouter = express.Router();
const bcryptjs = require('bcryptjs');
const nodemailer = require("nodemailer");
const jwt = require('jsonwebtoken');

passwordResetRouter.post('/api/passwordReset/mail', async function (req, res) {

    try {
        const mail = req.body.email

        var profile = await Customer.findOne({ email: mail })

        if (profile == null) {
            profile = await Driver.findOne({ email: mail })
        }

        if (profile) {
            await sMail("toastwaredevelopers@gmail.com", profile)
            res.sendStatus(200)
        }

        else
            return res.status(404).json({ msg: "Mail not found" });



    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

passwordResetRouter.post('/api/passwordReset/key', async function (req, res) {

    try {

        const validationNumber = req.body.validationNumber;
        const mail = req.body.email;
        const password = req.body.password

        var profile = await Customer.findOne({ email: mail })

        if (profile == null) {
            profile = await Driver.findOne({ email: mail })
        }

        if (profile) {
            if (profile.mailActivision.activisionKey == validationNumber) {
                await profile.updateOne({ $unset: { mailActivision: 1 } })

                const hashedPassword = await bcryptjs.hash(password, 8);
                await profile.updateOne({ password: hashedPassword }, { runValidators: true });
                res.sendStatus(200)
            }

            else
                return res.status(404).json({ msg: "Invalid key" });

        }
        else {

            return res.status(404).json({ msg: "Mail not found" });
        }

    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

async function sMail(tomail,profile) {

    // Generate test SMTP service account from ethereal.email
    // Only needed if you don't have a real mail account for testing

    // create reusable transporter object using the default SMTP transport
    let transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
            user: 'toastwaredevelopers.7@gmail.com', // generated ethereal user
            pass: 'mdbwfhwbwvrlgfcx', // generated ethereal password
        },
    });

    var random = Math.floor(Math.random() * 1234567890)
    await profile.updateOne({"mailActivision.activisionKey":random})
    await profile.updateOne({"mailActivision.activisionStatus":false})

    
    // send mail with defined transport object
    let mailOptions = {
        from: 'toastwaredevelopers.7@gmail.com', // sender address
        to: tomail, // list of receivers
        subject: "WELCOME BABY✔", // Subject line
        // This would be the text of email body
        text: "Hi! Just one more step to experience your RENTaCAR!.\n\n VALİDATİON KEY:  "  +  random
    };

    transporter.sendMail(mailOptions, (err, info) => {

        if (err) console.log(err)
    })
}

module.exports = passwordResetRouter; 
