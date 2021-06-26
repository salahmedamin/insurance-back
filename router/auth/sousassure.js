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
      const userData = await prisma.account_sousassure.findFirst({
        where: {
          generatedUsername: username,
          generatedPassword: password,
        },
        include: {
          assure: {
            include:{
              insurer: true
            }
          },
        },
      });
      if (!userData) throw new Error("No such user");
      const token = jwt.sign(
        { ...userData.assure, type: "sousassure" },
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
      const checkOldPass = await prisma.account_sousassure.findFirst({
        where: {
          sousAssID: parseInt(id),
          generatedPassword: oldPass,
        },
      });
      if (!checkOldPass) throw new Error("Incorrect old password");
      await prisma.account_sousassure.update({
        where: {
          sousAssID: parseInt(id),
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
