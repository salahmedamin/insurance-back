const { PrismaClient } = require(".prisma/client")
const prisma = new PrismaClient()

const jwt = require("jsonwebtoken")
const secret = require("../secret")
module.exports = async(req,res,next)=>{
    try{
        if(await prisma.blacklist_token.findFirst({
            where:{
                token: req["headers"].authorization
            }
        })){
            throw new Error()
        }
        const data = jwt.verify(req["headers"].authorization,secret)
        req.authed = data
        next()
    }
    catch(e){
        res.status(401).send({error:true,message:"Unauthorized Access"})
    }
}