const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = async (req, res) => {
    const { type, id } = req.authed
    try {
        if(!["assure","sousassure"].includes(req.authed.type)) throw new Error("You must be either an employee, or an insured")
      const medicalActs = await prisma.acte_medical.findMany({
          where:{
              contrat:{
                  some:{
                      OR:[
                          {
                              insured:{
                                  some:{
                                      id: type == "assure" ? id : undefined
                                  }
                              }
                          },
                          {
                            insured:{
                                some:{
                                    sousassure:{
                                        some:{
                                            id: type == "sousassure" ? id : undefined
                                        }
                                    }
                                }
                            }
                        },
                      ]
                  }
              }
          }
      })
      res.send(medicalActs)
    } catch (e) {
        res.send({ error:true, message: e.message });
    }
}