const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res, next) => {
  if (req.body.contractUnique) {
    const data = await prisma.contrat.findFirst({
      where: {
        unique: req.body.contractUnique,
        entreprise: {
          id: parseInt(req.authed.id),
        },
      },
      include: {
        entreprise: true,
        actes: true,
        offer: true,
      },
    });
    if (data && req.authed.type == "entreprise") {
      if (req.authed.id !== data.entID || req.authed.type !== "entreprise")
        res.send({
          error: true,
          message: "You don't have permission to access this resource",
        });
      req.contractData = data;
      next();
    } else res.send({ error: true, message: "Token contains invalid values" });
  } else res.send({ error: true, message: "Invalid or missing parameters" });
};
