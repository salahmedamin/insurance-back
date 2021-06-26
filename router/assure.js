const ex = require("express");
const router = ex.Router();

const viewAssure = require("./assure/view")
const addSubInsured = require("./assure/addSubIns")
const deleteSubInsured = require("./assure/deleteSubIns")
const checkConnection = require("../middleware/checkConnection")
const checkSame = require("../middleware/checkIsSame/assure")

router.use(checkConnection,checkSame)

router.post("/addSubInsured", addSubInsured)
router.post("/deleteSubInsured", deleteSubInsured)
router.post("/view", viewAssure)

module.exports = router;
