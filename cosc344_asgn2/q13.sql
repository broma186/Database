-- q13. The price of the cheapest product in the butchery.

SELECT MIN(price)
FROM product
WHERE dno = 2;
