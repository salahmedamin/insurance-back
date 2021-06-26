const { PrismaClient } = require("@prisma/client")
const prisma = new PrismaClient()
const ex = require("express")
const checkConnection = require("../middleware/checkConnection")
const router = ex.Router()

const fillMiddleware = require("./bulletin/middlewares/fill")
const createMiddleware = require("./bulletin/middlewares/create")
const viewMiddleware = require("./bulletin/middlewares/view")
const validateMiddleware = require("./bulletin/middlewares/validate")

const createBulletin = require("./bulletin/create")
const fillBulletin = require("./bulletin/fill")
const viewBulletin = require("./bulletin/view")
const validateBulletin = require("./bulletin/validate")

router.use("/create", checkConnection, createMiddleware)
router.post("/create", createBulletin)

router.use("/fill", fillMiddleware)
router.post("/fill", fillBulletin)

router.use("/view", checkConnection ,viewMiddleware)
router.post("/view", viewBulletin)


router.use("/validate", validateMiddleware)
router.post("/validate", validateBulletin)

module.exports = router
