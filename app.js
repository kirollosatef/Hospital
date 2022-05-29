let express = require("express");
let bodyParser = require("body-parser");
let app = express();
let port = 3000 || process.env.PORT;
// let createTables = require("./connection/createTables");

app.use(express.json()); //for json files
app.use(bodyParser.urlencoded({ extended: false }));
//sequelize
// createTables();
//All Routes
let doctorRoutes = require("./routes/doctor.routes");
app.use(doctorRoutes);

//Server Up
app.listen(
  port,
  console.log("Server is up and running in port " + port + " successfully!!")
);
