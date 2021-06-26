const {PrismaClient} = require("@prisma/client")
const prisma = new PrismaClient()

module.exports = async (insID)=>{
    try{
        if(!insID) throw new Error()
        const  contract = await prisma.contrat.findFirst({
            where:{
                insured:{
                    some:{
                        id: parseInt(insID)
                    }
                }
            },
            include:{
                insured:true
            }
        },
        )
        if(!contract) throw new Error()
        
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
            insured: contract.insured,
            contract,
            enterprise
        }
    }
    catch(e){
        return {error:true,message:e.message}
    }
}