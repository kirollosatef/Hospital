const config = {
  user: "kero",
  server: "127.0.0.1",
  database: "DB_hospital",
  driver: "MSSQL",
  password: "keroatef",
  options: {
    trustedConnection: true,
    enableArithAort: true,
    trustServerCertificate: true,
    instancename: "SQLEXPRESS",
  },
  port: 49672,
};
module.exports = config;
