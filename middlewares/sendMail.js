const nodemailer = require("nodemailer");

async function sendMail(tomail, random, text) {

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
    if (random == -1) {
        // send mail with defined transport object
        let mailOptions = {
            from: 'toastwaredevelopers.7@gmail.com', // sender address
            to: tomail, // list of receivers
            subject: "WELCOME BABY✔", // Subject line
            // This would be the text of email body
            text: text
        };
    }
    else {
        // send mail with defined transport object
        let mailOptions = {
            from: 'toastwaredevelopers.7@gmail.com', // sender address
            to: tomail, // list of receivers
            subject: "WELCOME BABY✔", // Subject line
            // This would be the text of email body
            text: text + "\n\n VALİDATİON KEY:  " + random
        };
    }

    transporter.sendMail(mailOptions, (err, info) => {

        if (err) console.log(err)
    })
}


module.exports = sendMail;