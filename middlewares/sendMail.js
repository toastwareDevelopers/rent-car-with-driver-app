const nodemailer = require("nodemailer");
const jwt = require('jsonwebtoken');

async function main(tomail,profile) {

    console.log("okey")
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

    var random = Math.floor(Math.random() * 1234567890)
    await profile.updateOne({"mailActivision.activisionKey":random})
    await profile.updateOne({"mailActivision.activisionStatus":false})

    
    // send mail with defined transport object
    let mailOptions = {
        from: 'toastwaredevelopers.7@gmail.com', // sender address
        to: tomail, // list of receivers
        subject: "WELCOME BABY✔", // Subject line
        // This would be the text of email body
        text: "Hi! Just one more step to experience your RENTaCAR!.\n\n VALİDATİON KEY:  "  +  random
    };

    transporter.sendMail(mailOptions, (err, info) => {

        if (err) console.log(err)
        else console.log('mail gonderildi')
    })
}





module.exports = main;