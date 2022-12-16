/* Importing the mongoose module. */
const mongoose = require("mongoose");

/* Creating a schema for the customer model. */
const adminSchema = mongoose.Schema({

    role: {
        type: String,
        default: "admin",
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
});


/* Creating a model named Admin with the schema adminSchema. */
const Admin = mongoose.model("Admin", adminSchema);

/* Exporting the Admin model to be used in other files. */
module.exports = Admin;
