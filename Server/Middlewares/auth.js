const jwt=require ('jsonwebtoken');
const auth=async(req,res,next)=>{
    try{

        const token=req.header["x-auth-token"];
        if(!token)
        return res.status(402).json({msg:"No auth token ,access denied !"});

        const verified =jwt.verify(token,"passworKey");
      if(!verified)return res.status(401).json({msg:"Token verfication failed ,authorization denied"});

      req.user=verified.id ;
      req.token=token;
      //to send to next callback function
        next();
       
    }catch(err){
        res.status(500).json({error:err.message});
    }
}

module.exports= auth ;