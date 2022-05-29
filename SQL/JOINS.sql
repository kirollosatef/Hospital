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