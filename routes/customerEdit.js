const express = require('express');
const Customer = require("../models/customer");
const Driver = require("../models/driver");

const bcryptjs = require('bcryptjs');
const { findOneAndUpdate } = require('../models/customer');

const customerEditRouter = express.Router();



customerEditRouter.post('/api/edit/customer', async function (req, res) {

        try {
            const { NewphoneNumber,_id,NewEmail, NewPassword, NewName, NewSurname, NewBirthDate, NewGender, NewNationalId, NewPassportNumber } = req.body;
    
            const person = await Customer.findById(_id);
            
            console.log(person);
            console.log(NewPassword);
            console.log(person.password);
            
            if(!person){
                return res.status(400).json({msg: "There is not a person with this ID"});
            }

            if((NewphoneNumber != undefined) && (NewphoneNumber != person.phoneNumber)){
                
                check = await Driver.findOne({phoneNumber : NewphoneNumber})

                if(check){
                    return res.status(400).json({msg: "There is a person with same phone number already"});
                }
    
                check = await Customer.findOne({phoneNumber : NewphoneNumber});
    
                if(check){
                    return res.status(400).json({msg: "There is a person with same phone number already"});
                }

                await person.updateOne({phoneNumber:NewphoneNumber},{runValidators:true});
            }


            if((person.email !== NewEmail)&&(NewEmail !== undefined) ){
                check = await Driver.findOne({email:NewEmail})

                if(check){
                    return res.status(400).json({msg: "There is a person with same email already"});
                }
    
                check = await Customer.findOne({email:NewEmail});
    
                if(check){
                    return res.status(400).json({msg: "There is a person with same email already"});
                }
                
                await person.updateOne({email:NewEmail},{runValidators:true});

            }

            if((NewPassword !== undefined) ){
                const hashedPassword = await bcryptjs.hash(NewPassword, 8);
                await person.updateOne({password:hashedPassword},{runValidators:true});

            }
            
            if((person.name !== NewName)&&(NewName !== undefined) ){
                await person.updateOne({name:NewName},{runValidators:true});
                
            }
            
            if((person.surname !== NewSurname)&&(NewSurname !== undefined) ){
                await person.updateOne({surname:NewSurname},{runValidators:true});

            }

            if((person.birthDate !== NewBirthDate)&&(NewBirthDate !== undefined) ){
                await person.updateOne({birthDate:NewBirthDate},{runValidators:true});

            }

            if((person.gender !== NewGender)&&(NewGender !== undefined) ){
                await person.updateOne({gender:NewGender},{runValidators:true});

            }

            if((person.nationalId !== NewNationalId)&&(NewNationalId !== undefined) ){
                await person.updateOne({nationalId:NewNationalId},{runValidators:true});

            }

            if((person.passportNumber !== NewPassportNumber)&&(NewPassportNumber !== undefined) ){
                await person.updateOne({passportNumber:NewPassportNumber},{runValidators:true});

            }
                    

            res.sendStatus(200)
        } catch (error) {
            res.status(500).json({error: error.message});
        }
});


module.exports = customerEditRouter; 