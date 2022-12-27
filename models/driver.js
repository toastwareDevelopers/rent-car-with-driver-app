/* Importing the mongoose library. */
const mongoose = require("mongoose");

/* Creating a schema for the driver model. */
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
        enum: ["Female","Male"],
    },

    nationalId:{
        required: true,
        type: String,
        trim: true,
        validate:{
            validator: function(value){
                const nationalIdFormat = /^[1-9][0-9]{10}$/;
                if(value.match(nationalIdFormat)){
                    
                    first = 0;
                    for (let index = 0; index <= 8; index+=2) {
                        first += Number(value.charAt(index));
                    }
                    first = first*7;
                    second = 0;

                    for (let index = 1; index <= 7; index+=2) {
                        second += Number(value.charAt(index));
                    }
                    
                    
                    

                    tenth = first-second;

                    
                    last = 0;
                    for (let index = 0; index < value.length-1; index++) {
                        last += Number(value.charAt(index));
                        

                    }


                    if((tenth % 10 == Number(value.charAt(9))) && (last%10 == Number(value.charAt(10)))){
                        return true;
                    }
                    
                }
                return false;
                
            },
            message: "Please enter a valid National ID",
        },
        
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
    
    bio:{
        type: String,
    },
    
    skills:{
        type: [String],
    },

    languages:{
        type: [String],

    },

    licenseNumber:{
        //required: true,
        type: String,
        trim: true,
        validate:{
            validator: function(value){
                const licenseNumberFormat = /^[0-9]{6}$/;
                return value.match(licenseNumberFormat);
            },
            message: "Please enter a valid Lisence Number",
        },
    },

    licenseYear:{
        type: Date, 
    },

    carInfo:{
        
        licenseNumber:{
            type: String,
            validate:{
                validator: function(value){
                    const carlicenseFormat = /^[A-Z]{2}[0-9]{6}$/;
                    return value.match(carlicenseFormat);
                },
                message: "Please enter a valid Car Lisence Number",
            },
        },

        licenseYear:{
            type: Date,
        },

        plateNumber:{
            type: String,
            validate:{
                validator: function(value){
                    const plateFormat = /^(0[1-9]|[1-7][0-9]|8[01])((\s?[a-zA-Z]\s?)(\d{4,5})|(\s?[a-zA-Z]{2}\s?)(\d{3,4})|(\s?[a-zA-Z]{3}\s?)(\d{2,3}))$/;
                    return value.match(plateFormat);
                },
                message: "Please enter a valid Plate Number",
            },
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
    
    carPhotos:{
        type: [String],
        },
    legalPhotos:{
        type: [String],
    },
    
    rating:{
        type: Number,
        default: "0",
        min: "0",
        max: "10"
    },
    
    hourlyPrice:{
        type: Number,
    },

    taxNumber:{
        type: String,
        validate:{
            validator: function(value){
                const taxFormat = /^[0-9]{10}$/;
                return value.match(taxFormat);
            },
            message: "Please enter a valid Tax Number",
        },
    },

    avatar:{
        type: Buffer,
    },

    trips:[mongoose.ObjectId],

    profile_image64 : {
        type: String,
    },
    reviews:[mongoose.ObjectId],
    
    isActive:{
        default:"false",
        type: Boolean,
    },

    mailActivision: {

        activisionKey: {
            type: Number,
        },
        activisionStatus: {
            type: Boolean,
        },
    },

});


/* Creating a model for the driver schema. */
const Driver = mongoose.model("Driver",userSchema);

/* Exporting the Driver model to be used in other files. */
module.exports = Driver;
