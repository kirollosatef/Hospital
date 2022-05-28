// let Doctor = require("../hospital.modals").doctors;
let mssql = require("mssql");
let config = require("../connection/dbConfig");

//get All Doctors
let getAllDoctors = async (req, res) => {
  try {
    await mssql.connect(config);
    let sql = `SELECT * FROM doctors`;
    let result = await mssql.query(sql);
    console.log(result.recordset);
    res.status(200).json({ message: "Success!!", data: result.recordset });
  } catch (err) {
    console.log(err);
  }
};

//create a new doctor
let createNewDoctor = async (req, res) => {
  try {
    await mssql.connect(config);
    let data = await req.body;
    let sql = `INSERT INTO doctors (name, phone, email , specialty, xpYears) VALUES ($1, $2, $3, $4, $5) RETURNING *`;
    let result = await mssql.query(sql, [
      data.name,
      data.phone,
      data.email,
      data.specialty,
      data.xpYears,
    ]);
    console.log(result.recordset[0]);
    res.status(200).json({ message: "Success!!", data: result.recordset[0] });
  } catch (err) {
    console.log(err);
  }
};

module.exports = {
  getAllDoctors,
  createNewDoctor,
};
