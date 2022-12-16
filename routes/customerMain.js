const express = require('express');
const Customer = require("../models/customer");
const Driver = require("../models/driver");
const Trip = require('../models/trip');

const CustomerProfileRouter = express.Router();


CustomerProfileRouter.post('/customer/main', async function (req, res) {


    try {
        var todayDate = new Date().toISOString()
        const { _id, location, gender, language, hourlyPriceStart, hourlyPriceEnd, ratingStart, ratingEnd, ageStart,
            ageEnd, carYearStart, carYearEnd } = req.body;

        const person = await Customer.findById(_id);

        let drivers = await Driver.find({},
            { _id: 1, birthDate: 1, gender: 1, location: 1, languages: 1, rating: 1, hourlyPrice: 1, "carInfo.year": 1 })



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
                        if (!flag_l && (drivers[step].languages[i] == language)) {
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
                    if (!((drivers[step].gender).toLowerCase() == gender.toLowerCase())) {

                        drivers.splice(step, 1)
                        flag = 1;
                    }
            }

            if (!flag) {
                if (location != undefined)
                    if (!((drivers[step].location).toLowerCase() == location.toLowerCase())) {

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
        var rand_number = []
        for (var i = 0; i < drivers.length; ++i) {

            var temp = Math.floor(Math.random() * drivers.length)
            if (rand_number.indexOf(temp) === -1) rand_number.push(temp);
            else i = i - 1;
        }

        if (person) {
                res.send(person + 
                    drivers[(rand_number[0])] + drivers[(rand_number[1])]+ 
                    drivers[(rand_number[2])] + drivers[(rand_number[3])]+ 
                    drivers[(rand_number[4])] + drivers[(rand_number[5])]+ 
                    drivers[(rand_number[6])] + drivers[(rand_number[7])]+ 
                    drivers[(rand_number[8])] + drivers[(rand_number[9])]+ 
                    drivers[(rand_number[10])] + drivers[(rand_number[11])]+ 
                    drivers[(rand_number[12])] + drivers[(rand_number[13])]+ 
                    drivers[(rand_number[14])] + drivers[(rand_number[15])]+ 
                    drivers[(rand_number[16])] + drivers[(rand_number[17])]+ 
                    drivers[(rand_number[18])] + drivers[(rand_number[19])])
         }
  
        else {

            return res.status(404).json({ msg: "Page not found" });
        }

    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

CustomerProfileRouter.get('/customer/activeTrip' ,async function (req, res) {

    const _id = req.query.ID;

    const model = await Customer.findById(_id);

    if(!model) return  res.status(400).json({msg: "There is not a model with this id"});

    const currentDate = Date.now();

    for (let index = 0; index < model.trips.length; index++) {

        if(model.trips[index].startDate > currentDate && element.trips[index].endDate < currentDate){
            
            const activeTrip = await Trip.findById(model.trips[index]);
            const activeDriver = await Driver.findById(activeTrip.customerId);
            respond = activeTrip.toObject();
            respond.driverName = activeDriver.name;
            respond.driverSurname = activeDriver.surname;
            respond.profile_image64 = activeDriver.profile_image64;
            respond.birthDate = activeDriver.birthDate;

            return res.send(respond);
        }
        
    }

});

module.exports = CustomerProfileRouter; 
