/* Importing the express and mongoose packages. */
const express = require('express');
const { createServer } = require("http");
const { Server } = require("socket.io");
const mongoose = require("mongoose");


// IMPORTS FROM OTHER FILES
const loginAuthRouter = require("./routes/loginAuth");
const driverAuthRouter = require("./routes/driverAuth");
const driverEditRouter = require("./routes/driverEdit");
const driverMainRouter = require("./routes/driverMain");
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
const getMessageHistory = require('./routes/getMessageHistory')
const multiplePhoto = require('./routes/multiplePhotoOperations.js')
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
app.use(driverMainRouter);
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
app.use(getMessageHistory);
app.use(multiplePhoto);

//connections
connection()

httpServer.listen(PORT, () => {
	console.log('connected ad port ' + PORT);
});


const Message = require("./models/message");
const Offer = require("./models/offer");
const Trip = require('./models/trip');
const Driver = require('./models/driver');
const Customer = require('./models/customer');


Array.prototype.pushSorted = function(el, compareFn) {
	let index = (function(arr) {
	  var m = 0;
	  var n = arr.length - 1;
  
	  while(m <= n) {
		var k = (n + m) >> 1;
		var cmp = compareFn(el, arr[k]);
  
		if(cmp > 0) m = k + 1;
		  else if(cmp < 0) n = k - 1;
		  else {
			console.log(`m=${m} k=${k}`)
			return k;
		  };
	  }
  
  
	  return -m - 1;
	})(this);
  
	if (index >= 0)
	  this.splice(index, 0, el);
	else if (index < 0)
	  this.splice((index * -1) - 1, 0, el);
  
	return this.length;
  };






io.on("connection", (socket) => {
	console.log("User connected");

	socket.on('startChat', (msg) => {
		
		//console.log(msg);
		socket.join(msg.roomID);

		Message.find({
			roomID: msg.roomID
		  }).then((messages) => {

			Offer.find({roomID: msg.roomID}).then((offers)=>{

				for (let index = 0; index < offers.length; index++) {
					const element = offers[index];
					messages.pushSorted(offers[index], (a,b) => a.createDate - b.createDate);
				}
				
				//console.log(messages);

				io.to(socket.id).emit('old_messages', messages);
			}).catch((err) => {
				console.log(err);
			  });
			
			


		  }).catch((err) => {
			console.log(err);
		  }); 
	});

	socket.on('sendmessage', (msg) => {
		

		io.to(msg.roomID).emit('sendmessage', msg);
		
		let message = new Message({
			content: msg.content,
			senderID: msg.senderID,
			receiverID: msg.receiverID,
			roomID: msg.roomID,
		});

		

		message.save().catch((err) =>{
			console.log(err);
		});

		let driverID = msg.roomID.slice(0,24);
		//console.log(driverID);
		let customerID = msg.roomID.slice(24);
		//console.log(customerID);

		Driver.findById(driverID).then((existDriver) =>{

			//console.log(existDriver)
			
			x = existDriver.messageHistory.includes(customerID);
				
			if(!x)
				existDriver.updateOne({ $push: { messageHistory: [customerID] }}).then();

			

			
		}).catch((err)=>{console.log(err)});

		Customer.findById(customerID).then((existCustomer) =>{
			
			x = existCustomer.messageHistory.includes(driverID)
				
			if(!x)
				existCustomer.updateOne({ $push: { messageHistory: [driverID] }}).then();

			
		}).catch((err)=>{console.log(err)});;

		//console.log(message.id);
	});

	socket.on('offer', (offer) => {
		//console.log(offer);
		

		let of = new Offer({
			driverId: offer.driverId,
			customerId: offer.customerId,
			startDate: offer.startDate,
			endDate: offer.endDate,
			location: offer.location,
			price: offer.price,
			offerDescription: offer.offerDescription,
    		status: offer.status,
			roomID: offer.roomID,

		});

		of.save().catch((err) =>{
			console.log(err);
		});

		io.to(offer.roomID).emit('offer',of);

	})
	//console.log("hayir burda");

	socket.on('respondOffer',(response) =>{
		
		

		Offer.findById(response.offerId).then((tempOffer) =>{
			
			//console.log(tempOffer);

			tempOffer.updateOne({status:response.status}).then();

			// console.log(tempOffer);

			if(response.status == "Accepted"){
				let newTrip = new Trip({
					driverId: tempOffer.driverId,
	
					customerId: tempOffer.customerId,
	
					startDate: tempOffer.startDate,
	
					endDate: tempOffer.endDate,
	
					location: tempOffer.location,
	
					price: tempOffer.price,
				})
	
				newTrip.save();
				
				Driver.findById(tempOffer.driverId).then((existDriver) =>{
					existDriver.updateOne({ $push: { trips: [newTrip.id] }}).then();
					existDriver.updateOne({balance:existDriver.balance + tempOffer.price}).then();
				});

				Customer.findById(tempOffer.customerId).then((existCustomer) =>{
					existCustomer.updateOne({ $push: { trips: [newTrip.id] }}).then();
				});
			}
		
		
		});	
		io.to(response.roomID).emit('respondOffer',response);
	})

	socket.on('disconnect', ()=>{
		console.log("User disconnected");
	});

});





