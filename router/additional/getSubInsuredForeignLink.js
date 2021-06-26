const {PrismaClient} = require("@prisma/client")
const prisma = new PrismaClient()

module.exports = async (subInsID)=>{
    try{
        if(!subInsID) throw new Error()
        const insurer = await prisma.assure.findFirst({
            where: {
                sousassure:{
                    some:{
                        id: subInsID
                    }
                }
            }
        })
        if(!insurer) throw new Error()
        const  contract = await prisma.contrat.findFirst({
            where:{
                insured:{
                    some:{
                        id: insurer.id
                    }
                }
            }
        })
        
        const  enterprise = await prisma.entreprise.findFirst({
            where:{
                contrat:{
                    some:{
                        entID: contract.id
                    }
                }
            }
        })

        return {
            insurer,
            contract,
            enterprise
        }
    }
    catch(e){
        return {error:true,message:e.message}
    }
}