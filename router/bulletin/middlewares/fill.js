module.exports = (req, res, next) =>
(
  req.body.intervID &&
  req.body.actCode &&
  req.body.montant &&
  req.body.bulletinUnique
)
  ? next()
  : res.send({ error: true, message: "Missing parameters" })