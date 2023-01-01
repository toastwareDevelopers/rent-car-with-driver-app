/* This is importing the express module. */
const express = require('express');

/* Importing the driver model. */
const Driver = require("../models/driver");

const driverMainRouter = express.Router();

driverMainRouter.get('/driver/activeTrip' ,async function (req, res) {

    const _id = req.query.ID;

    //console.log(_id);

    const model = await Driver.findById(_id);

    

    if(!model) return  res.status(400).json({msg: "There is not a model with this id"});
    
    const currentDate = Date.now();

    //console.log(currentDate);

    for (let index = 0; index < model.trips.length; index++) {
        
        const activeTrip = await Trip.findById(model.trips[index]);
        if(activeTrip.startDate < currentDate && activeTrip.endDate > currentDate){
            //console.log(currentDate);
            
            
            const activeDriver = await Driver.findById(activeTrip.driverId);
            respond = activeTrip.toObject();
            respond.driverName = activeDriver.name;
            respond.driverSurname = activeDriver.surname;
            respond.profile_image64 = activeDriver.profile_image64;
            respond.birthDate = activeDriver.birthDate;

            return res.send(respond);
        }
        
    }

    return res.status(400).json({msg:"There is no active trip"});

});

module.exports = driverMainRouter;


