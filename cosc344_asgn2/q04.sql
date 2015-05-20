-- q04. Prints out ssn, first name and lname of all employees
--      have salaries less than 45000.

SELECT ssn, fname, lname
FROM employee
WHERE salary != '45000';
