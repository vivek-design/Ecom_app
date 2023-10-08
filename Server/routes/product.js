const express=require('express');
const productRouter=express.Router();
const auth=require('../Middlewares/auth');

//now we dont want our api call have body so we will use 
// query request we will use query string in order to process our request 
// lets understand with an example 
// out request api url will be /api/products?catagory=Essentials
// it can also be api/products:category=Essentials but in this method we will use it through request.params.essentials

productRouter.get('/api/products',admin,async(req,res)=>{
       
    
  try{

    
      const product=await Product.find({category:req.query.category});
      res.json(product);   
    }catch(e){

     res.status(500).message({error:e.message});
    }

});

//create a get requrest to search products and get them 
productRouter.get("/api/products/search/:name",auth,async(req,res)=>{
  try{

    // //accessing variables 
    // ///api/products/search/:hello/:great
    // console.log(req.params.great);
    // console.log(req.params.hello);


      const product=await Product.find({name:{$regex: req.params.name,options:"i"
    }});
      res.json(product);   
    }catch(e){

     res.status(500).message({error:e.message});
    }

});

module.exports=  productRouter;