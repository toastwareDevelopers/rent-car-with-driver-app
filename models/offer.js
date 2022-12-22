/* Importing the mongoose module. */
const mongoose = require("mongoose");

const offerSch = new mongoose.Schema({
    
    type:{
        default:"offer",
        type:String,
    },

    driverId: mongoose.ObjectId,

    customerId: mongoose.ObjectId,

    startDate: Date,

    endDate: Date,

    location: String,

    price: Number,

    offerDescription: String,
    
    status: String
});

const Offer = mongoose.model("Offer",offerSch);
module.exports = Offer;