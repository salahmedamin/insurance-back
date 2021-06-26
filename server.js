const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");

const contractRouter = require("./router/contract");
const authRouter = require("./router/auth");
const bulletinRouter = require("./router/bulletin");
const bulletinsRouter = require("./router/bulletins");
const entrepriseRouter = require("./router/enterprise");
const assureRouter = require("./router/assure")
const changePassRouter = require("./router/changePass")
const tokenRouter = require("./router/token")
const medicalActsRouter = require("./router/medicalActs")

const recaptcha = require("./router/entreprise/middlewares/recaptcha")

BigInt.prototype.toJSON = function() {       
  return this.toString()
}
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.json());
app.use(
  cors({
    origin: ["http://localhost:3000"],
    allowedHeaders: ["content-type", "response", "*"],
    exposedHeaders: "authorization",
  })
);

app.use("/auth",recaptcha)

app.use("/auth", authRouter);
app.use("/contract", contractRouter);
app.use("/bulletin", bulletinRouter);
app.use("/bulletins", bulletinsRouter);
app.use("/entreprise", entrepriseRouter);
app.use("/assure", assureRouter);
app.use("/changePass",changePassRouter)
app.use("/medical-acts",medicalActsRouter)
app.use("/token",tokenRouter)

app.listen(8000, () => console.log("listening on 8000"));
