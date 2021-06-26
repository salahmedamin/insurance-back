const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const uuid = require("uuid");
module.exports = async (req, res) => {
  const { entID, entMatFiscal, periodInYears, offer } = req.body;
  try {
    const dateObj = new Date();
    const year = dateObj.getFullYear();
    const month = dateObj.getMonth();
    const date = dateObj.getDate();
    const end = new Date(
      year + parseInt(periodInYears),
      month,
      date
    ).getTime();
    //
    const created = await prisma.contrat.create({
      data: {
        end,
        unique: uuid.v4(),
        offer: {
          connect: {
            id: (await prisma.contract_offer.findFirst({where:{name: offer}})).id
          },
        },
        entreprise: {
          connect: {
            id: parseInt(entID)
          },
        },
      },
    });
    

    res.send(created??{error:true});
  } catch (e) {
    res.status(500).send({ error: true, message: e.message });
  }
};
