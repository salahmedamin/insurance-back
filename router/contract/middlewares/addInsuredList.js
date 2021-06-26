const { PrismaClient } = require("@prisma/client")
const prisma = new PrismaClient()

module.exports = async(req, res, next) => {
  if (req.body.contractUnique && req.body.list){
    const contractData = await prisma.contrat.findFirst({
        where:{
            unique:req.body.contractUnique,
            entreprise:{
                id: req.authed.id
            }
        }
    })
    if(contractData && req.authed.type == "entreprise") next()
    else res.send({ error: true, message: "Invalid or missing parameters" });
  }
  else res.send({ error: true, message: "Invalid or missing parameters" });
};
