const { PrismaClient } = require(".prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res) => {
    try {
        if (!["sousassure", "assure"].includes(req.authed.type))
            throw new Error("Not an sub insured or an employee !")
        else {
            const status_data = !req.body.type ? {} : (req.body.type == "accepted" ? {
                statut: {
                    status: 1
                }
            } : (
                req.body.type == "pending" ?
                    {
                        statut: {
                            status: 0
                        }
                    }
                    :
                    req.body.type == "rejected" ? {
                        statut: {
                            status: -1
                        }
                    } : {}
            ))
            const bulletinList = await prisma.bulletin.findMany({
                where: {
                    OR: [
                        {
                            assure: {
                                id: req.authed.type =="assure"? req.authed.id : undefined
                            }
                        },
                        {
                            insured: {
                                id: req.authed.type == "sousassure" ? req.authed.id : undefined
                            }
                        }
                    ],
                    ...status_data
                },
                include: {
                    // assure: true,
                    // insured: true,
                    intervenant: true,
                    statut: true,
                    // remboursement: true,
                    actemedical: true,
                    // contract: true,
                }
            })
            res.send(bulletinList)
        }
    }
    catch (e) {
        console.log(e)
        res.send({ error: true, message: e.message })
    }
}
