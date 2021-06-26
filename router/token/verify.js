const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res) => {
  const { token } = req.body;
  try {
    if (!token) throw new Error("Mandatory field is missing");
    const tokenExistence = await prisma.blacklist_token.findFirst({
      where: {
        token,
      },
    })
    res.send({isBlacklisted:tokenExistence !== null})
  } catch (e) {
    res.send({ error: true, message: e.message });
  }
};
