const axios = require("axios");
const recaptchaSecretKey = process.env.RECAPTCHA_SECRET

module.exports = async(response,ip)=>{
    let googleURL = "https://www.google.com/recaptcha/api/siteverify?secret=" + recaptchaSecretKey + "&response=" + response + "&remoteip=" + ip;
    let v = await axios.get(googleURL)
    return v.data.success
}