let connection = require("./sequelize.connection");
let sequelize = require("sequelize");

let patients = connection.define("patients", {
  name: sequelize.STRING,
  phone: sequelize.STRING,
  email: sequelize.STRING,
  healthCare: sequelize.BOOLEAN,
});

let doctors = connection.define("doctors", {
  name: sequelize.STRING,
  phone: sequelize.STRING,
  email: sequelize.STRING,
  specialty: sequelize.STRING,
  xpYears: sequelize.INTEGER,
});

let nurses = connection.define("nurses", {
  name: sequelize.STRING,
  phone: sequelize.STRING,
  email: sequelize.STRING,
  xpYears: sequelize.INTEGER,
  doctorId: {
    type: sequelize.INTEGER,
    references: {
      model: "doctors",
      Key: "id",
    },
  },
});

let branches = connection.define("branches", {
  name: sequelize.STRING,
  location: sequelize.STRING,
  managerId: {
    type: sequelize.INTEGER,
    references: {
      model: "managers",
      Key: "id",
    },
  },
});

let managers = connection.define("managers", {
  name: sequelize.STRING,
  phone: sequelize.STRING,
  email: sequelize.STRING,
});

let securityMen = connection.define("securityMen", {
  name: sequelize.STRING,
  phone: sequelize.STRING,
  email: sequelize.STRING,
  brancheId: {
    type: sequelize.INTEGER,
    references: {
      model: "branches",
      Key: "id",
    },
  },
});

let diseases = connection.define("diseases", { name: sequelize.STRING });

let medicines = connection.define("medicines", {
  name: sequelize.STRING,
  ExpiryDate: sequelize.STRING,
});

let patientsDiseases = connection.define("patientsDiseases", {
  patientId: {
    type: sequelize.INTEGER,
    references: {
      model: "patients",
      Key: "id",
    },
  },
  diseaseId: {
    type: sequelize.INTEGER,
    references: {
      model: "diseases",
      Key: "id",
    },
  },
});

let doctorsPatientsBranches = connection.define("doctorsPatients", {
  doctorId: {
    type: sequelize.INTEGER,
    references: {
      model: "doctors",
      Key: "id",
    },
  },
  patientId: {
    type: sequelize.INTEGER,
    references: {
      model: "patients",
      Key: "id",
    },
  },
  brancheId: {
    type: sequelize.INTEGER,
    references: {
      model: "branches",
      Key: "id",
    },
  },
});

let diseasesMedicines = connection.define("diseasesMedicines", {
  diseaseId: {
    type: sequelize.INTEGER,
    references: {
      model: "diseases",
      Key: "id",
    },
  },
  medicineId: {
    type: sequelize.INTEGER,
    references: {
      model: "medicines",
      Key: "id",
    },
  },
});

let branchesDoctors = connection.define("branchesDoctors", {
  brancheId: {
    type: sequelize.INTEGER,
    references: {
      model: "branches",
      Key: "id",
    },
  },
  doctorId: {
    type: sequelize.INTEGER,
    references: {
      model: "doctors",
      Key: "id",
    },
  },
  nHours: sequelize.INTEGER,
});

module.exports = {
  patients,
  doctors,
  nurses,
  managers,
  securityMen,
  branches,
  diseases,
  medicines,
  doctorsPatientsBranches,
  patientsDiseases,
  diseasesMedicines,
  branchesDoctors,
};
