const {PrismaClient} = require("@prisma/client")
const prisma = new PrismaClient()

module.exports = async (year,start,contractID)=>{
    const starter = new Date(start*1000)
    const contract = await prisma.bulletin.findMany({
        where:{
            contract:{
                id: contractID
            },
            date:{
                gte: new Date(starter.getFullYear()+(year-1),starter.getMonth(),starter.getDay()),
                lte: new Date((new Date()).getFullYear()+year,(new Date()).getMonth(),(new Date()).getDay())
            }
        }
    })
    return contract
}