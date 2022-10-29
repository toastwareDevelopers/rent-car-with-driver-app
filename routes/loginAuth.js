const express = require("express");
const bcyrptjs = require("bcryptjs");
const loginAuthRouter = express.Router();
const jwt = require('jsonwebtoken');
const auth = require("../middlewares/auth");
const Customer = require("../models/customer");
const Driver = require("../models/driver");


loginAuthRouter.post("/api/signin", async (req,res) =>{
    try{
        const {email, password} = req.body;
        const customer = await Customer.findOne({email});
        if(!customer){
            // if no customer exists with the given email, check if a driver exists with this email
            const driver = await Driver.findOne({email});
            if(!driver){
                return res
                .status(400)
                .json({msg:"User with this email does not exist"});
            }
            const isMatch = await bcyrptjs.compare(password, driver.password);
            if(!isMatch){
                return res
                .status(400)
                .json({msg: "Incorrect password"});
            }
            const token = jwt.sign({id: driver._id}, "passwordKey");
            res.json({token, ...driver._doc});
        }
        else{
            const isMatch = await bcyrptjs.compare(password, customer.password);
            if(!isMatch){
                return res
                .status(400)
                .json({msg: "Incorrect password"});
            }
            const token = jwt.sign({id: customer._id}, "passwordKey");
            res.json({token, ...customer._doc});
        }
    }catch(e){
        res.status(500).json({error:e.message});
    }
})

loginAuthRouter.get('/', auth, async (req,res) =>{
    const user = await User.findById(req.user);
    res.json({...user._doc,token: req.token});
})

//****************** for testing purposes  *********************//
loginAuthRouter.post("/api/driver/signup", async (req,res) => {
    try{
        const {phoneNumber, email, password, name, surname, birthDate, gender, nationalId,
            passportNumber, location, sicilNo, rating, hourlyPrice, driverLicenceYear,
            languages, info,carInfo:{planteNumber,brand,model,year,color,},} = req.body;
        const existingUser = await Driver.findOne({ email });
        if(existingUser){
            return res.status(400).json({msg: 'User with same email already exists'});
        }

        const hashedPassword = await bcyrptjs.hash(password, 8);
    
        let user = new Driver({
            phoneNumber, 
            email, 
            password :hashedPassword, 
            name, 
            surname, 
            birthDate, 
            gender, 
            nationalId,
            passportNumber, 
            location, 
            sicilNo, 
            rating, 
            hourlyPrice, 
            driverLicenceYear,
            languages, 
            info, 
            carInfo:{planteNumber,brand,model,year,color,}
        })
        user = await user.save();
        res.json(user);
    }catch(e){
        res.status(500).json({error: e.message});
    }
});
loginAuthRouter.post("/api/customer/signup", async (req,res) => {
    try{
        const {phoneNumber, email, password, name, surname, birthDate, gender, nationalId, passportNumber, info} = req.body;
        const existingUser = await Customer.findOne({ email });
        if(existingUser){
            return res.status(400).json({msg: 'User with same email already exists'});
        }

        const hashedPassword = await bcyrptjs.hash(password, 8);
    
        let user = new Customer({
            phoneNumber, 
            email,
            password:hashedPassword, 
            name, 
            surname, 
            birthDate, 
            gender, 
            nationalId, 
            passportNumber, 
            info
        })
        user = await user.save();
        res.json(user);
    }catch(e){
        res.status(500).json({error: e.message});
    }
});

module.exports = loginAuthRouter;