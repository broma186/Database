-- q06. Lists all the employees born before the
--      nineties.

SELECT ssn, fname, lname, bdate
FROM employee
WHERE bdate < TO_DATE('01-01-1990','DD-MM-YYYY');
