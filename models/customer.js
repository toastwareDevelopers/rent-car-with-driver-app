/* Importing the mongoose module. */
const mongoose = require("mongoose");

/* Creating a schema for the customer model. */
const customerSchema = mongoose.Schema({

    role:{
        type: String,
        default:"customer",
    },

    phoneNumber: {
        required: true,
        type: String,
        trim: true,

        validate: {
            validator: function (value) {
                const phoneFormat = /^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/;
                return value.match(phoneFormat);
            },
            message: "Invalid Phone Number",
        }
    },

    email: {
        require: true,
        type: String,
        trim: true,
        validate: {
            validator: function (value) {
                const emailFormat = /^[a-zA-Z0-9_.+]*[a-zA-Z][a-zA-Z0-9_.+]*@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
                return value.match(emailFormat);
            },
            message: "Please enter a valid email adress",
        },
    },

    password: {
        required: true,
        type: String,
        trim: true,
    },

    name: {
        required: true,
        type: String,
        trim: false,
    },

    surname: {
        required: true,
        type: String,
        trim: true,
    },

    birthDate: {
        required: true,
        type: Date,
    },

    gender: {
        required: true,
        type: String,
        enum: ["Female","Male"],
    },

    nationalId: {
        required: true,
        type: String,
        trim: true,
    },

    passportNumber: {
        type: String,
        trim: true,
    },
    registerDate: {
        type: String,
    },
    trips:[mongoose.ObjectId],
});


/* Creating a model named Customer with the schema customerSchema. */
const Customer = mongoose.model("Customer", customerSchema);

/* Exporting the Customer model to be used in other files. */
module.exports = Customer;
