-- q01. Prints out the ssn, first name
-- and contact number of all four customers.

-- vertical subset (All rows, some columns):

SELECT ssn, fname, ccontact_number
FROM customer;

-- horizontal subset (all columns, some rows):


SELECT * FROM employee
WHERE area = 'North Dunedin';
