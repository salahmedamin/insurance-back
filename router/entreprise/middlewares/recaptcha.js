const verifyRecaptcha = require("./recap/verifyRecaptcha")

module.exports = async(req,res,next)=>{
    const ip = req.headers['x-forwarded-for'] || 
        req.connection.remoteAddress || 
        req.socket.remoteAddress ||
        (req.connection.socket ? req.connection.socket.remoteAddress : null);
    const {response} = req.headers
    const verified = await verifyRecaptcha(response,ip)
    if(verified) next()
    else return res.json({error:true,message:"invalid recaptcha response"})
}