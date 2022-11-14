const ex = require("express");
const router = ex.Router();

const viewMedActs = require("./medicalActs/view");
const checkConnection = require("../middleware/checkConnection");
const getAll = require("./medicalActs/getAll");

router.use("/", checkConnection);
router.post("/", viewMedActs);
router.get("/", getAll);

module.exports = router;
