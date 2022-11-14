const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res) => {
  try {
    const medicalActs = await prisma.acte_medical.findMany();
    res.send(medicalActs);
  } catch (e) {
    res.send({ error: true, message: e.message });
  }
};
