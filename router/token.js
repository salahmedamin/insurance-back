const ex = require("express");
const router = ex.Router();

const verifyToken = require("./token/verify")
const blacklistToken = require("./token/blacklist")

router.post("/verify", verifyToken)
router.post("/blacklist", blacklistToken)

module.exports = router;
