/* This is importing the express and bcryptjs modules. */
const express = require("express");
const bcyrptjs = require("bcryptjs");

/* Creating a new router object. */
const loginAuthRouter = express.Router();

/* Importing the customer and driver models from the models folder. */
const Customer = require("../models/customer");
const Driver = require("../models/driver");


/* This is the code that is executed when the user clicks the sign in button. It checks if the user is
a customer or a driver and then checks if the password is correct. If it is correct, it sends the
user to the customer or driver page. */

loginAuthRouter.post("/api/signin", async (req,res) =>{
    
    try{
        
        /* Destructuring the email and password from the request body. */
        const {email, password} = req.body;
        /* Checking if a customer exists with the given email. */
        const customer = await Customer.findOne({email});
        
        
        if(!customer){
            
            /* Checking if a driver exists with the given email. */
            const driver = await Driver.findOne({email});
            
            /* This is checking if the driver exists. If it does not exist, it sends a message to the
            user saying that the user does not exist. */
            if(!driver){
                return res
                .status(400)
                .json({msg:"User with this email does not exist"});
            }

           
            /* Comparing the password that the user entered with the password that is stored in the
            database. */
            const isMatch = await bcyrptjs.compare(password, driver.password);

            /* This is checking if the password that the user entered is the same as the password that
            is stored in the database. If it is not, it sends a message to the user saying that the
            password is incorrect. */
            if(!isMatch){
                return res
                .status(400)
                .json({msg: "Incorrect password"});
            }
           
           /* Sending the driver object to the client. */
           res.send(driver);
 
        }

        else{
            
            /* Comparing the password that the user entered with the password that is stored in the
            database. */
            const isMatch = await bcyrptjs.compare(password, customer.password);
            
            /* Checking if the password that the user entered is the same as the password that
            is stored in the database. If it is not, it sends a message to the user
            saying that the password is incorrect. */
            if(!isMatch){
                return res
                .status(400)
                .json({msg: "Incorrect password"});
            }
            
            /* Sending the customer object to the client. */
            res.send(customer);
        }
    }catch(e){
        /* Sending a 500 status code to the client and sending the error message to the client. */
        res.status(500).json({error:e.message});
    }
})


/* Exporting the loginAuthRouter object so that it can be used in other files. */
module.exports = loginAuthRouter;