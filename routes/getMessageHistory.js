/* This is importing the express module. */
const express = require('express');

/* Importing the models from the models folder. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');
const Message = require('../models/message');



/* Creating a new router object. */
const getMessageHistory = express.Router();

getMessageHistory.get('/api/getMessageHistory',async function (req,res){

    try {
        
        /* Getting the id from the query string. */
        const _id = req.query.ID;

        //isDriver = new Boolean(false);

        /* Checking if the model is a customer. If it is, it returns the model. */
        model = await Customer.findById(_id);

       /* Checking if the model is a customer. If it is, it returns the model. */
        if(!model) {
            model = await Driver.findById(_id);
            //isDriver = true;
        }

        /* Checking if the model is null. If it is, it returns a 400 status code and a message. */
        if(!model) return res.status(400).json({msg: "There is not a model with this id"});

        
        if(model){

            let arrOfHistory = new Array();
            
            for (let index = 0; index < model.messageHistory.length; index++) {
                
                if(model.role == "driver"){
                    x = await Customer.findById( model.messageHistory[index]);
                }

                else{
                    x = await Driver.findById( model.messageHistory[index]);
                }
                
                let result = new Object();

                //console.log(x);

                result.name = x.name;
                result.surname = x.surname;
                result.photo = x.profile_image64;

                str1 = new String(model._id);
                str2 = new String (x._id);

                roomid = new String();

                if(model.role == "driver") roomid = str1.concat(str2);
                else roomid = str2.concat(str1);


                //console.log(roomid)
                
                listOfMessages = await Message.find({roomID: roomid});

                result.last_message = listOfMessages[listOfMessages.length-1].content;
                result.last_message_time = listOfMessages[listOfMessages.length-1].createDate;

                //console.log(result)

                arrOfHistory.push(result);
                
            }
            
            return res.send(arrOfHistory);
        }

    } catch (error) {
        res.status(500).json({error: error.message});
    }

});

/* Exporting the router object. */
module.exports = getMessageHistory;