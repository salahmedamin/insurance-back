const { PrismaClient } = require("@prisma/client");
const jwt = require("jsonwebtoken");
const secret = require("../../secret");
const prisma = new PrismaClient();

module.exports = [
  async (req, res) => {
    const { username, password } = req.body;
    try {
      if (!(username && password))
        throw new Error("Mandatory fields are missing");
      const entData = await prisma.account_entrep.findFirst({
        where: {
          generatedUsername: username,
          generatedPassword: password,
        },
        include: {
          entreprise: true,
        },
      });
      if (!entData) throw new Error("No such enterprise");
      const token = jwt.sign(
        { 
          ...entData.entreprise,
          type: "entreprise"
        },
        secret
      );
      res.header("authorization", token);
      res.send({ success: true });
    } catch (e) {
      res.send({ error: true, message: e.message });
    }
  },
  async (req, res) => {
    const { oldPass, newPass, id } = req.body;
    try {
      if (!(oldPass && newPass && id))
        throw new Error("Mandatory fields are missing");
      const checkOldPass = await prisma.account_entrep.findFirst({
        where: {
          entID: parseInt(id),
          generatedPassword: oldPass,
        },
      });
      if (!checkOldPass) throw new Error("Incorrect old password");
      await prisma.account_entrep.update({
        where: {
          entID: parseInt(id),
        },
        data: {
          generatedPassword: newPass,
          changedPass: true
        },
      });
      res.send({ success: true });
    } catch (e) {
      res.send({ error: true, message: e.message });
    }
  },
];
