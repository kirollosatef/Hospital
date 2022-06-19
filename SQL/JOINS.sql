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
<<<<<<< HEAD
SELECT *
FROM doctors
  CROSS JOIN branches
  CROSS JOIN branches_doctors
WHERE branches_doctors.brancheId = branches.id;
----------------------INNER JOIN----------------------
SELECT *
from branches
  INNER JOIN managers ON managers.id = branches.managerId;
---
SELECT *
from medicines
  INNER JOIN diseases_medicines ON medicines.id = diseases_medicines.diseaseId;
---
SELECT *
from nurses
  INNER JOIN doctors ON nurses.doctorId = doctors.id;
----------------------LEFT JOIN----------------------
SELECT *
from securitymen
  LEFT JOIN branches ON branches.id = securitymen.brancheId;
---
SELECT * patients
  JOIN doctors_patients_branches
WHERE patients.id = doctors_patients_branches.patientId;
----------------------RIGHT JOIN----------------------
SELECT *
from branches
  RIGHT JOIN managers ON managers.id = branches.managerId;
---
SELECT *
from doctors
  RIGHT JOIN doctors_patients_branches ON doctors.id = doctors_patients_branches.doctorId;
------------------DELETE/UPDATE WITH JOIN--------------
DELETE nurses
FROM nurses
  JOIN doctors ON nurses.doctorId = doctors.id
WHERE doctors.id = 1;
---
DELETE securitymen
FROM securitymen
  JOIN branches ON branches.id = securitymen.brancheId
WHERE branches.id = 1;
---
UPDATE patients
SET name = 'updated name'
FROM patients
  JOIN doctors_patients_branches ON patients.id = doctors_patients_branches.patientId
WHERE doctors_patients_branches.doctorId = 1;
---
UPDATE doctors
SET name = 'updated name'
FROM doctors
  JOIN doctors_patients_branches ON doctors.id = doctors_patients_branches.doctorId
WHERE doctors_patients_branches.patientId = 1;
----------------------OUTER JOIN-----------------------
SELECT *
FROM branches
  LEFT OUTER JOIN managers ON managers.id = branches.managerId;
---
SELECT *
FROM branches
  RIGHT OUTER JOIN managers ON managers.id = branches.managerId;
---
SELECT *
FROM branches
  FULL OUTER JOIN managers ON managers.id = branches.managerId;
------------------------JOIN Tables -------------------
SELECT patients.name,
  patients.phone,
  doctors_patients_branches.doctorId,
  doctors.name
FROM patients,
  doctors_patients_branches,
  doctors
WHERE patients.id = doctors_patients_branches.patientId
  and doctors_patients_branches.doctorId = doctors.id;
---
SELECT patients.name,
  patients.phone,
  doctors_patients_branches.doctorId,
  doctors.name
from patients
  JOIN doctors_patients_branches on patients.id = doctors_patients_branches.patientId
  JOIN doctors on doctors_patients_branches.doctorId = doctors.id;
---
SELECT doctors.name,
  doctors.specialty,
  doctors.xpYears,
  branches.name,
  branches.location,
  branches_doctors.nHours
FROM branches_doctors
  CROSS JOIN doctors ON doctors.id = branches_doctors.doctorId
  CROSS JOIN branches ON branches.id = branches_doctors.brancheId;
---
SELECT patients.name,
  doctors.name,
  branches.name
FROM doctors_patients_branches
  INNER JOIN patients ON patients.id = doctors_patients_branches.patientId
  INNER JOIN doctors ON doctors.id = doctors_patients_branches.doctorId
  INNER JOIN branches ON branches.id = doctors_patients_branches.brancheId;
---
SELECT patients.name,
  patients.phone,
  doctors_patients_branches.doctorId,
  doctors.name
FROM patients
  CROSS JOIN doctors_patients_branches on patients.id = doctors_patients_branches.patientId
  CROSS JOIN doctors on doctors_patients_branches.doctorId = doctors.id;
---
SELECT managers.name as 'manager Name',
  branches.name as 'branch name',
  branches.location
FROM nurses
  JOIN doctors ON nurses.doctorId = doctors.id
  JOIN branches_doctors ON branches_doctors.doctorId = doctors.id
  JOIN branches ON branches_doctors.brancheId = branches.id
  JOIN managers ON branches.managerId = managers.id;
---
SELECT patients.name as 'name',
  doctors.name as 'doctor',
  branches.name as 'branche',
  diseases.name as 'disease',
  medicines.name as 'medicine',
  medicines.expiryDate as 'expiry date'
FROM doctors
  JOIN doctors_patients_branches ON doctors_patients_branches.doctorId = doctors.id
  JOIN branches ON doctors_patients_branches.brancheId = branches.id
  JOIN patients ON doctors_patients_branches.patientId = patients.id
  JOIN patients_diseases ON patients.id = patients_diseases.patientId
  JOIN diseases ON patients_diseases.diseaseId = diseases.id
  JOIN diseases_medicines ON diseases.id = diseases_medicines.diseaseId
  JOIN medicines on diseases_medicines.medicineId = medicines.id;
=======
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
>>>>>>> 6bf400ff3d65be9d333cb2a97b85ec3a814c8b2d
