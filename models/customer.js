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
        enum: ["Female", "female", "Male", "male",],
    },

    nationalId: {
        required: true,
        type: String,
        trim: true,
        // validate: {
        //     validator: function (value) {
        //         const nationalIdFormat = /^[1-9][0-9]{10}$/;
        //         if (value.match(nationalIdFormat)) {

        //             first = 0;
        //             for (let index = 0; index <= 8; index += 2) {
        //                 first += Number(value.charAt(index));
        //             }
        //             first = first * 7;
        //             second = 0;

        //             for (let index = 1; index <= 7; index += 2) {
        //                 second += Number(value.charAt(index));
        //             }




        //             tenth = first - second;


        //             last = 0;
        //             for (let index = 0; index < value.length - 1; index++) {
        //                 last += Number(value.charAt(index));


        //             }


        //             if ((tenth % 10 == Number(value.charAt(9))) && (last % 10 == Number(value.charAt(10)))) {
        //                 return true;
        //             }

        //         }
        //         return false;

        //     },
        //     message: "Please enter a valid National ID",
        // },

    },

    passportNumber: {
        type: String,
        trim: true,
        // validate: {
        //     validator: function (value) {
        //         const passportNumber = /[a-zA-Z]{2}[0-9]{7}/;
        //         return value.match(passportNumber);
        //     },
        //     message: "Please enter a valid Passport number",
        // },
    },

    registerDate: {
        type: String,
    },

    trips: [mongoose.ObjectId],
});


/* Creating a model named Customer with the schema customerSchema. */
const Customer = mongoose.model("Customer", customerSchema);

/* Exporting the Customer model to be used in other files. */
module.exports = Customer;
