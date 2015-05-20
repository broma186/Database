-- q08. Same thing as before, except it excludes the
--      first two departments.


SELECT dno, COUNT(*)
FROM employee
WHERE salary > 10000
GROUP BY dno
HAVING dno > 2;
