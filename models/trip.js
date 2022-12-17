const mongoose = require("mongoose");

const tripSchema = ({
    
    driverId: mongoose.ObjectId,

    customerId: mongoose.ObjectId,

    startDate: Date,

    endDate: Date,

    location: String,

    price: Number,

    reviewId: mongoose.ObjectId
    
});

const Trip = mongoose.model("Trip",tripSchema);
module.exports = Trip;