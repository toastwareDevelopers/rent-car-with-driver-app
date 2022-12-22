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
                
                temp = await Customer.findById(x.customerId);

                if(!temp) return res.status(400).json({msg:"Customeri silmisler databaseden"});
                y.customerName = temp.name;
                y.customerSurname = temp.surname;
                y.customerProfile_image64 = temp.profile_image64;

                temp = await Driver.findById(x.driverId);
                if(!temp) return res.status(400).json({msg:"Driveri silmisler databaseden"});

                y.driverName = temp.name;
                y.driverSurname = temp.surname;
                arrOfTrips.push(y);
            }
            
            return res.send(arrOfTrips);
        }

    } catch (error) {
        res.status(500).json({error: error.message});
    }

});

/* Exporting the router object. */
module.exports = getTripsRouter;