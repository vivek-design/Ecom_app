const express=require('express');
const adminRouter=express.Router();
const admin=require ('../Middlewares/admin');
const Product = require('../models/product');

adminRouter.post('/admin/add-product',admin, async(req,res)=>{
     

    try{
      
     const {name, description ,images,quantity, price ,category}=req.body;
        
     let Product= new Product({
        name,
        description,
        images,
        quantity,
        price,
        category,
     });

     Product= await Product.save();
     
     res.json(Product);


    }catch(e){

       res.status(500).json({error:e.message});
    }
}

);


adminRouter.get('/admin/get-products',admin,async(req,res)=>{
        try{
          const product=await Product.find({});
          res.json(product);   
        }catch(e){

         res.status(500).message({error:e.message});
        }

});

// Delete the product
adminRouter.post('/admin/delete-product',admin, async (req,res)=>{
      
   try{
       
      const {id}=req.body;
      let product=await Product.findByIdAndDelete(id);
    //saving the updated list in database



      res.json(product);


   }catch(e){
      res.status(500).message({error:e.message});
   }


   return res;
});

module.exports= adminRouter;
