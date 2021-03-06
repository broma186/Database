-- q01. Prints out the ssn, first name
-- and contact number of all four customers.

-- vertical subset (All rows, some columns):

SELECT ssn, fname, ccontact_number
FROM customer;

-- horizontal subset (all columns, some rows):


SELECT * FROM employee
WHERE area = 'North Dunedin';


-- q02. Joins customer and shopping list so
--      we know how many products a customer purchased
--      and when.

SELECT c.ssn, s.shopping_date, c.fname, c.lname, s.num_products
FROM customer c, shopping_list s
WHERE c.ssn = s.ssn;

-- q03. Joins customer, shopping_list and containing tables
--      to show us what products they are purchasing.

SELECT c.ssn, s.shopping_date, c.fname, c.lname, o.productid, o.quantity
FROM customer c, shopping_list s, containing o
WHERE c.ssn = s.ssn
AND s.shopping_date = o.shopping_date;



-- q04. Prints out ssn, first name and lname of all employees
--      have salaries less than 45000.

SELECT ssn, fname, lname
FROM employee
WHERE salary != '45000';

-- q05. Prints out small table with personal
--      details of those who have short names
--      beginning with 'T'.

SELECT fname, ssn, lname, salary FROM employee
WHERE fname LIKE 'T___';

-- q06. Lists all the employees born before the
--      nineties.

SELECT ssn, fname, lname, bdate
FROM employee
WHERE bdate < TO_DATE('01-01-1990','DD-MM-YYYY');

-- q07. Shows how many employees there are in each
--      department with a salary over 10000.

SELECT dno, COUNT(*)
FROM employee
WHERE salary > 10000
GROUP BY dno;

-- q08. Same thing as before, except it excludes the
--      first two departments.


SELECT dno, COUNT(*)
FROM employee
WHERE salary > 10000
GROUP BY dno
HAVING dno > 2;

-- q09. All customer details in ascending order of ssn.

SELECT *
FROM customer
order by ssn;
        
-- q10. Product details of those that are higher than the
--      average product price.

SELECT *
FROM product
WHERE price >
      (SELECT AVG(price)
      FROM product);
      
-- q11. Lists all employees who are not managers.

SELECT fname, lname
FROM employee
WHERE NOT EXISTS
      (SELECT *
      FROM department
      WHERE ssn = mgrssn);

-- q12. Counts the number of recorded shopping lists.

SELECT COUNT(shopping_date)
FROM shopping_list;

-- q13. The price of the cheapest product in the butchery.

SELECT MIN(price)
FROM product
WHERE dno = 2;

-- q14. Deletes product with the id '1000.'

DELETE FROM product
WHERE productid = '1000';

-- q15. Changes an employees living area and department number
--      given a first name.

UPDATE employee
SET area = 'North Dunedin', dno = 3
WHERE fname = 'Pete';
     
