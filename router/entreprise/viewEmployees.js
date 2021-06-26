const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res) => {
    const { entID, entMatricule, contractUnique } = req.body
    try {
      if (!(entID && entMatricule)) throw new Error("Mandatory fields are missing")
      const listeAssure = await prisma.assure.findMany({
        where: {
            entreprise:{
                id: parseInt(entID),
                matFiscal: parseInt(entMatricule)
            },
            AND:[
                {
                    contract:{
                        unique: contractUnique||undefined
                    }
                }
            ]
        },
        select:{
            contract: {
                select:{
                    unique: true
                }
            },
            dateNaiss: true,
            matricule: true,
            sexe: true,
            nom: true,
            prenom: true,
            id: true,
            account:true
        }
      })
      if(req.authed.id !== entID || !req.authed.type == "entreprise") throw new Error("You don't have permission to access this resource")
      res.send(listeAssure)
    } catch (e) {
        res.send({ error:true, message: e.message });
    }
}