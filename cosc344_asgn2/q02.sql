-- q02. Joins customer and shopping list so
--      we know how many products a customer purchased
--      and when.

SELECT c.ssn, s.shopping_date, c.fname, c.lname, s.num_products
FROM customer c, shopping_list s
WHERE c.ssn = s.ssn;
