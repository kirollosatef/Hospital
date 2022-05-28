let app = require("express").Router();
let doctorController = require("../controllers/doctor.conntroller");

app.get("/getAllDoctors", doctorController.getAllDoctors);
app.post("/createNewDoctor", doctorController.createNewDoctor);

module.exports = app;
