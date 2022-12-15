/* This is importing the express module. */
const express = require('express');

/* Importing the models from the models folder. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');
const Trip = require("../models/trip");
const { type } = require('express/lib/response');
const { JsonWebTokenError } = require('jsonwebtoken');

/* Creating a new router object. */
const getTripsRouter = express.Router();

getTripsRouter.get('/api/getTrips',async function (req,res){

    try {
        console.log("hi");
        /* Getting the id from the query string. */
        const _id = req.query.ID;

        console.log(_id)

         /* Checking if the model is a customer. If it is, it returns the model. */
        model = await Customer.findById(_id);

        

        let arrOfTrips = new Array();

        //if(!model) model = await Driver.findById(_id);
        

        if(model){
            
            for (let index = 0; index < model.trips.length; index++) {
                x = await Trip.findById( model.trips[index]);

                y = x.toObject();
                
                temp = await Customer.findById(x.customerId);
                y.customerName = temp.name;
                y.customerSurname = temp.surname;

                temp = await Driver.findById(x.driverId);

                y.driverName = temp.name;
                y.driverSurname = temp.surname;
                arrOfTrips.push(y);
                
                console.log(temp.name);
            }
            
            //console.log(arrOfTrips);
            return res.send(arrOfTrips);
        }

        
        /* Returning a 400 status code and a message saying that there is not a model with the given
        id. */
        return res.status(400).json({msg: "There is not a model with this id"});

    } catch (error) {
        res.status(500).json({error: error.message});
    }

});

/* Exporting the router object. */
module.exports = getTripsRouter;