const { PrismaClient } = require(".prisma/client")
const getBulletinInThisYear = require("../additional/contract/getBulletinInThisYear")
const getYearOfContract = require("../additional/contract/getYearOfContract")
const prisma = new PrismaClient()
module.exports = async (req, res) => {
  try {
    const { bulletinUnique, typePaiement } = req.body


    //CHECK IF CONTRACT IS NOT YET EXPIRED
    const cntc = await prisma.contrat.findFirst({
      where:{
        bulletin:{
          some:{
            unique:bulletinUnique
          }
        }
      },
      select:{
        end:true
      }
    })


    if(parseInt(cntc.end) - (new Date()).getTime() <= 0){
      await prisma.bulletin.update({
        where: {
          unique: bulletinUnique,
        },
        data: {
          statut: {
            update: {
              status: -1,
              reject: {
                connect: {
                  id: 3,
                },
              },
            },
          },
        },
      })
      throw new Error(
        "The contract this bulletin is under has already expired ! This bulletin has been rejected."
      )
    }




    // CHECK IF BULLETIN IS STILL ON HOLD
    const contractHasAct = await prisma.contrat.findFirst({
      where: {
        bulletin: {
          some: {
            unique: bulletinUnique,
            statut: {
              status: 0,
            },
            NOT: {
              intervenant: null,
              montant: null,
              actemedical: null,
            },
          },
        },
      },
      select:{
          bulletin:{
              select:{
                  montant:true
              }
          }
      }
    })
    if (!contractHasAct) {
      throw new Error(
        "This bulletin doesn't exist or has already been validated"
      )
    }




    //CHECK IF CONTRACT COVERS THIS MEDICAL ACT
    const covered = await prisma.contrat.findFirst({
      where: {
        bulletin: {
          some: {
            unique: bulletinUnique,
          },
        },
        actes: {
          some: {
            id: (
              await prisma.bulletin.findFirst({
                where: { unique: bulletinUnique },
              })
            ).actID,
          },
        },
      },
      include:{
        offer:true
      }
    })
    if (!covered) {
      await prisma.bulletin.update({
        where: {
          unique: bulletinUnique,
        },
        data: {
          statut: {
            update: {
              status: -1,
              reject: {
                connect: {
                  id: 1,
                },
              },
            },
          },
        },
      })
      throw new Error(
        "The contract you're under doesn't cover this medical act ! This bulletin has been rejected"
      )
    }




    //CHECK IF PLAFOND IS NOT EXCEEDED
    const yoc = await getYearOfContract(covered.id)
    const bulletins = await getBulletinInThisYear(yoc.yearOfContract, yoc.start, covered.id)
    const currentTotal = bulletins.reduce((t,a)=>t+=parseInt(a.montant),0)
    if(currentTotal + parseInt(contractHasAct.bulletin[0].montant) > parseInt(covered.offer.plafond)){
        await prisma.bulletin.update({
            where: {
              unique: bulletinUnique,
            },
            data: {
              statut: {
                update: {
                  status: -1,
                  reject: {
                    connect: {
                      id: 2,
                    },
                  },
                },
              },
            },
          })
        throw new Error("This bulletin will be rejected cause you're bypassing your yearly limit !")
    }




    //IF EVERYTHING WENT OK, TAKE YOUR MONEY
    const typage = typePaiement
    await prisma.bulletin.update({
      where: {
        unique: bulletinUnique,
      },
      data: {
        statut: {
          update: {
            status: 1,
          },
        },
        remboursement: {
          create: {
            [typage.nom]: {
              create: Object.entries(typage.valeur).reduce(
                (t, a) =>
                  (t = {
                    ...t,
                    [a[0]]: parseInt(a[1]) ? parseInt(a[1]) : a[1],
                  }),
                {}
              ),
            },
          },
        },
      },
    })
    res.send({ success: true })
  } catch (e) {
    res.status(500).send({ error: true, message: e.message })
  }
}
