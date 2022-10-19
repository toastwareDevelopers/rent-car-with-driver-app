const express = require('express');
const User = require("../models/user");

const bcryptjs = require('bcryptjs');

const authRouter = express.Router();

authRouter.post('/api/signup', async function(req,res){

    try{
        
        const {name,email,password} = req.body;

        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(400).json({msg:"User with same e-mail already exists!"});
        }
        
        const hashedPassword = await bcryptjs.hash(password,8);

        let user = new User({
            email,
            password: hashedPassword,
            name,
        })
        
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({error: e.message});
    }

    
});

authRouter.post('/api/signin',async function(req,res){
    try {
        
        const {email,password} = req.body;

        const user = await User.findOne({email});

        if(!user){
            return res.status(400).json({msg:"Invalid E-Mail"});
        }

        const isMatch = await bcryptjs.compare(password,user.password);

        if(!isMatch) return res.status(400).json({msg:"User password is not correct"});

        res.json(user._id);
        
    } catch (error) {
        res.status(500).json({error:error.message});
    }
});

module.exports = authRouter;