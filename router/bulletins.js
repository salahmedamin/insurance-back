const ex = require("express")
const checkConnection = require("../middleware/checkConnection")
const router = ex.Router()

const viewBulletins = require("./bulletins/view")

router.use("/view", checkConnection)
router.post("/view", viewBulletins)

module.exports = router
