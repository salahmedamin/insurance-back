const ex = require("express");
const router = ex.Router();

const createEnt = require("./entreprise/create")
const viewEnt = require("./entreprise/view")
const checkConnection = require("../middleware/checkConnection")
const checkSame = require("../middleware/checkIsSame/entreprise");
const recaptcha = require("./entreprise/middlewares/recaptcha");
const viewEmployees = require("./entreprise/viewEmployees");
const viewContracts = require("./entreprise/viewContracts");

router.use("/create",recaptcha)
router.post("/create", createEnt)

router.use("/view",checkConnection,checkSame)
router.post("/view", viewEnt)

//contractUnique parameter is optional, to get all employees, or only those under THE contract
router.use("/viewEmployees",checkConnection,checkSame)
router.post("/viewEmployees", viewEmployees)


//contractUnique parameter is optional, to get all employees, or only those under THE contract
router.use("/viewContracts",checkConnection,checkSame)
router.post("/viewContracts", viewContracts)

module.exports = router;
