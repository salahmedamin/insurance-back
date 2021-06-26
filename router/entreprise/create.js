const { PrismaClient } = require("@prisma/client");
const { randomPassword } = require("secure-random-password");
const create = require("../contract/create");
const prisma = new PrismaClient()
module.exports = async (req, res) => {
  const { nom, adresse, tel, matFiscal } = req.body;
  try {
    if (!(nom && adresse && tel && matFiscal)) throw new Error("Mandatory fields are missing or incorrect");
    //
    const created = await prisma.entreprise.create({
      data: {
        nom,
        adresse,
        tel: parseInt(tel),
        matFiscal: parseInt(matFiscal),
        account:{
          create:{
            generatedPassword: randomPassword(),
            generatedUsername:matFiscal,
          }
        }
      },
      include:{
        account:{
          select:{
            generatedPassword:true,
            generatedUsername: true
          }
        }
      }
    });
    

    res.send(created?{success:true,accountDetails:created.account}:{error:true});
  } catch (e) {
    res.status(500).send({ error: true, message: e.message });
  }
};
