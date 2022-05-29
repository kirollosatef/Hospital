--------------------------------------BETWEEN--------------------------------------
SELECT *
FROM doctores
WHERE xpYears BETWEEN 2000 AND 2008;
---
SELECT *
FROM nurses
WHERE xpYears BETWEEN 1900 AND 1999;
---
SELECT *
FROM medicines
WHERE expiryDate BETWEEN '2000 -01 -01 00 :00 :00' AND '2008 -08 -01 00 :00 :00';
---
SELECT *
FROM patients
WHERE name BETWEEN 'Hansen' AND 'Pettersen';
---
SELECT *
FROM branches_doctors
WHERE nHours NOT BETWEEN 8 AND 10;
----------------------------------------LIKE---------------------------------------
SELECT *
FROM patients
WHERE name LIKE '%en%';
---
SELECT *
FROM patients
WHERE name LIKE '%en%'
  AND healthCare = 1;
---
SELECT *
FROM doctores
WHERE name LIKE 'a__%' 
---
SELECT *
FROM managers
WHERE name LIKE '__t%';
---
SELECT *
FROM nurses
WHERE name LIKE 'e%a';
----------------------------------------OR/AND-----------------------------------------
SELECT *
FROM patients
WHERE id > 5
  OR healthCare = 1;
---
SELECT *
FROM branches
WHERE location = 'Sydnieshire'
  or location = 'North';
---
SELECT *
FROM doctors
WHERE specialty = 'illum'
  AND xpYears > 2000;
----------------------------------------IS/IS NOT NULL------------------------------------
SELECT *
FROM patients
WHERE healthCare IS NOT NULL;
---
SELECT *
FROM patients
WHERE healthCare IS NULL;
----------------------------------------[=,>,<,!=]-----------------------------------------
SELECT *
FROM patients
WHERE healthCare = 1;
---
SELECT *
FROM doctores
WHERE xpYears > 2000;
---
SELECT *
FROM branches_doctors
WHERE nHours < 6;
---
SELECT *
FROM nurses
WHERE xpYears != 2000;
