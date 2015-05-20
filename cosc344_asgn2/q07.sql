-- q07. Shows how many employees there are in each
--      department with a salary over 10000.

SELECT dno, COUNT(*)
FROM employee
WHERE salary > 10000
GROUP BY dno;
