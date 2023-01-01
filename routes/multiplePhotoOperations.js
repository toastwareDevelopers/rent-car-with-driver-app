const express = require('express');
const Driver = require("../models/driver");
const multiplePhoto = express.Router();

multiplePhoto.get('/api/driver/carPhotos/getPhoto', async function (req, res) {
    try {
        const id = req.query.id;
        const index = req.query.index;
        const driver = await Driver.findById(id,
            { carPhotos: 1 })

        if(0 <= index && index <= driver.carPhotos.length){
            res.send(driver.carPhotos[index])
        }
        else{
            res.json( "" )
        }

    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({ error: error.message });
    }


});


multiplePhoto.post('/api/driver/carPhotos/add', async function (req, res) {
    try {
        const id = req.body.id;
        const photo = req.body.photo;
        let drivers = await Driver.findById(id,
            { carPhotos: 1 })

        await drivers.updateOne(
            { $push: { carPhotos: [photo] } }
        )
        res.sendStatus(200)
    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({ error: error.message });
    }


});

multiplePhoto.post('/api/driver/carPhotos/delete', async function (req, res) {
    try {
        const id = req.body.id;
        let drivers = await Driver.findById(id,
            { carPhotos: 1 })

        await drivers.updateOne(
            { $unset: { carPhotos: "" } }
        )
        res.sendStatus(200)
    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({ error: error.message });
    }


});

multiplePhoto.get('/api/driver/documentPhotos/getPhoto', async function (req, res) {
    try {
        const id = req.query.id;
        const index = req.query.index;
        let driver = await Driver.findById(id,
            { legalPhotos: 1 })

            if(0 <= index && index <= driver.legalPhotos.length){
                res.send(driver.legalPhotos[index])
            }
            else{
                res.json( "" )
            }

    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({ error: error.message });
    }


});


multiplePhoto.post('/api/driver/documentPhotos/add', async function (req, res) {
    try {
        const id = req.body.id;
        const photo = req.body.photo;
        let drivers = await Driver.findById(id,
            { legalPhotos: 1 })

        await drivers.updateOne(
            { $push: { legalPhotos: [photo] } }
        )
        res.sendStatus(200)
    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({ error: error.message });
    }


});

multiplePhoto.post('/api/driver/documentPhotos/delete', async function (req, res) {
    try {
        const id = req.body.id;
        let drivers = await Driver.findById(id,
            { legalPhotos: 1 })

        await drivers.updateOne(
            { $unset: { legalPhotos: "" } }
        )
        res.sendStatus(200)
    } catch (error) {
        /* Sending a 500 status code and the error message to the client. */
        res.status(500).json({ error: error.message });
    }


});

/* Exporting the router object. */
module.exports = multiplePhoto;

