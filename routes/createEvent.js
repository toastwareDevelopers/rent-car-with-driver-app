/* This is importing the express module. */
const express = require('express');

/* This is importing the driver, customer, and event models from the models folder. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');
const Event = require('../models/event');

/* This is creating a new router object. */
const eventCreateRouter = express.Router();


/* This is creating a new event. */
eventCreateRouter.post('/api/createEvent',async function(req,res){

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

        /* Creating a new event object with the data that was passed in the request body. */
        let event = Event({
            driverId,
            customerId,
            startDate,
            endDate,
            location,
            price
    
        });

        /* Saving the event object to the database. */
        event = await event.save();

       
        /* This is updating the driver and customer objects with the event id. */
        await existDriver.updateOne({ $push: { events: [event.id] }});
        await existCustomer.updateOne({ $push: { events: [event.id] }});

        /* Sending the event object to the client. */
        res.send(event);
    
    } catch (error) {
        /* This is sending a 500 error to the client. */
        res.status(500).json({error: error.message});
    }


});

/* This is exporting the eventCreateRouter object to be used in other files. */
module.exports = eventCreateRouter;