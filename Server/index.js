

//Imports from packages 

const express= require("express");
const mongoose=require("mongoose");
const db="mongodb+srv://Vaibhav:vaibhav123@cluster0.vcotonn.mongodb.net/?retryWrites=true&w=majority"
const authRouter=require("./routes/auth");
//Import from other files
const app=express();
app.use(express.json());
app.use( authRouter);

//middleware
//client -> middleware ->server ->client 


//connections 
//.then is the promise if we were in function we could have 
//used await and async but for now it then will be used to keep up the future 
mongoose.connect(db).then(()=>{
console.log ('Connection Successful');
}).catch((e)=>{
console.log(e);
});


//INIT
const PORT =3000;



//creating an api
app.listen(PORT,"0.0.0.0",()=>{
    //backtick present over the escape key 
    console.log(`Connected at port ${PORT}` );
});

