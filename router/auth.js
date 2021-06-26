const ex = require("express");
const router = ex.Router();

const personAuth = require("./auth/assure")
const subInsuredAuth = require("./auth/sousassure")
const enterpriseAuth = require("./auth/entreprise")

router.post("/employee", personAuth[0])
router.post("/insured", subInsuredAuth[0])
router.post("/enterprise", enterpriseAuth[0])

module.exports = router