const express = require('express');
const Customer = require("../models/customer");
const Driver = require("../models/driver");

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
        var sentDrivers = []

        for (var i = 0; i < 20 && i < drivers.length; ++i) {
            sentDrivers.push(drivers[drivers.length * Math.random() | 0]);
        }

        res.send(sentDrivers)

    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

module.exports = CustomerProfileRouter; 
