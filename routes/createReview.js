/* This is importing the express module. */
const express = require('express');


/* This is importing the driver, customer, and trip models. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');
const Trip = require('../models/review');
const Review = require('../models/review');

/* This is creating a new router object. */
const reviewCreateRouter = express.Router();



/* This is creating a new trip. */
reviewCreateRouter.post('/api/createReview',async function(req,res){

    try { 
        
        /* This is destructuring the request body. */
        const {driverId,customerId,reviewText,rating,tripId} = req.body;
        
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

        const existTrip = await Trip.findById(tripId);

        if(!existTrip){
            return res.status(400).json({msg: "There is not a trip with this Trip ID"}); 
        }

        /* This is creating a new trip object with the data that was passed in the request body. */
        let review = Review({
            reviewText,
            driverId,
            customerId,
            rating,
            tripId
        });

        
        /* This is saving the trip object to the database. */
        review = await review.save();

        existDriver.rating = (review.rating + (existDriver.reviews.length)*existDriver.rating) / (existDriver.rating.length + 1);
       
        
        /* This is updating the driver and customer objects with the trip id. */
        await existDriver.updateOne({ $push: { reviews: [review.id] }});
        await existCustomer.updateOne({ $push: { reviews: [review.id] }});
        await existTrip.updateOne({reviewId:review.id});
    

        /* This is sending the trip object to the client. */
        res.send(review);
    
    } catch (error) {
        /* This is sending a 500 error to the client. */
        res.status(500).json({error: error.message});
    }


});


/* This is exporting the tripCreateRouter object. */
module.exports = reviewCreateRouter;