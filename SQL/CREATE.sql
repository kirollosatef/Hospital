CREATE TABLE branches (
  id int(50) NOT NULL,
  name varchar(255) DEFAULT NULL,
  location varchar(255) DEFAULT NULL,
  managerId int(50) DEFAULT NULL
);
CREATE TABLE branches_doctors (
  id int(50) NOT NULL,
  brancheId int(50) DEFAULT NULL,
  doctorId int(50) DEFAULT NULL,
  nHours int(50) DEFAULT NULL
);
CREATE TABLE diseases (
  id int(50) NOT NULL,
  name varchar(255) DEFAULT NULL
);
CREATE TABLE diseases_medicines (
  id int(50) NOT NULL,
  diseaseId int(50) DEFAULT NULL,
  medicineId int(50) DEFAULT NULL
);
CREATE TABLE doctors (
  id int(50) NOT NULL,
  name varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  specialty varchar(255) DEFAULT NULL,
  xpYears int(50) DEFAULT NULL
);
CREATE TABLE doctors_patients_branches (
  id int(50) NOT NULL,
  doctorId int(50) DEFAULT NULL,
  patientId int(50) DEFAULT NULL,
  brancheId int(50) DEFAULT NULL
);
CREATE TABLE managers (
  id int(50) NOT NULL,
  name varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL
);
CREATE TABLE medicines (
  id int(50) NOT NULL,
  name varchar(255) DEFAULT NULL,
  expiryDate varchar(255) DEFAULT NULL
);
CREATE TABLE nurses (
  id int(50) NOT NULL,
  name varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  xpYears int(50) DEFAULT NULL,
  doctorId int(50) DEFAULT NULL
);
CREATE TABLE patients (
  id int(50) NOT NULL,
  name varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  healthCare tinyint(1) DEFAULT NULL
);
CREATE TABLE patients_diseases (
  id int(50) NOT NULL,
  patientId int(50) DEFAULT NULL,
  diseaseId int(50) DEFAULT NULL
);
CREATE TABLE securitymen (
  id int(50) NOT NULL,
  name varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  brancheId int(50) DEFAULT NULL
);
ALTER TABLE branches
ADD PRIMARY KEY (id),
  ADD KEY managerId(managerId);
ALTER TABLE branches_doctors
ADD PRIMARY KEY (id),
  ADD KEY brancheId (brancheId),
  ADD KEY doctorId (doctorId);
ALTER TABLE diseases
ADD PRIMARY KEY (id);
ALTER TABLE diseases_medicines
ADD PRIMARY KEY (id),
  ADD KEY diseaseId (diseaseId),
  ADD KEY medicineId (medicineId);
ALTER TABLE doctors
ADD PRIMARY KEY (id);
ALTER TABLE doctors_patients_branches
ADD PRIMARY KEY (id),
  ADD KEY doctorId (doctorId),
  ADD KEY patientId (patientId),
  ADD KEY brancheId (brancheId);
ALTER TABLE managers
ADD PRIMARY KEY (id);
ALTER TABLE medicines
ADD PRIMARY KEY (id);
ALTER TABLE nurses
ADD PRIMARY KEY (id),
  ADD KEY doctorId (doctorId);
ALTER TABLE patients
ADD PRIMARY KEY (id);
ALTER TABLE patients_diseases
ADD PRIMARY KEY (id),
  ADD KEY patientId (patientId),
  ADD KEY diseaseId (diseaseId);
ALTER TABLE securitymen
ADD PRIMARY KEY (id),
  ADD KEY brancheId (brancheId);
ALTER TABLE branches
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE branches_doctors
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE diseases
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE diseases_medicines
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE doctors
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE doctors_patients_branches
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE managers
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE medicines
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE nurses
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE patients
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE patients_diseases
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE securitymen
MODIFY id int(50) NOT NULL AUTO_INCREMENT;
ALTER TABLE branches
ADD CONSTRAINT branches_ibfk_1 FOREIGN KEY (managerId) REFERENCES managers (id);
ALTER TABLE branches_doctors
ADD CONSTRAINT branches_doctors_ibfk_1 FOREIGN KEY (brancheId) REFERENCES branches (id),
  ADD CONSTRAINT branches_doctors_ibfk_2 FOREIGN KEY (doctorId) REFERENCES doctors (id);
ALTER TABLE diseases_medicines
ADD CONSTRAINT diseases_medicines_ibfk_1 FOREIGN KEY (diseaseId) REFERENCES diseases (id),
  ADD CONSTRAINT diseases_medicines_ibfk_2 FOREIGN KEY (medicineId) REFERENCES medicines (id);
ALTER TABLE doctors_patients_branches
ADD CONSTRAINT doctors_patients_branches_ibfk_1 FOREIGN KEY (doctorId) REFERENCES doctors (id),
  ADD CONSTRAINT doctors_patients_branches_ibfk_2 FOREIGN KEY (patientId) REFERENCES patients (id),
  ADD CONSTRAINT doctors_patients_branches_ibfk_3 FOREIGN KEY (brancheId) REFERENCES branches (id);
ALTER TABLE nurses
ADD CONSTRAINT nurses_ibfk_1 FOREIGN KEY (doctorId) REFERENCES doctors (id);
ALTER TABLE patients_diseases
ADD CONSTRAINT patients_diseases_ibfk_1 FOREIGN KEY (patientId) REFERENCES patients (id),
  ADD CONSTRAINT patients_diseases_ibfk_2 FOREIGN KEY (diseaseId) REFERENCES diseases (id);
ALTER TABLE securitymen
ADD CONSTRAINT securitymen_ibfk_1 FOREIGN KEY (brancheId) REFERENCES branches (id);