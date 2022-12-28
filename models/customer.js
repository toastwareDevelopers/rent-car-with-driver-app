/* Importing the mongoose module. */
const mongoose = require("mongoose");

/* Creating a schema for the customer model. */
const customerSchema = mongoose.Schema({

    role: {
        type: String,
        default: "customer", 
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
        enum: ["Female", "Male"],
    },

    nationalId: {
        type: String,
        trim: true,
        validate: {
            validator: function (value) {
                const nationalIdFormat = /^[1-9][0-9]{10}/;
                if(value == "null")
                    return value.match("null");
                return value.match(nationalIdFormat);

            },
            message: "Please enter a valid National ID",
        },

    },

    passportNumber: {
        type: String,
        trim: true,
        validate: {
            validator: function (value) {
                const passportNumber = /[a-zA-Z]{2}[0-9]{7}/;
                if(value == "null")
                    return value.match("null");
                return value.match(passportNumber);
            },
            message: "Please enter a valid Passport number",
        },
    },

    profile_image64 : {
        type: String,
        default:"null"
    },
    
    mailActivision: {

        activisionKey: {
            type: Number,
        },
        activisionStatus: {
            type: Boolean,
        },
    },

    registerDate: {
        type: String,
    },

    trips: [mongoose.ObjectId],

    reviews:[mongoose.ObjectId],

    messageHistory: [mongoose.ObjectId],
});


/* Creating a model named Customer with the schema customerSchema. */
const Customer = mongoose.model("Customer", customerSchema);

/* Exporting the Customer model to be used in other files. */
module.exports = Customer;
