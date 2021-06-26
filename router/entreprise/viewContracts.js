const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res) => {
    const { entID, entMatricule, status } = req.body
    let customStts = !["active","expired"].includes(status) ? undefined : status
    try {
      if (!(entID && entMatricule)) throw new Error("Mandatory fields are missing")
      
      if(req.authed.id !== entID || req.authed.type !== "entreprise") throw new Error("You don't have permission to access this resource")
      const listeContrats = await prisma.contrat.findMany({
        where: {
            entreprise:{
                id: parseInt(entID),
                matFiscal: parseInt(entMatricule)
            },
            AND:[
                {
                    end: {
                        lt: customStts == "expired" ? Date.now() : undefined,
                        gt: customStts == "active" ? Date.now() : undefined,
                    }
                }
            ]
        },
        include:{
            offer:true
        }
      })
      res.send(listeContrats)
    } catch (e) {
        res.send({ error:true, message: e.message });
    }
}