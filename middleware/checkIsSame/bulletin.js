const { PrismaClient } = require("@prisma/client")
const prisma = new PrismaClient()

module.exports = async(req,res,next)=>{
    const {authed} = req,
    {bulletinUnique} = req.body
    if(!bulletinUnique) next()
    else{
        if(authed.type == "sousassure"){
            const {insured} = await prisma.bulletin.findFirst({
                where:{
                    unique:bulletinUnique
                },
                include:{
                    insured:true
                }
            })
            if(insured.id == authed.id) next()
            else res.end(JSON.stringify({error:true,message:"Cannot access this bulletin while not being the one who generated it !"}))
        }
        else res.end(JSON.stringify({error:true,message:"Not a sub-insured !"}))
    }
}