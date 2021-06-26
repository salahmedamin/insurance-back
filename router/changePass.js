const ex = require("express");
const router = ex.Router();

const personAuth = require("./auth/assure")
const subInsuredAuth = require("./auth/sousassure")
const enterpriseAuth = require("./auth/entreprise")

router.post("/assure", personAuth[1])
router.post("/sousassure", subInsuredAuth[1])
router.post("/entreprise", enterpriseAuth[1])

module.exports = router