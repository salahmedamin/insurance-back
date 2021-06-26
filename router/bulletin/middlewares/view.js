const { PrismaClient } = require(".prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res, next) => {
  if (!req.body.bulletinUnique)
    res.send({ error: true, message: "Missing parameters" });
  else {
    if (!["sousassure", "assure"].includes(req.authed.type))
      res.send({ error: true, message: "Not an sub insured or an employee !" });
    else {
      const bulletinData = await prisma.bulletin.findFirst({
        where: {
          unique: req.body.bulletinUnique,
          [req.authed.type=="sousassure" ? "insured":"assure"]:{
            id: parseInt(req.authed.id)
          }
        },
        include: {
          assure: true,
          insured: true,
          intervenant: true,
          statut: {
            include: {
              reject: true,
            },
          },
          remboursement: {
            include:{
              cheque:true,
              recu:true,
              virement:true
            }
          },
          actemedical: true,
          contract: {
            include:{
              entreprise: {
                select:{
                  nom :true
                }
              },
              offer:true
            }
          },
        },
      });
      if (bulletinData) {
        req.bulletinData = bulletinData;
        next();
      } else
        res.send({
          error: true,
          message:
            "You either aren't the creator of the bulletin or this one doesn't exist",
        });
    }
  }
};
