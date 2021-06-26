const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
module.exports = async (req, res) => {
  const { contractUnique, list } = req.body
  try {
    //
    await prisma.$transaction(
        list.map(a=>prisma.contrat.update({
          where:{
            unique:contractUnique,
          },
          data:{
            insured:{
              update:{
                  where:{
                    id: parseInt(a.id)
                  },
                  data:{
                      account:{
                          delete:true
                      },
                      sousassure:{
                          deleteMany:{}
                      }
                  }
              },
              delete:{
                id: parseInt(a.id)
              },
            },
          }
        }))
    )
    res.send({ success: true })
  } catch (e) {
    res.status(500).send({ error: true, message: e.message })
  }
};
