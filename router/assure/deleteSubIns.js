const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
module.exports = async (req, res) => {
  const { id } = req.body
  try {
    if (!id) throw new Error("Mandatory fields are missing or incorrect")
    //
        await prisma.assure.update({
          where:{
            id:parseInt(req.authed.id),
          },
          data:{
              sousassure:{
                  delete:{
                      id: id
                  }
              }
          }
        })
    res.send({ success: true });
  } catch (e) {
    res.status(500).send({ error: true, message: e.message });
  }
};
