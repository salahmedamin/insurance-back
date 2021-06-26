const { PrismaClient } = require("@prisma/client")
const prisma = new PrismaClient()

module.exports = async(req,res,next)=>{
    const {authed} = req,
    {entID,entMatricule} = req.body
    if(!(entID && entMatricule)) res.end(JSON.stringify({error:true,message:"Missing parameters"}))
    else{
        if(authed.type == "entreprise"){
            const insured = await prisma.entreprise.findFirst({
                where:{
                    id: parseInt(entID),
                    matFiscal:parseInt(entMatricule)
                }
            })
            if(insured?.id == authed.id) next()
            else res.end(JSON.stringify({error:true,message:"Cannot access this enterprise while not being it itself !"}))
        }
        else res.end(JSON.stringify({error:true,message:"Not a sub-insured !"}))
    }
}