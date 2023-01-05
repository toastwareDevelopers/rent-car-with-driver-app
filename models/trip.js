const mongoose = require("mongoose");


const tripSchema = ({
    
    driverId: {
        type:mongoose.Schema.Types.ObjectId,
        ref:'Driver',},

    customerId: {
        type:mongoose.Schema.Types.ObjectId,
        ref:'Customer',},

    startDate: Date,

    endDate: Date,

    location: String,

    price: Number,

    reviewId: mongoose.ObjectId
    
});

const Trip = mongoose.model("Trip",tripSchema);
module.exports = Trip;