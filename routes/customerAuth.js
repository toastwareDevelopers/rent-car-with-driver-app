const express = require('express');
const Customer = require("../models/customer");
const moment = require('moment');
const sendMail = require('../middlewares/sendMail.js')

const bcryptjs = require('bcryptjs');

const customerAuthRouter = express.Router();

customerAuthRouter.post('/api/signup/customer', async function (req, res) {
    try {

        const { profil_image64, phoneNumber, email, password, name, surname, birthDate, gender, nationalId, passportNumber } = req.body;

        const existingCustomerWithNationalId = await Customer.findOne({ nationalId });
        const existingCustomerWithMail = await Customer.findOne({ email });
        const existingCustomerWithPhone = await Customer.findOne({ phoneNumber });

        if (existingCustomerWithNationalId) {
            return res.status(400).json({ msg: "There is a person with same National Id already" });
        }

        if (existingCustomerWithMail) {
            return res.status(400).json({ msg: "There is a person with same email already" });
        }

        if (existingCustomerWithPhone) {
            return res.status(400).json({ msg: "There is a person with same phone number already" });
        }

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
            registerDate: moment().format('L, HH:mm'),
            profil_image64
        }); 

        customer = await customer.save() 

        await sendMail("toastwaredevelopers@gmail.com", -1, "Uzun ince kivrim kivrim yollar bazen deler geçer yüreğimi, sitem ederim yollara, sevmesini bilen yüreğimi boş koydunuz diye.")

        res.send(customer);

    } catch (error) {
        res.status(501).json({ error: error.message });
    }
});

module.exports = customerAuthRouter; 
