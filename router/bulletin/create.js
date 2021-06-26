const { PrismaClient } = require(".prisma/client")
const prisma = new PrismaClient()
const uuid = require("uuid")

module.exports = async(req,res)=>{
    try{
        const unique = uuid.v4()
        const createdBulletin = await prisma.bulletin.create({
            data:{
                unique,
                contract:{
                    connect:{
                        id: req.authed.cID || req.authed.insurer.cID
                    }
                },
                statut:{
                    create:{ }
                },
                [req.authed.type == "sousassure" ? "insured" : "assure"]:{
                    connect:{
                        id: req.authed.id
                    }
                },
            }
        })
        res.send(createdBulletin)
    }
    catch(e){
        console.log(e)
        res.status(500).send({error:true,message:e.message})
    }
}