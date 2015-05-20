-- q15. Changes an employees living area and department number
--      given a first name.

UPDATE employee
SET area = 'North Dunedin', dno = 3
WHERE fname = 'Pete';
