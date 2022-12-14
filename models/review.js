/* Importing the mongoose module. */
const mongoose = require("mongoose");


/* Creating a schema for the review model. */
const reviewSchema = mongoose.Schema({

    reviewText:{
        required: true,
        type: String
    },

    driverId: {
        required: true ,
        type: mongoose.ObjectId
    },

    customerId: {
        required: true ,
        type: mongoose.ObjectId
    },

    rating:{
        required: true,
        type: Number,
    },

    tripId:{
        require:true,
        type: mongoose.ObjectId
    },
    
    createDate:{
        type: Date,
        default: Date.now,
    }


    
});



/* Creating a model for the review schema. */
const Review = mongoose.model("Review", reviewSchema);


/* Exporting the Review model to be used in other files. */
module.exports = Review;