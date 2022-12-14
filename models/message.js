
/* Importing the mongoose module. */
const mongoose = require("mongoose");


/* Creating a schema for the message model. */
const msgSchema = mongoose.Schema({

    content:{
        required: true,
        type: String
    },

    senderID: {
        required: true ,
        type: mongoose.ObjectId
    },

    receiverID: {
        required: true ,
        type: mongoose.ObjectId
    },

    roomID:{
        type: String,
    },
    
    createDate:{
        type: Date,
        default: Date.now,
    }


    
});


/* Creating a model for the message schema. */
const Message = mongoose.model("Message", msgSchema);


/* Exporting the Message model so that it can be used in other files. */
module.exports = Message;