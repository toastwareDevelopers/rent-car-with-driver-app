const express = require('express');
const Customer = require("../models/customer");
const Driver = require("../models/driver");

const CustomerProfileRouter = express.Router();


CustomerProfileRouter.post('/customer/main', async function (req, res) {
    

    try {

        const{_id,location,gender,language,hourlyPriceStart,hourlyPriceEnd,ratingStart,ratingEnd,ageStart,
            ageEnd,carYearStart,carYearEnd} = req.body;

            const person = await Customer.findById(_id);

        let drivers = await Driver.find({ }, 
            { _id : 1, birthDate : 1, gender: 1 , location :1, languages : 1, rating :1 , hourlyPrice: 1 , "carInfo.year" : 1})

              console.log("\n\n")

        for (let step = 0; step<drivers.length; step++) {

            if(!(hourlyPriceStart <= drivers[step].hourlyPrice && drivers[step].hourlyPrice <= hourlyPriceEnd)){

                drivers.splice(0,1)
            }
          }
          
          
          console.log("\n\n")
          for (let step = 0; step<drivers.length; step++) {

  
                  console.log(drivers[step].hourlyPrice)

            }
 
        if (person) {
            res.send(person+drivers[Math.floor(Math.random() * drivers.length)]
            +drivers[Math.floor(Math.random() * drivers.length)]+drivers[Math.floor(Math.random() * drivers.length)])
        }

        else {

            return res.status(404).json({ msg: "Page not found" });
        }

    } catch (error) {

        res.status(500).json({ error: error.message });
    }

});

module.exports = CustomerProfileRouter; 