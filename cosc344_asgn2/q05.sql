
-- q05. Prints out small table with personal
--      details of those who have short names
--      beginning with 'T'.

SELECT fname, ssn, lname, salary FROM employee
WHERE fname LIKE 'T__';
