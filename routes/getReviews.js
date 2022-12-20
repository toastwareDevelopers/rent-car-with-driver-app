/* This is importing the express module. */
const express = require('express');

/* Importing the models from the models folder. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');
const Trip = require("../models/trip");
const Review = require("../models/review");


/* Creating a new router object. */
const getReviewsRouter = express.Router();

getReviewsRouter.get('/api/getReviews',async function (req,res){

    try {
        
        /* Getting the id from the query string. */
        const _id = req.query.ID;

        console.log(_id)

         /* Checking if the model is a customer. If it is, it returns the model. */
        model = await Customer.findById(_id);

        if(!model) model = await Driver.findById(_id);

        //console.log( model)

        

        let arrOfReviews = new Array();

        if(model){
            
            for (let index = 0; index < model.reviews.length; index++) {
                
                x = await Review.findById( model.reviews[index]);

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
                y.driverProfile_image64 = temp.profile_image64;
               
                arrOfReviews.push(y);
                
                //console.log(temp.name);
            }
            
            //console.log(arrOfReviews);
            return res.send(arrOfReviews);
        }

       

        //console.log( model)

       

        
        /* Returning a 400 status code and a message saying that there is not a model with the given
        id. */
        return res.status(400).json({msg: "There is not a model with this id"});

    } catch (error) {
        res.status(500).json({error: error.message});
    }

});

/* Exporting the router object. */
module.exports = getReviewsRouter;