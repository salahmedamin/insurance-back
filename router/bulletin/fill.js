const { PrismaClient } = require(".prisma/client")
const prisma = new PrismaClient()
module.exports = async(req,res)=>{
    try{
        const {intervID,actCode,montant,bulletinUnique/*,typePaiement*/} = req.body
        const contractHasAct = await prisma.contrat.findFirst({
            where:{
                // actes:{
                //     some:{
                //         code: parseInt(actCode)
                //     }
                // },
                bulletin:{
                    some:{
                        unique: bulletinUnique,
                        actemedical: null
                        // statut:{
                        //     status: 0
                        // }
                    }
                }
            }
        })
        if(!contractHasAct){
            // await prisma.bulletin.update({
            //     where:{
            //         unique: bulletinUnique
            //     },
            //     data:{
            //         statut:{
            //             update:{
            //                 status: -1
            //             }
            //         }
            //     }
            // })
            // throw new Error("Either this contract doesn't cover this medical act, or this bulletin has been accepted/rejected")
            throw new Error("The contract this bulletin is under doesn't exist, or this bulletin has already been filled")
        }
        await prisma.bulletin.update({
            where:{
                unique: bulletinUnique,
            },
            data:{
                montant: parseInt(montant),
                intervenant:{
                    connect:{
                        id: parseInt(intervID)
                    }
                },
                actemedical:{
                    connect:{
                        code: parseInt(actCode)
                    }
                },
                // statut:{
                //     update:{
                //         status: 1
                //     }
                // },
                // remboursement:{
                //     create:{
                //         [typage.nom]:{
                //             create: Object.entries(typage.valeur).reduce((t,a)=>t={...t,[a[0]]:parseInt(a[1])?parseInt(a[1]) : a[1]},{})
                //         }
                //     }
                // }
            }
        })
        res.send({success:true})
    }
    catch(e){
        res.status(500).send({error:true,message:e.message})
    }
}