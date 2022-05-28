let sequelize = require("sequelize");
let connection = new sequelize("DB_hospital", "kero", "keroatef", {
  host: "127.0.0.1",
  port: 49672,
  dialect: "mssql",
});

module.exports = connection;
