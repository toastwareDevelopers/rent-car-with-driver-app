const express = require('express');
const Customer = require("../models/customer");
const Driver = require("../models/driver");
const Trip = require('../models/trip');

const CustomerProfileRouter = express.Router();


CustomerProfileRouter.post('/customer/main', async function (req, res) {

    try {
        var todayDate = new Date().toISOString()
        const { location, gender, language, hourlyPriceStart, hourlyPriceEnd, ratingStart, ratingEnd, ageStart,
            ageEnd, carYearStart, carYearEnd } = req.body;

        let drivers = await Driver.find({},
            { _id: 1, birthDate: 1, gender: 1, location: 1, languages: 1, rating: 1, hourlyPrice: 1, "carInfo.year": 1,name:1,surname:1,bio:1,hourlyPrice:1,profile_image64:1 ,info:1})

        var flag
        var flag_l

        for (let step = 0; step < drivers.length; step++) {
            flag = 0;

            if (!flag && ((!((hourlyPriceStart == undefined | hourlyPriceStart <= drivers[step].hourlyPrice)
                && (drivers[step].hourlyPrice <= hourlyPriceEnd | hourlyPriceEnd == undefined))))) {
                drivers.splice(step, 1)
                flag = 1;
            }

            if (drivers[step].rating != undefined && !flag && ((!((ratingStart == undefined || ratingStart <= drivers[step].rating)
                && (drivers[step].rating <= ratingEnd || ratingEnd == undefined))))) {
                drivers.splice(step, 1)
                flag = 1;
            }

            if (!flag && ((!((ageStart == undefined ||
                ageStart <= (parseInt(todayDate) - drivers[step].birthDate.toLocaleDateString("en-US", { year: 'numeric' })))
                && ((parseInt(todayDate) - drivers[step].birthDate.toLocaleDateString("en-US", { year: 'numeric' }))
                    <= ageEnd || ageEnd == undefined))))) {
                drivers.splice(step, 1)
                flag = 1;
            }

            if (!flag && ((!((carYearStart == undefined || carYearStart <= parseInt(drivers[step].carInfo.year))
                && (parseInt(drivers[step].carInfo.year) <= carYearEnd || carYearEnd == undefined))))) {
                drivers.splice(step, 1)
                flag = 1;
            }

            if (!flag) {
                flag_l = 0
                for (let i = 0; i < drivers[step].languages.length; ++i) {
                    if (language != undefined) {
                        if (!flag_l && (drivers[step].languages[i] == language || language == "null")) {
                            flag_l = 1
                        }
                    }
                }
                if (!flag_l) {
                    drivers.splice(step, 1)
                    flag = 1
                }
            }

            if (!flag) {
                if (gender != undefined)
                    if (!((drivers[step].gender).toLowerCase() == gender.toLowerCase() || gender == "null")) {

                        drivers.splice(step, 1)
                        flag = 1;
                    }
            }

            if (!flag) {
                if (location != undefined)
                    if (!((drivers[step].location).toLowerCase() == location.toLowerCase() || location == "null")) {

                        drivers.splice(step, 1)
                        flag = 1;
                    }
            }

            if (flag) {
                step = step - 1
            }
        }

        //FOR BACKEND TEST
        // for (let step = 0; step < drivers.length; step++) {


        //     console.log(drivers[step].rating + " " + drivers[step].hourlyPrice + " " + drivers[step].carInfo.year +
        //         " " + (parseInt(todayDate) - drivers[step].birthDate.toLocaleDateString("en-US", { year: 'numeric' }))
        //         + " " + drivers[step].languages + " " + drivers[step].gender + " " + (drivers[step].location).toLowerCase())

        // }

        if(drivers.length < 20)
            res.send(drivers)
        else{
            var sentDrivers = []

            while(sentDrivers.length < 20) {
                tempDriver = drivers[drivers.length * Math.random() | 0];
                if (!sentDrivers.includes(tempDriver)){
                    sentDrivers.push(tempDriver);
                }
            }

            res.send(sentDrivers)
        }
    
    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

CustomerProfileRouter.get('/customer/activeTrip' ,async function (req, res) {

    const _id = req.query.ID;

    //console.log(_id);

    const model = await Customer.findById(_id);

    

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

module.exports = CustomerProfileRouter; 
