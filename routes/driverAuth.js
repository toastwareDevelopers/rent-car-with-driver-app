/* The above code is importing the express and bcryptjs modules. */
const express = require('express');
const bcryptjs = require('bcryptjs');


/* Importing the driver and customer models. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');


/* Creating a new router object. */
const driverAuthRouter = express.Router();


/* Checking if the email or phone number is already taken. */
driverAuthRouter.post('/api/signup/driverCheck',async function(req,res){
    try {
        
        /* Destructuring the request body. */
        const {phoneNumber,email} = req.body;
        
        /* Checking if there is a driver with the same email or phone number. */
        const existingDriverWithMail = await Driver.findOne({email});
        const existingDriverWithPhone = await Driver.findOne({phoneNumber});

        /* Checking if there is a customer with the same email or phone number. */
        const existingCustomerWithMail = await Customer.findOne({email});
        const existingCustomerWithPhone = await Customer.findOne({phoneNumber});

        // TODO wili write clean  (quick fix)

        /* Checking if there is a driver with the same email or phone number. */
        if(existingDriverWithMail){
            return res.status(400).json({msg: "There is a person with same email already"});
        }
        if(existingDriverWithPhone){
            return res.status(400).json({msg: "There is a person with same phone number already"});
        }

        /* Checking if there is a customer with the same email or phone number. */
        if(existingCustomerWithMail){
            return res.status(400).json({msg: "There is a person with same email already"});
        }
        if(existingCustomerWithPhone){
            return res.status(400).json({msg: "There is a person with same phone number already"});
        }

        /* Sending a 200 status code to the client. */
        res.sendStatus(200);

    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({error: error.message});
    }


});

/* Creating a new driver. */
driverAuthRouter.post('/api/signup/driver' ,async function(req,res){
    try {
        
        /* Destructuring the request body. */
        const{phoneNumber,email,password,name,surname,birthDate,gender,nationalId,location,info,skills,languages,licenseNumber,licenseYear,carInfo,hourlyPrice,taxNumber} = req.body;
        
        

        /* Checking if there is a driver with the same national id. */
        const existingDriverWithNationalId = await Driver.findOne({nationalId});

        if(existingDriverWithNationalId){
            return res.status(400).json({msg: "There is a person with same National Id already"});
        }
        
        /* Hashing the password. */
        const hashedPassword = await bcryptjs.hash(password,8);

        /* Creating a new driver object. */
        let driver = new Driver({
            phoneNumber,
            email,
            password: hashedPassword,
            name,
            surname,
            birthDate,
            gender,
            nationalId,
            location,
            info,
            skills,
            languages,
            licenseNumber,
            licenseYear,
            carInfo,
            hourlyPrice,
            taxNumber
            
            
        });

       /* Saving the driver object to the database. */
        driver = await driver.save()

        /* Sending the driver object to the client. */
        res.send(driver);

    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({error: error.message});
    }
});

/* Exporting the router object. */
module.exports = driverAuthRouter; 



