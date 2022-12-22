/* Importing the express and mongoose packages. */
const express = require('express');
const { createServer } = require("http");
const { Server } = require("socket.io");
const mongoose = require("mongoose");


// IMPORTS FROM OTHER FILES
const loginAuthRouter = require("./routes/loginAuth");
const driverAuthRouter = require("./routes/driverAuth");
const driverEditRouter = require("./routes/driverEdit");
const customerAuthRouter = require("./routes/customerAuth");
const customerMainRouter = require("./routes/customerMain");
const customerEditRouter = require("./routes/customerEdit");
const tripCreateRouter = require("./routes/createTrip");
const getModelRouter = require("./routes/getModel");
const getTripsRouter = require("./routes/getTrips");
const getReviewsRouter = require("./routes/getReviews");
const reviewCreateRouter = require("./routes/createReview");
const adminDriverRequestRouter = require('./routes/adminDriverRequest.js');
const passwordResetRouter = require("./routes/passwordReset");
const adminAuthRouter = require('./routes/adminAuth.js');

/* Creating a server on port 3000. */
const PORT = 3000;

/* Creating an instance of the express server. */
const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer);
const connection = require('./db.js');

// middleware
app.use(express.json());
app.use(loginAuthRouter);
app.use(customerAuthRouter);
app.use(customerEditRouter);
app.use(customerMainRouter);
app.use(driverEditRouter);
app.use(driverAuthRouter);
app.use(tripCreateRouter);
app.use(getModelRouter);
app.use(getTripsRouter);
app.use(reviewCreateRouter);
app.use(getReviewsRouter);
app.use(adminDriverRequestRouter);
app.use(passwordResetRouter);
app.use(adminAuthRouter);

//connections
connection()

httpServer.listen(PORT, () => {
	console.log('connected ad port ' + PORT);
});


const Message = require("./models/message");
const Offer = require("./models/offer");


io.on("connection", (socket) => {
	console.log("User connected");

	socket.on('startChat', (msg) => {
		
		//console.log(msg);
		socket.join(msg.roomID);

		arr1 = Message.find({});

		arr2 = Offer.find({});

		arr3 = arr1.concat(arr2);

		io.to(socket.id).emit('old_messages', arr3);

		/* Message.find({
			roomID: msg.roomID
		  }).then((messages) => {

			let arr = new Array();
			arr.push(messages);
			

			arr.push(Offer.find({roomID: msg.roomID}))
			console.log(messages)
			io.to(socket.id).emit('old_messages', arr);
		  }).catch((err) => {
			console.log(err);
		  }); */
	});

	socket.on('sendmessage', (msg) => {
		console.log("sendmessage");
		//console.log(msg);

		io.to(msg.roomID).emit('sendmessage', msg);
		//console.log("ben burda patliyorum");
		let message = new Message({
			content: msg.content,
			senderID: msg.senderID,
			receiverID: msg.receiverID,
			roomID: msg.roomID,
		});

		

		message.save().catch((err) =>{
			console.log(err);
		});

		console.log("yo")
	});

	socket.on('offer', (offer) => {
		console.log(offer);
		io.to(offer.roomID).emit('offer',offer);

		let of = new Offer({
			driverId: offer.driverId,
			customerId: offer.customerId,
			startDate: offer.startDate,
			endDate: offer.endDate,
			location: offer.location,
			price: offer.price,
			offerDescription: offer.offerDescription,
    		status: offer.status

		});

		of.save().catch((err) =>{
			console.log(err);
		});

	})
	//console.log("hayir burda");

	socket.on('respond',(status) =>{
		console.log(status);
		io.to(socket.id).emit('status',status);
	})

	socket.on('disconnect', ()=>{
		console.log("User disconnected");
	});

});

