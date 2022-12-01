/* The above code is importing the express and bcryptjs modules. */
const express = require('express');
const bcryptjs = require('bcryptjs');

/* Importing the driver and customer models. */
const Driver = require("../models/driver");
const Customer = require('../models/customer');


/* Creating a new router object. */
const driverEditRouter = express.Router();


driverEditRouter.post('/api/edit/driver',async function(req,res){
    
    try {
        

        /* Destructuring the request body. */
        const{phoneNumber,_id,email,password,name,surname,birthDate,gender,nationalId,location,info,skills,languages,licenceNumber,licenceYear,carInfo:{carlisenceNumber,carlisenceYear,plateNumber,brand,model,year,color,photos},hourlyPrice,taxNumber} = req.body;

        /* Finding the driver with the given ID. */
        const person = await Driver.findById(_id);
        
        console.log(_id);

        /* Checking if there is a person with the given ID. If there is not, it is returning a message. */
        if(!person){
            return res.status(400).json({msg: "There is not a person with this ID"});
        }



        /* Checking if the phone number is not undefined and if it is not equal to the person's phone
        number. If it is not, it is checking if there is a person with the given phone number. If there
        is, it is returning a message. If there is not, it is updating the person's phone number. */
        if((phoneNumber != undefined) && (phoneNumber != person.phoneNumber)){
            check = await Driver.findOne({phoneNumber})

            if(check){
                return res.status(400).json({msg: "There is a person with same phone number already"});
            }

            check = await Customer.findOne({phoneNumber});

            if(check){
                return res.status(400).json({msg: "There is a person with same phone number already"});
            }
            
            await person.updateOne({phoneNumber:phoneNumber},{runValidators:true});
        }



        /* Checking if the email is not undefined and if it is not equal to the person's email. If it is
        not, it is checking if there is a person with the given email. If there is, it is returning a
        message. If there is not, it is updating the person's email. */
        if((email != undefined) && (email != person.email)){
            
            check = await Driver.findOne({email})

            if(check){
                return res.status(400).json({msg: "There is a person with same email already"});
            }

            check = await Customer.findOne({email});

            if(check){
                return res.status(400).json({msg: "There is a person with same email already"});
            }
            
            await person.updateOne({email:email},{runValidators:true});
        }


        /* Checking if the password is not undefined. If it is not, it is hashing the password and updating
        the person's password. */
        if(password != undefined){
            
            const hashedPassword = await bcryptjs.hash(password,8);

            await person.updateOne({password:hashedPassword},{runValidators:true});
        }

        /* Checking if the name is not undefined and if it is not equal to the person's name. If it is not,
        it is updating the person's name. */
        if((name != undefined) && (name != person.name)){
                    
            await person.updateOne({name:name},{runValidators:true});
        }

        
        /* Checking if the surname is not undefined and if it is not equal to the person's surname. If it
        is not, it is updating the person's surname. */
        if((surname != undefined) && (surname != person.surname)){
                    
            await person.updateOne({surname:surname},{runValidators:true});
        }

        /* Checking if the birthDate is not undefined and if it is not equal to the person's birthDate. If
        it is not, it is updating the person's birthDate. */
        if((birthDate != undefined) && (birthDate != person.birthDate)){        
            
            await person.updateOne({birthDate:birthDate},{runValidators:true});
        }

    
        /* Checking if the gender is not undefined and if it is not equal to the person's gender. If it is
        not, it is updating the person's gender. */
        
        if((gender != undefined) && (gender != person.gender)){        
            
            await person.updateOne({gender:gender},{runValidators:true});
        }


        /* Checking if the info is not undefined. If it is not, it is updating the person's info. */
        if(info != undefined){        
            await person.updateOne({info:info},{runValidators:true});
        }

        /* Checking if the location is not undefined and if it is not equal to the person's location.
        If it is not, it is updating the person's location. */
        if((location != undefined) && (location != person.location)){        
            
            await person.updateOne({location:location},{runValidators:true});
        }

        /* Checking if the skills is not undefined and if it is not equal to the person's skills. If it
        is not, it is updating the person's skills. */
        if((skills != undefined) && (skills != person.skills)){        
            
            await person.updateOne({skills:skills},{runValidators:true});
        }

        /* Checking if the languages is not undefined and if it is not equal to the person's languages.
        If it is not, it is updating the person's languages. */
        if((languages != undefined) && (languages != person.languages)){        
            
            await person.updateOne({languages:languages},{runValidators:true});
        }

        /* Checking if the licenceNumber is not undefined and if it is not equal to the person's
        licenceNumber. If it is not, it is updating the person's licenceNumber. */
        if((licenceNumber != undefined) && (licenceNumber != person.licenceNumber)){        
            
            await person.updateOne({licenceNumber:licenceNumber},{runValidators:true});
        }

        /* Checking if the licenceYear is not undefined and if it is not equal to the person's
        licenceYear. If it is not, it is updating the person's licenceYear. */
        if((licenceYear != undefined) && (licenceYear != person.licenceYear)){        
            
            await person.updateOne({licenceYear:licenceYear},{runValidators:true});
        }

        /* Checking if the carlisenceNumber is not undefined and if it is not equal to the person's
        carlisenceNumber. If it is not, it is updating the person's carlisenceNumber. */
        if((carlisenceNumber != undefined) && (carlisenceNumber != person.carInfo.lisenceNumber)){        
            
            await person.updateOne({"carInfo.licenceNumber":carlisenceNumber},{runValidators:true});
        }

        /* Checking if the carlisenceYear is not undefined and if it is not equal to the person's
        carlisenceYear. If it is not, it is updating the person's carlisenceYear. */
        if((carlisenceYear != undefined) && (carlisenceYear != person.carInfo.lisenceYear)){        
            
            await person.updateOne({"carInfo.lisenceYear":carlisenceYear},{runValidators:true});
        }

        /* Checking if the plateNumber is not undefined and if it is not equal to the person's
        plateNumber. If it is not, it is updating the person's plateNumber. */
        if((plateNumber != undefined) && (plateNumber != person.carInfo.plateNumber)){        
            
            await person.updateOne({"carInfo.plateNumber":plateNumber},{runValidators:true});
        }

        /* Checking if the brand is not undefined and if it is not equal to the person's
        brand. If it is not, it is updating the person's brand. */
        if((brand != undefined) && (brand != person.carInfo.brand)){        
            
            await person.updateOne({"carInfo.brand":brand},{runValidators:true});
        }

        /* Checking if the model is not undefined and if it is not equal to the person's
        model. If it is not, it is updating the person's model. */
        if((model != undefined) && (model != person.carInfo.model)){        
            
            await person.updateOne({"carInfo.model":model},{runValidators:true});
        }

        /* Checking if the year is not undefined and if it is not equal to the person's
        year. If it is not, it is updating the person's year. */
        if((year != undefined) && (year != person.carInfo.year)){        
            
            await person.updateOne({"carInfo.year":year},{runValidators:true});
        }

        

        /* Checking if the color is not undefined and if it is not equal to the person's
        color. If it is not, it is updating the person's color. */
        if((color != undefined) && (color != person.carInfo.color)){        
            console.log(person.carInfo);
            await person.updateOne({"carInfo.color":color},{runValidators:true});
        }
        
        //TODO:TAHA
        /* if((photos != undefined) && (photos != person.carInfo.photos)){        
            
            await person.updateOne({carInfo:{photos:photos}},{runValidators:true});
        } */
        

        /* Checking if the hourlyPrice is not undefined and if it is not equal to the person's
        hourlyPrice. If it is not, it is updating the person's hourlyPrice. */
        if((hourlyPrice != undefined) && (hourlyPrice != person.hourlyPrice)){        
            
            await person.updateOne({hourlyPrice:hourlyPrice},{runValidators:true});
        }

        /* Checking if the taxNumber is not undefined and if it is not equal to the person's
        taxNumber. If it is not, it is updating the person's taxNumber. */
        if((taxNumber != undefined) && (taxNumber != person.taxNumber)){        
            
            await person.updateOne({taxNumber:taxNumber},{runValidators:true});
        }


        //TODO:TAHA
       /*  if((avatar != undefined) && (avatar != person.avatar)){        
            
            await person.updateOne({avatar:avatar},{runValidators:true});
        } */

        res.sendStatus(200)
    
    } catch (error) {
        res.status(500).json({error:error.message});
    }



});

/* Exporting the router object. */
module.exports = driverEditRouter; 