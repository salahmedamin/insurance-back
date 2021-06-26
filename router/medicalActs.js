const ex = require("express");
const router = ex.Router();

const viewMedActs = require("./medicalActs/view")
const checkConnection = require("../middleware/checkConnection")

router.use("/",checkConnection)
router.post("/", viewMedActs)

module.exports = router;
