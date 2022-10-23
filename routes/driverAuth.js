const express = require('express');
const Driver = require("../models/driver");

const bcryptjs = require('bcryptjs');

const driverAuthRouter = express.Router();

driverAuthRouter.post('/api/signup/driverCheck',async function(req,res){
    try {
        
        const {phoneNumber,email} = req.body;
        
        const existingDriverWithMail = await Driver.findOne({email});
        const existingDriverWithPhone = await Driver.findOne({phoneNumber});

        

        if(existingDriverWithMail){
            return res.status(400).json({msg: "There is a person with same email already"});
        }
        if(existingDriverWithPhone){
            return res.status(400).json({msg: "There is a person with same phone number already"});
        }

        res.sendStatus(200);

    } catch (error) {
        res.status(500).json({error: error.message});
    }


});

driverAuthRouter.post('/api/signup/driver' ,async function(req,res){
    try {
        
        const{phoneNumber,email,password,name,surname,birthDate,gender,nationalId,location,info,skills,languages,licenceNumber,licenceYear,carInfo,hourlyPrice,taxNumber} = req.body;
        
        const existingDriverWithNationalId = await Driver.findOne({nationalId});

        if(existingDriverWithNationalId){
            return res.status(400).json({msg: "There is a person with same National Id already"});
        }
        
        const hashedPassword = await bcryptjs.hash(password,8);

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
            licenceNumber,
            licenceYear,
            carInfo,
            hourlyPrice,
            taxNumber
            
            
        });

        driver = await driver.save()

        res.send(driver);

    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

module.exports = driverAuthRouter; 



