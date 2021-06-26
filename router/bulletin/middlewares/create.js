module.exports = (req, res, next) => {
    if (req.authed.id && ["sousassure","assure"].includes(req.authed.type))
      next()
    else
      res.end(
        JSON.stringify({
          error: true,
          message: "An authentication problem occured",
        })
      )
  }