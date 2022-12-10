/* Importing the mongoose module. */
const mongoose = require("mongoose");

/* Creating a schema for the customer model. */
const msgSchema = mongoose.Schema({

    content:{
        required: true,
        type: String
    },

    senderID: {
        required: true ,
        type: mongoose.ObjectId
    },

    reciverID: {
        required: true ,
        type: mongoose.ObjectId
    },
    
    createDate:{
        type: Date,
        default: Date.now,
    }


    
});


/* Creating a model named Customer with the schema customerSchema. */
const Message = mongoose.model("Message", msgSchema);

/* Exporting the Customer model to be used in other files. */
module.exports = Message;