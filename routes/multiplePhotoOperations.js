const express = require('express');
const Driver = require("../models/driver");
const multiplePhoto = express.Router();

multiplePhoto.get('/api/driver/carPhotos',async function(req,res){
    try {
        const id = req.body.id;
        const index = req.body.index;
        let driver = await Driver.findById(id,
            {carPhotos: 1})

            res.send(driver.carPhotos[index])
    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({error: error.message});
    }


});


multiplePhoto.post('/api/driver/carPhotos',async function(req,res){
    try {
        const id = req.body.id;
        const photo = req.body.photo;
        let drivers = await Driver.findById(id,
            {carPhotos: 1})

            await drivers.updateOne(
                { $push: { carPhotos: [photo] } }
             )      
            res.sendStatus(200)
    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({error: error.message});
    }


});

multiplePhoto.post('/api/driver/carPhotos/delete',async function(req,res){
    try {
        const id = req.body.id;
        let drivers = await Driver.findById(id,
            {carPhotos: 1})

            await drivers.updateOne(
                { $unset: { carPhotos : ""} }
             )      
            res.sendStatus(200)
    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({error: error.message});
    }


});



/* Exporting the router object. */
module.exports = multiplePhoto; 

