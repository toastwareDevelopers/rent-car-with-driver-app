const express = require('express');
const Customer = require("../models/customer");
const moment = require('moment');

const bcryptjs = require('bcryptjs');
<<<<<<< HEAD
const Driver = require('../models/driver');

const customerAuthRouter = express.Router();

//customerAuthRouter.post('/api/signup/customer', async function (req, res) {
//    try {
//
//        const { phoneNumber, email, password} = req.body;
//
//        const existingCustomerWithMail = await Customer.findOne({ email });
//        const existingCustomerWithPhone = await Customer.findOne({ phoneNumber });
//
//        if (existingCustomerWithMail) {
//            return res.status(400).json({ msg: "There is a person with same email already" });
//        }
//
//        if (existingCustomerWithPhone) {
//            return res.status(400).json({ msg: "There is a person with same phone number already" });
//        }
//
//        res.sendStatus(200);
//    } catch (error) {
//        res.status(500).json({ error: error.message });
//    }
//
//
//});

=======

const customerAuthRouter = express.Router();

>>>>>>> feature/backend/customer
customerAuthRouter.post('/api/signup/customer', async function (req, res) {
    try {

        const { phoneNumber, email, password, name, surname, birthDate, gender, nationalId, passportNumber } = req.body;

<<<<<<< HEAD
        const existingCustomerWithNationalId = await Customer.findOne({ nationalId });    
        const existingCustomerWithMail = await Customer.findOne({ email });        
        const existingCustomerWithPhone = await Customer.findOne({ phoneNumber });

        //TODO Buralar daha iyi yazılacak quick fix

=======
        const existingCustomerWithNationalId = await Customer.findOne({ nationalId });
        const existingCustomerWithMail = await Customer.findOne({ email });
        const existingCustomerWithPhone = await Customer.findOne({ phoneNumber });
        
>>>>>>> feature/backend/customer
        if (existingCustomerWithNationalId) {
            return res.status(400).json({ msg: "There is a person with same National Id already" });
        }

        if (existingCustomerWithMail) {
            return res.status(400).json({ msg: "There is a person with same email already" });
        }

        if (existingCustomerWithPhone) {
            return res.status(400).json({ msg: "There is a person with same phone number already" });
<<<<<<< HEAD
        }


=======
        }   
        
>>>>>>> feature/backend/customer
        const hashedPassword = await bcryptjs.hash(password, 8);

        let customer = new Customer({
            phoneNumber,
            email,
            password: hashedPassword,
            name,
            surname,
            birthDate,
            gender,
            nationalId,
            passportNumber,
            registerDate: moment().format('L, HH:mm')
        });

        customer = await customer.save()
        res.send(customer);

    } catch (error) {
        res.status(501).json({ error: error.message });
    }
});

<<<<<<< HEAD
module.exports = customerAuthRouter; 
=======
module.exports = customerAuthRouter; 
>>>>>>> feature/backend/customer
