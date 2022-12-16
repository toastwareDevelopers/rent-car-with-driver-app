const nodemailer = require("nodemailer");

async function main() {
    // Generate test SMTP service account from ethereal.email
    // Only needed if you don't have a real mail account for testing
    let testAccount = await nodemailer.createTestAccount();

    // create reusable transporter object using the default SMTP transport
    let transporter = nodemailer.createTransport({
        service: "gmail",
        port: 587,
        secure: false, // true for 465, false for other ports
        auth: {
            user: 'toastwaredevelopers@gmail.com', // generated ethereal user
            pass: 'habilshield343*', // generated ethereal password
        },
    });

    // send mail with defined transport object
    let info = await transporter.sendMail({
        from: 'toastwaredevelopers@gmail.com', // sender address
        to: "toastwaredevelopers@gmail.com", // list of receivers
        subject: "Hello ✔", // Subject line
    });

    console.log("Message sent: %s", info.messageId);
    // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>

    // Preview only available when sending through an Ethereal account
    console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));
    // Preview URL: https://ethereal.email/message/WaQKMgKddxQDoou...
}





module.exports = main;