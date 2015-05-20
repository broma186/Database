-- q11. Lists all employees who are not managers.

SELECT fname, lname
FROM employee
WHERE NOT EXISTS
      (SELECT *
      FROM department
      WHERE ssn = mgrssn);
