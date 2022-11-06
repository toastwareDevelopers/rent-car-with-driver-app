const express = require("express");
const bcyrptjs = require("bcryptjs");
const loginAuthRouter = express.Router();
//const jwt = require('jsonwebtoken');
//const auth = require("../middlewares/auth");
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
           
           res.send(driver);

        
             
        }
        else{
            const isMatch = await bcyrptjs.compare(password, customer.password);
            if(!isMatch){
                return res
                .status(400)
                .json({msg: "Incorrect password"});
            }
            
            res.send(customer);
        }
    }catch(e){
        res.status(500).json({error:e.message});
    }
})


module.exports = loginAuthRouter;