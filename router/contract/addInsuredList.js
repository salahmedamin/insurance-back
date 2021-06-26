const { PrismaClient } = require("@prisma/client");
const { randomPassword } = require("secure-random-password");
const prisma = new PrismaClient();
module.exports = async (req, res) => {
  const { contractUnique, list } = req.body
  try {
    //
    const entID = (await prisma.entreprise.findFirst({where:{contrat:{some:{unique:contractUnique}}}})).id
    await prisma.$transaction(
        list.map(a=>prisma.contrat.update({
          where:{
            unique:contractUnique,
          },
          data:{
            insured:{
              create:{
                account:{
                  create:{
                    generatedPassword: randomPassword(),
                    generatedUsername: `${a.matricule}`,
                  }
                },
                entreprise:{
                  connect:{
                    id: entID
                  }
                },
                ...a
              }
            },
          }
        }))
    )
    
    res.send({ success: true });
  } catch (e) {
    res.status(500).send({ error: true, message: e.message });
  }
};
