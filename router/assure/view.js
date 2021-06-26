const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient()

module.exports = async (req, res) => {
    const { id, matricule } = req.authed
    const {viewTree} = req.body
    try {
      if (!(id && matricule)) throw new Error("Mandatory fields are missing")
      if(viewTree){
        const tree = await prisma.sousassure.findMany({
          where:{
            insurer:{
              id: parseInt(id),
              matricule: parseInt(matricule)
            }
          },
          include:{
            account: true
          }
        })
        res.send(tree)
      }
      else{
        const details = await prisma.assure.findFirst({
          where: {
            matricule: parseInt(matricule),
            id: parseInt(id)
          },
          include:{
              entreprise:true
          }
        })
        if(!details) throw new Error("No such employee")
        res.send(details)
      }
    } catch (e) {
        res.send({ error:true, message: e.message });
    }
}