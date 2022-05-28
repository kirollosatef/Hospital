let sequelize = require("./sequelize.connection");
let createTables = async () => {
  sequelize
    .sync()
    .then(() => {
      console.log("Connected to database using sequlize successfuly!!");
    })
    .catch((err) => console.log(err));
};
module.exports = createTables;
