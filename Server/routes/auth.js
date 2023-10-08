const express=require("express");
const User=require("../models/user");
const authRouter =express.Router();
const  bcryptjs=require('bcryptjs');
const jwt=require('jsonwebtoken');
const auth=require("../Middlewares/auth");
//signup route
authRouter.post('/signup', async(req,res)=>{
  try{

    const{name,email,password}=req.body;
    const existingUser=await User.findOne({email});

    if(existingUser){
      //chage the status code
      return res.status(400).json({msg:"User with same email alrady exists!"});
      
    }


    // 8 is salt 
 const hashedpassword=   await bcryptjs.hash(password,8);

    let user=new User({
      email: email,
     password:hashedpassword,
     name,
     
    });
    
    // adding user data into db 
    user=await user.save();
  return  res.status(200).json(user);
  }catch(err){
    
   return  res.status(500).json({error: err['message']});
  }
   
   
   
  });


  //signin route 
  //we are going to use jwt for singin functionality 
  //

  authRouter.post('/signin',async (req,res)=>{
    try{
      const{email,password}=req.body;
      const user=await User.findOne({email});
      if(!user){
        return res.status(400).json({msg:"User with this email does not exist!"});

      }

      //comparing passwords 

      const isMatch =await bcryptjs.compare(password,user.password);
      if(!isMatch){
        return res.status(400).json({msg:"Incorrect password"});
      }

     const token= jwt.sign({id:user._id},"passworKey");
     //... is derefrecing operator if we don't use it we will get most of those
     // unwanted fields hence we are reducing it  
     res.json({token,...user._doc});


    }catch(e){
     return  res.status(500).json({error:e.message});
    }
  });





  ///validating token 
  
  authRouter.post('/tokenIsvalid',async (req,res)=>{
    try{
        
      const token=req.headers('x-auth-token');
      if(!token)return res.json(false);
      const verified =jwt.verify(token,"passworKey");
      if(!verified)return res.json(false);

      const user=await Uset.findById(verified.id);
      if(!user)return res.json(false);
      res.json(true); 
    }catch(e){
      return  res.status(500).json({error:e.message});
    }
  });





  //get user data

  authRouter.get('/', auth,async (req,res)=>{
        try{
             const user=await User.findById(req.user);
             res.json({...user._doc,token:req.token});
           
        }catch(e){
          return  res.status(500).json({error:e.message});
        }
  });








module.exports=authRouter;