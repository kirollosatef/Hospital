----------------------CROSS JOIN----------------------
SELECT *
FROM branches
  CROSS JOIN managers
WHERE branches.managerID = managers.id
  AND managerID = 1;
---
SELECT *
FROM branches
  CROSS JOIN managers
WHERE branches.managerID = managers.id
  AND managerID = 1;
---
SELECT * doctors
  CROSS JOIN branches
WHERE branches_doctors = branches.id;
---
SELECT * from branches
  JOIN managers
  WHERE managers.id=branches.managerId;
--
SELECT * from medicines
JOIN diseases_medicines
where medicines.id=diseases_medicines.diseaseId;
--
SELECT * from nurses
JOIN doctors
where nurses.doctorId=doctors.id;
--
SELECT * from securitymen
JOIN branches
where branches.id=securitymen.brancheId;
--
SELECT * patients
JOIN doctors_patients_branches
WHERE patients.id=doctors_patients_branches.patientId;
--
SELECT patients.name, patients.phone, doctors_patients_branches.doctorId , doctors.name from patients , doctors_patients_branches ,doctors
WHERE patients.id = doctors_patients_branches.patientId and  doctors_patients_branches.doctorId = doctors.id;
--
SELECT patients.name, patients.phone, doctors_patients_branches.doctorId , doctors.name from patients 
JOIN doctors_patients_branches on patients.id = doctors_patients_branches.patientId 
JOIN doctors on doctors_patients_branches.doctorId = doctors.id;
--
SELECT patients.name, patients.phone, doctors_patients_branches.doctorId , doctors.name from patients 
CROSS JOIN doctors_patients_branches on patients.id = doctors_patients_branches.patientId 
CROSS JOIN doctors on doctors_patients_branches.doctorId = doctors.id;
--
