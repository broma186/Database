-- Matthew Brooker, 541670.

-- This procedure allows managers to change the price of the available
-- products in the supermarket. If the productid input does not equal
-- an existing product id, an exception is raised.

CREATE OR REPLACE PROCEDURE changeProductPrice(priceChangeId IN CHAR,
                                                  newPrice IN NUMBER)                                                       
AS
  CURSOR pr IS
    SELECT * FROM product;
  prod pr%ROWTYPE;
 noMatch EXCEPTION;

-- For each product, if the manager inputs an existing productid,
-- set the product's price to the new price and leave the program.
-- If the price is not changed, then the exception is raised.
BEGIN
  FOR prod IN pr LOOP
    IF prod.productid = priceChangeId THEN
      UPDATE product
      SET price = newPrice
      WHERE productid = priceChangeId;
      RETURN;
    END IF;      
  END LOOP;
  RAISE noMatch;  
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN NULL;
  WHEN noMatch THEN
    DBMS_OUTPUT.PUT_LINE('The productID you entered does not exist.');
END;
/
