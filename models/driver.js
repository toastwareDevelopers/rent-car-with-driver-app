/* Importing the mongoose library. */
const mongoose = require("mongoose");

/* Creating a schema for the driver model. */
const userSchema = mongoose.Schema({

    role: {
        type: String,
        default: "driver",
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
        required: true,
        type: String,
        trim: true,

    },

    passportNumber: {
        type: String,
        trim: true,
    },

    location: {
        required: true,
        type: String,
        trim: true,
    },

    bio: {
        type: String,
    },

    skills: {
        type: [String],
    },

    languages: {
        type: [String],

    },

    licenceNumber: {
        //required: true,
        type: String,
        trim: true,
    },

    licenceYear: {
        type: Date,
    },

    carInfo: {

        lisenceNumber: {
            type: String,
        },

        lisenceYear: {
            type: Date,
        },

        plateNumber: {
            type: String,
        },
        brand: {
            type: String,
        },
        model: {
            type: String,
        },
        year: {
            type: String,
        },
        color: {
            type: String,
        },
        photos: {
            type: [Buffer],
        }
    },

    rating: {
        type: Number,
    },

    hourlyPrice: {
        type: Number,
    },

    taxNumber: {
        type: String,
    },

    avatar: {
        type: Buffer,
    },

    events: [mongoose.ObjectId],

});


/* Creating a model for the driver schema. */
const Driver = mongoose.model("Driver", userSchema);

/* Exporting the Driver model to be used in other files. */
module.exports = Driver;
