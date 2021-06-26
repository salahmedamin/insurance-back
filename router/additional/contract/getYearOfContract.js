const {PrismaClient} = require("@prisma/client")
const prisma = new PrismaClient()

module.exports = async (contractID)=>{
    const contract = await prisma.contrat.findFirst({
        where:{
            id: contractID
        },
        select:{
            start:true,
        }
    })
    const year = 60*60*24*7*4*12
    const start = Math.floor((contract.start).getTime()/1000)
    const current = Math.floor(Date.now()/1000)
    const yearOfContract = Math.ceil((current - start) / year)
    return {yearOfContract,start}
}