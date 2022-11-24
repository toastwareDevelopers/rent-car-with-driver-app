const mongoose = require("mongoose");

const eventSchema = ({
    
    driverId: mongoose.ObjectId,

    customerId: mongoose.ObjectId,

    startDate: Date,

    endDate: Date,

    location: String,

    price: Number
    
});

const Event = mongoose.model("Event",eventSchema);
module.exports = Event;