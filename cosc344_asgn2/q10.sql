-- q10. Product details of those that are higher than the
--      average product price.

SELECT *
FROM product
WHERE price >
      (SELECT AVG(price)
      FROM product);
