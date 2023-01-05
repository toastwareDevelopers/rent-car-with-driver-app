/* This is importing the express module. */
const express = require('express');

/* Importing the models from the models folder. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');
const Trip = require("../models/trip");
const Review = require("../models/review");
const { JsonWebTokenError } = require('jsonwebtoken');

/* Creating a new router object. */
const getTripsRouter = express.Router();

getTripsRouter.get('/api/getTrips',async function (req,res){

    try {
        //console.log("hi");
        /* Getting the id from the query string. */
        const _id = req.query.ID;

        //console.log(_id)

         /* Checking if the model is a customer. If it is, it returns the model. */
        model = await Customer.findById(_id);

        

        

        if(!model) model = await Driver.findById(_id);
        
        /* Checking if the model is null. If it is, it returns a 400 status code and a message. */
        if(!model) return res.status(400).json({msg: "There is not a model with this id"});
        
        if(model){
            
            let arrOfTrips = new Array();

            for (let index = 0; index < model.trips.length; index++) {
                
                x = await Trip.findById( model.trips[index]);
                
                y = x.toObject();

                if(!(x.reviewId))
                    y.reviewId = "null";
                else y.reviewId = x.reviewId;

                if(model.role == "driver"){

                    tempCustomer = await Customer.findById(x.customerId);
                    
                    if(!tempCustomer) return res.status(400).json({msg:"Customeri silmisler databaseden"});
                    y.customerName = tempCustomer.name;
                    y.customerSurname = tempCustomer.surname;
                    y.customerProfile_image64 = tempCustomer.profile_image64;
                    y.customerBirthDate = tempCustomer.birthDate;
                    
                }
                    
                
                if(model.role == "customer"){
                    
                    tempDriver = await Driver.findById(x.driverId);
                    
                    if(!tempDriver) return res.status(400).json({msg:"Driveri silmisler databaseden"});

                    y.driverName = tempDriver.name;
                    y.driverSurname = tempDriver.surname;
                    y.driverProfileImage = tempDriver.profile_image64;
                    y.driverBirthDate = tempDriver.birthDate;
                    
                }
                
                arrOfTrips.push(y);    
            }
            
            return res.send(arrOfTrips);
        }

        return res.send(arrOfTrips);

    } catch (error) {
        res.status(500).json({error: error.message});
    }

});

/* Exporting the router object. */
module.exports = getTripsRouter;