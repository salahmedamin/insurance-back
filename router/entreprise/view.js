const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res) => {
    const { entID, entMatricule } = req.body
    try {
      if (!(entID && entMatricule)) throw new Error("Mandatory fields are missing")
      const entrepriseDetails = await prisma.entreprise.findFirst({
        where: {
          id: parseInt(entID),
          matFiscal: parseInt(entMatricule)
        }
      })
      if(!entrepriseDetails) throw new Error("No such enterprise")
      if(req.authed.id !== contractDetails.entID || !req.authed.isEnt) throw new Error("You don't have permission to access this resource")
      res.send(entrepriseDetails)
    } catch (e) {
        res.send({ error:true, message: e.message });
    }
}