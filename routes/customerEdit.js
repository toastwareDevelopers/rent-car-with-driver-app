const express = require('express');
const Customer = require("../models/customer");

const bcryptjs = require('bcryptjs');
const { findOneAndUpdate } = require('../models/customer');

const customerEditRouter = express.Router();



customerEditRouter.post('/api/edit/customer', async function (req, res) {

        try {

            const { NewphoneNumber,_id, NewEmail, NewPassword, NewName, NewSurname, NewBirthDate, NewGender, NewNationalId, NewPassportNumber } = req.body;
    
            profile = await Customer.findOne(_id);
            
            if(!profile){
                return res.status(400).json({msg: "There is not a person with this ID"});
            }

            if((profile.phoneNumber !== NewphoneNumber)&&(NewphoneNumber !== undefined) ){
                await Customer.findOneAndUpdate(_id,{phoneNumber : NewphoneNumber})

            }

            if((profile.email !== NewEmail)&&(NewEmail !== undefined) ){
                await Customer.findOneAndUpdate(_id,{email : NewEmail})

            }

            if((NewPassword !== undefined) ){
                const hashedPassword = await bcryptjs.hash(NewPassword, 8);
                await Customer.findOneAndUpdate(_id,{password : hashedPassword})

            }
            
            if((profile.name !== NewName)&&(NewName !== undefined) ){
                await Customer.findOneAndUpdate(_id,{name : NewName})
                
            }
            
            if((profile.surname !== NewSurname)&&(NewSurname !== undefined) ){
                await Customer.findOneAndUpdate(_id,{surname : NewSurname})

            }

            if((profile.birthDate !== NewBirthDate)&&(NewBirthDate !== undefined) ){
                await Customer.findOneAndUpdate(_id,{birthDate : NewBirthDate})

            }

            if((profile.gender !== NewGender)&&(NewGender !== undefined) ){
                await Customer.findOneAndUpdate(_id,{gender : NewGender})

            }

            if((profile.nationalId !== NewNationalId)&&(NewNationalId !== undefined) ){
                await Customer.findOneAndUpdate(_id,{nationalId : NewNationalId})

            }

            if((profile.passportNumber !== NewPassportNumber)&&(NewPassportNumber !== undefined) ){
                await Customer.findOneAndUpdate(_id,{passportNumber : NewPassportNumber})

            }
                    

            res.sendStatus(200)
        } catch (error) {
            res.status(500).json({error: error.message});
        }
});


module.exports = customerEditRouter; 
