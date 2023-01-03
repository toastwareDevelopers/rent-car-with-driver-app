/* This is importing the express module. */
const express = require('express');


/* This is importing the driver, customer, and trip models. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');
const Trip = require('../models/trip');

/* This is creating a new router object. */
const tripCreateRouter = express.Router();



/* This is creating a new trip. */
tripCreateRouter.post('/api/createTrip',async function(req,res){

    try { 
        
        /* This is destructuring the request body. */
        const {driverId,customerId,startDate,endDate,location,price} = req.body;
        
        /* Looking for a driver with the driverId that was passed in the request body. */
        const existDriver = await Driver.findById(driverId); 


        /* This is checking if the driver exists. If it doesn't, it will return a 400 error. */
        if(!existDriver){
            return res.status(400).json({msg: "There is not a driver with this driverID"}); 
        }

        /* Looking for a customer with the customerId that was passed in the request body. */
        const existCustomer = await Customer.findById(customerId);

        if(!existCustomer){
            return res.status(400).json({msg: "There is not a customer with this customerID"}); 
        }

        /* This is creating a new trip object with the data that was passed in the request body. */
        let trip = Trip({
            driverId,
            customerId,
            startDate,
            endDate,
            location,
            price
    
        });

        
        /* This is saving the trip object to the database. */
        trip = await trip.save();

        existDriver.updateOne({balance:existDriver.balance + trip.price}).then();
       
        
        /* This is updating the driver and customer objects with the trip id. */
        await existDriver.updateOne({ $push: { trips: [trip.id] }});
        await existCustomer.updateOne({ $push: { trips: [trip.id] }});

        /* This is sending the trip object to the client. */
        res.send(trip);
    
    } catch (error) {
        /* This is sending a 500 error to the client. */
        res.status(500).json({error: error.message});
    }


});


/* This is exporting the tripCreateRouter object. */
module.exports = tripCreateRouter;