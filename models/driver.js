<<<<<<< HEAD
const mongoose = require("mongoose");

const userSchema = mongoose.Schema({

    role:{
        type: String,
        default:"driver",
    },
    
    phoneNumber:{
        required: true,
        type: String,
        trim: true,
        
        validate:{
            validator: function(value){
=======
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
>>>>>>> feature/backend/customer
                const phoneFormat = /^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/;
                return value.match(phoneFormat);
            },
            message: "Invalid Phone Number",
        }
    },

<<<<<<< HEAD
    email:{
        require: true,
        type: String,
        trim: true,
        validate:{
            validator: function(value){
=======
    email: {
        require: true,
        type: String,
        trim: true,
        validate: {
            validator: function (value) {
>>>>>>> feature/backend/customer
                const emailFormat = /^[a-zA-Z0-9_.+]*[a-zA-Z][a-zA-Z0-9_.+]*@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
                return value.match(emailFormat);
            },
            message: "Please enter a valid email adress",
        },
    },

<<<<<<< HEAD
    password:{
=======
    password: {
>>>>>>> feature/backend/customer
        required: true,
        type: String,
        trim: true,
    },

<<<<<<< HEAD
    name:{
=======
    name: {
>>>>>>> feature/backend/customer
        required: true,
        type: String,
        trim: false,
    },

<<<<<<< HEAD
    surname:{
=======
    surname: {
>>>>>>> feature/backend/customer
        required: true,
        type: String,
        trim: true,
    },

<<<<<<< HEAD
    birthDate:{
=======
    birthDate: {
>>>>>>> feature/backend/customer
        required: true,
        type: Date,
    },

<<<<<<< HEAD
    gender:{
        required: true,
        type: String,
        enum: ["Female","Male"],
    },

    nationalId:{
        required: true,
        type: String,
        trim: true,
        
    },

    passportNumber:{
=======
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
>>>>>>> feature/backend/customer
        type: String,
        trim: true,
    },

<<<<<<< HEAD
    location:{
=======
    location: {
>>>>>>> feature/backend/customer
        required: true,
        type: String,
        trim: true,
    },
<<<<<<< HEAD
    
    bio:{
        type: String,
    },
    
    skills:{
        type: [String],
    },

    languages:{
=======

    bio: {
        type: String,
    },

    skills: {
        type: [String],
    },

    languages: {
>>>>>>> feature/backend/customer
        type: [String],

    },

<<<<<<< HEAD
    licenceNumber:{
=======
    licenceNumber: {
>>>>>>> feature/backend/customer
        //required: true,
        type: String,
        trim: true,
    },

<<<<<<< HEAD
    licenceYear:{
        type: Date, 
    },

    carInfo:{
        
        lisenceNumber:{
            type: String,
        },

        lisenceYear:{
            type: Date,
        },

        plateNumber:{
            type: String,
        },
        brand:{
            type: String,
        },
        model:{
            type: String,
        },
        year:{
            type: String,
        },
        color:{
            type: String,
        },
        photos:{
=======
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
>>>>>>> feature/backend/customer
            type: [Buffer],
        }
    },

<<<<<<< HEAD
    rating:{
        type: Number,
    },
    
    hourlyPrice:{
        type: Number,
    },

    taxNumber:{
        type: String,
    },

    avatar:{
        type: Buffer,
    },

});


const Driver = mongoose.model("Driver",userSchema);
=======
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
>>>>>>> feature/backend/customer
module.exports = Driver;