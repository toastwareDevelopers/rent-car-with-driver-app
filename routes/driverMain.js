/* This is importing the express module. */
const express = require('express');


/* Importing the driver model. */
const Driver = require("../models/driver");
const Trip = require("../models/trip");
const Customer = require('../models/customer');


const driverMainRouter = express.Router();

driverMainRouter.get('/api/driver/activeTrip' ,async function (req, res) {

    try {

    
    const _id = req.query.ID;

    //console.log(_id);

    const model = await Driver.findById(_id);

    

    if(!model) return  res.status(400).json({msg: "There is not a model with this id"});

        
    const currentDate = Date.now();

    //console.log(model.trips);

    //console.log(currentDate);

    for (let index = 0; index < model.trips.length; index++) {
        
        const activeTrip = await Trip.findById(model.trips[index]);
        if(!activeTrip) continue; // BURASI SİLİNECEK 
        if(activeTrip.startDate < currentDate && activeTrip.endDate > currentDate){
            //console.log(currentDate);
            
            
            const activeCustomer = await Customer.findById(activeTrip.customerId);
            respond = activeTrip.toObject();
            respond.customerName = activeCustomer.name;
            respond.customerSurname = activeCustomer.surname;
            respond.profile_image64 = activeCustomer.profile_image64;
            respond.birthDate = activeCustomer.birthDate;

            return res.send(respond);
        }
        
    }

    return res.status(400).json({msg:"There is no active trip"});

        
    } catch (error) {
        return res.status(500).json({error:error.message});
    }

    
});



driverMainRouter.get('/api/driver/withdraw' ,async function (req, res) {

    const _id = req.query.ID;

    const model = await Driver.findById(_id);

    //console.log(model)

    if(!model) return res.status(400).json({msg: "There is not a driver with this id"});

    if(model.balance == 0) return res.status(400).json({msg: "There is no money in balance"});

    await model.updateOne({balance:0});

    return res.sendStatus(200);

});

module.exports = driverMainRouter;


