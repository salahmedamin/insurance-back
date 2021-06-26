module.exports = (req, res, next) =>
(
  req.body.bulletinUnique &&
  req.body.typePaiement
)
  ? next()
  : res.send({ error: true, message: "Missing parameters" })