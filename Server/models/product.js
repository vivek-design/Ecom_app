const  mongoose=require ("mongoose");

const ProductSchema=mongoose.Schema({
    name:{
        type:String,
        required: true,
        trim: true,

     },

     description:{
        type:String,
        required: true,
        trim: true,

     },



    //  images:{
    //     type:Array
    //  }


    //another way is to do it 
    images:[
        {
            type:String,
            required:true,


        },
    ],

    quantity:{
        type:Number,
        required:true,

    },

    price: {
        type:Number,
        required:true,

    },

    category:{
        type:String,
        required:true,

    },

    //ratin g




});

// Creating a Model: Once you have a schema defined,
// you can create a model using the mongoose.model
// function. This function takes two arguments: the 
// name of the collection and the schema you've
// defined. This effectively creates a class-like
//  object that you can use to interact with the collection.

const Product=mongoose.model("Product",ProductSchema);
module.exports=Product;