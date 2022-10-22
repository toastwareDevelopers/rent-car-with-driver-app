const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    
    phoneNumber:{
        required: true,
        type: String,
        trim: true,
        
        validate:{
            validator: function(value){
                const phoneFormat = /^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/;
                return value.match(phoneFormat);
            },
            message: "Invalid Phone Number",
        }
    },

    email:{
        require: true,
        type: String,
        trim: true,
        validate:{
            validator: function(value){
                const emailFormat = /^[a-zA-Z0-9_.+]*[a-zA-Z][a-zA-Z0-9_.+]*@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
                return value.match(emailFormat);
            },
            message: "Please enter a valid email adress",
        },
    },

    password:{
        required: true,
        type: String,
        trim: true,
    },

    name:{
        required: true,
        type: String,
        trim: false,
    },

    surname:{
        required: true,
        type: String,
        trim: true,
    },

    birthDate:{
        required: true,
        type: Date,
    },
    gender:{
        required: true,
        type: String,
        //enum: "homme" || "femme",
    },
    nationalId:{
        required: true,
        type: String,
        trim: true,
        
    },
    passportNumber:{
        type: String,
        trim: true,
    },
    location:{
        required: true,
        type: String,
        trim: true,
    },
    sicilNo:{
        //required: true,
        type: String,
        trim: true,
    },

    rating:{
        type: Number,
    },
    
    hourlyPrice:{
        type: Number,
    },

    driverLicenceYear:{
        type: Date, 
    },

    languages:{
        type: String,
    },

    info:{
        type: String,
    },
    
    

    carInfo:{
        
        planteNumber:{
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
    },

    avatar:{
        type: Buffer,
    },

});


const Driver = mongoose.model("Driver",userSchema);
module.exports = Driver;