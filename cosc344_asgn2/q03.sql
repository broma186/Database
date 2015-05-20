
-- q03. Joins customer, shopping_list and containing tables
--      to show us what products they are purchasing.

SELECT c.ssn, s.shopping_date, c.fname, c.lname, o.productid, o.quantity
FROM customer c, shopping_list s, containing o
WHERE c.ssn = s.ssn
AND s.shopping_date = o.shopping_date;

