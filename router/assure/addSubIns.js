const { PrismaClient } = require("@prisma/client");
const { randomPassword } = require("secure-random-password");
const prisma = new PrismaClient();
module.exports = async (req, res) => {
  const { id } = req.authed;
  const { matricule, ...rest } = req.body;
  const randomPass = randomPassword();
  try {
    //
    await prisma.assure.update({
      where: {
        id: parseInt(id),
      },
      data: {
        sousassure: {
          create: {
            account: {
              create: {
                generatedPassword: randomPass,
                generatedUsername: `${matricule}`,
              },
            },
            ...rest,
          },
        },
      },
    });

    res.send({
      success: true,
      account: {
        username: matricule,
        password: randomPass,
      },
    });
  } catch (e) {
    res.status(500).send({ error: true, message: e.message });
  }
};
