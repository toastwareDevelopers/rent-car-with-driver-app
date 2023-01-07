const nodemailer = require("nodemailer");

async function sendMail(tomail, password) {

    // Generate test SMTP service account from ethereal.email
    // Only needed if you don't have a real mail account for testing

    // create reusable transporter object using the default SMTP transport
    let transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
            user: 'toastwaredevelopers.7@gmail.com', // generated ethereal user
            pass: 'mdbwfhwbwvrlgfcx', // generated ethereal password
        },
    });
    let mailOptions;
    console.log(typeof password)
    if (password === 0) {
        // send mail with defined transport object
        mailOptions = {
            from: 'toastwaredevelopers.7@gmail.com', // sender address
            to: tomail, // list of receivers
            subject: "Welcome to RentaGO", // Subject line
            // This would be the text of email body
            text: "We wish you a pleasant journey"
        };
    }
    else if(password === 1) {
        // send mail with defined transport object
        mailOptions = {
            from: 'toastwaredevelopers.7@gmail.com', // sender address
            to: tomail, // list of receivers
            subject: "Welcome to RentaGO", // Subject line
            // This would be the text of email body
            text: "we wish you a good ride"
        };
    }
    else if(password === 2) {
        // send mail with defined transport object
        mailOptions = {
            from: 'toastwaredevelopers.7@gmail.com', // sender address
            to: tomail, // list of receivers
            subject: "Welcome to RentaGO", // Subject line
            // This would be the text of email body
            text: "document approval completed"
        };
    }
    else {
        // send mail with defined transport object
        mailOptions = {
            from: 'toastwaredevelopers.7@gmail.com', // sender address
            to: tomail, // list of receivers
            subject: "Password reset. | RentaGO", // Subject line
            // This would be the text of email body
            text:  "Your password has been reset." + "\n\nNew password:  " + password
        };
    }

    transporter.sendMail(mailOptions, (err, info) => {

        if (err) console.log(err)
    })
}


module.exports = sendMail;