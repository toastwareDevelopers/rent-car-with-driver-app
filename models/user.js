const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name:{
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true,
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
    password: {
        required: true,
        type: String,
        
    },

    address:{
        type: String,
        default: '',
    },
    type:{
        type:String,
        default: 'user',
    }
});

const User = mongoose.model("User",userSchema);
module.exports = User;