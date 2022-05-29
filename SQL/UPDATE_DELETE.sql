INSERT INTO doctors (id, name, phone, email, specialty, xpYears)
VALUES (
    21,
    'doctoreName',
    '09992247939',
    'doctore@example.com',
    'specialty',
    1982
  );
--------------------------------------------------------------------------------
UPDATE doctors
SET name = 'updatedDoctore',
  phone = '09992247939',
  email = 'update@gmail.com',
  specialty = 'specialty',
  xpYears = 1982
WHERE id = 21;
--------------------------------------------------------------------------------
SELECT *
FROM doctors
WHERE id = 21;
--------------------------------------------------------------------------------
DELETE FROM doctors
WHERE id = 21;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
INSERT INTO patients (id, name, phone, email, healthCare)
VALUES (
    21,
    'patientName',
    '1-691-837-4930x947',
    'patients@example.com',
    0
  );
--------------------------------------------------------------------------------
UPDATE patients
SET name = 'updatedPatient',
  phone = '1-691-837-4930x947',
  email = 'update@gmail.com',
  healthCare = 0
WHERE id = 21;
--------------------------------------------------------------------------------
SELECT *
FROM patients
WHERE id = 21;
--------------------------------------------------------------------------------
DELETE FROM patients
WHERE id = 21;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
INSERT INTO branches_doctors (id, brancheId, doctorId, nHours)
VALUES (21, 1, 21, 8);
--------------------------------------------------------------------------------
UPDATE branches_doctors
SET brancheId = 1,
  doctorId = 21,
  nHours = 4
WHERE id = 21;
--------------------------------------------------------------------------------
SELECT *
FROM branches_doctors
WHERE id = 21;
--------------------------------------------------------------------------------
DELETE FROM branches_doctors
WHERE id = 21;