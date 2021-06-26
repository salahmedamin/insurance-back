const { PrismaClient } = require("@prisma/client")
const prisma = new PrismaClient()

module.exports = async(req,res,next)=>{
    const {authed} = req,
    {id,matricule} = req.authed
    if(!(id && matricule)) res.end(JSON.stringify({error:true,message:"Missing parameters"}))
    else{
        if(authed.type == "assure"){
            const insured = await prisma.assure.findFirst({
                where:{
                    id: parseInt(id),
                    matricule:parseInt(matricule)
                }
            })
            if(insured?.id == authed.id) next()
            else res.end(JSON.stringify({error:true,message:"Cannot access this employe as another"}))
        }
        else res.end(JSON.stringify({error:true,message:"Not a sub-insured !"}))
    }
}