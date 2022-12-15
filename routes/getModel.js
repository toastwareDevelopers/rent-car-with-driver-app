/* Importing the express module. */
const express = require('express');


/* Importing the models from the models folder. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');
const Trip = require("../models/trip");
const Review = require('../models/review');

/* Creating a new router object. */
const getModelRouter = express.Router();

/* This is a route that will return the model with the given id. */

getModelRouter.get('/api/info',async function (req,res){

    try {
        
        /* Getting the id from the query string. */
        const _id = req.query.ID;
        
    
       
        /* Checking if the model is a customer. If it is, it returns the model. */
        model = await Customer.findById(_id);

        if(model){
            return res.send(model);
        }



        /* Checking if the model is a driver. If it is, it returns the model. */
        model = await Driver.findById(_id);

        if(model){
            return res.send(model);
        }


        
        /* Checking if the model is a trip. If it is, it returns the model. */
        model = await Trip.findById(_id);

        if(model){
            return res.send(model);
        }


        model = await Review.findById(_id);

        if(model){
            return res.send(model);
        }

        /* Returning a 400 status code and a message saying that there is not a model with the given
        id. */
        return res.status(400).json({msg: "There is not a model with this id"});


    } catch (error) {
        /* Returning a 500 status code and a json object with the error message. */
        res.status(500).json({error: error.message});
    }

});

/* Exporting the router object. */
module.exports = getModelRouter;


