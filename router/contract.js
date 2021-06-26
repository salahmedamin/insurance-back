const ex = require("express");
const router = ex.Router();

const createContract = require("./contract/create")
const viewContract = require("./contract/view")
const addInsuredList = require("./contract/addInsuredList")

const checkConnection = require("../middleware/checkConnection")

const viewMiddleware = require("./contract/middlewares/view")
const addInsuredListMiddleware = require("./contract/middlewares/addInsuredList");
const createMiddleware = require("./contract/middlewares/create");
const deleteInsuredList = require("./contract/deleteInsuredList");

router.use(checkConnection)

router.use("/create",createMiddleware)
router.post("/create", createContract)

router.use("/addInsuredList",addInsuredListMiddleware)
router.post("/addInsuredList", addInsuredList)

router.use("/deleteInsuredList",addInsuredListMiddleware)
router.post("/deleteInsuredList", deleteInsuredList)

router.use("/view",viewMiddleware)
router.post("/view", viewContract)

module.exports = router;
