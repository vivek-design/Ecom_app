const mongoose=require('mongoose');

const userSchema=mongoose.Schema({
    name:{
        type:String,
        require:true,
        trim:true,

    },

    email:{

        required:true,
        type:String,
        trim:true,
        validate:{
            validator:(value)=>{
                const re =
              /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
              
                  return value.match(re);
            },

            //message will only be run when the validator gets failed 

            message:"Please enter a valid email address"
        }

    },

    password:{
        required:true,
        type: String ,
        validate:{
            validator:(value)=>{
                 return value.length>6;
            },

            //message will only be run when the validator gets failed 

            message:"Please enter a valid password"
        }



    },


    address:{
        type: String,
        default:'',
    },


    type:{
        type:String,
        default:'user',
    }

    //cart

});

const User=mongoose.model('User',userSchema);
module.exports=User;
