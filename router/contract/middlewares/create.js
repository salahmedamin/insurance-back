const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res, next) => {
  if (
    req.body.entID &&
    req.body.entMatFiscal &&
    req.body.periodInYears &&
    req.body.offer &&
    ["basic", "advanced", "pro"].includes(req.body.offer)
  ) {
    const entExists = await prisma.entreprise.findFirst({
      where: {
        id: parseInt(req.body.entID),
        matFiscal: parseInt(req.body.entMatFiscal),
      },
    });
    if (!entExists)
      res.send({ error: true, message: "This enterprise doesn't exist" });
    else if (
      req.authed.id !== parseInt(req.body.entID) ||
      req.authed.type !== "entreprise"
    )
      res.send({
        error: true,
        message: "Being the same enterprise is required",
      });
    else next();
  } else res.send({ error: true, message: "Invalid or missing parameters" });
};
