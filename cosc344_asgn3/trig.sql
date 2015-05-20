-- Matthew Brooker, 541670.

-- This trigger calculates the number of employees
-- found in each department after an employee (or
-- specifically a department number) is inserted,
-- updated or deleted.

CREATE OR REPLACE TRIGGER numEmployees
AFTER INSERT OR UPDATE OR DELETE OF dno on employee
 FOR EACH ROW
 BEGIN
  IF INSERTING THEN
  -- Increment the no. of employees for the respective
  -- department number.
   UPDATE department
   SET number_of_employees = number_of_employees + 1
   WHERE dnumber = :NEW.dno;
  ELSIF UPDATING THEN
  -- Increment the no. of employees found in the new
  -- department and decrement from the old department.
   UPDATE department
   SET number_of_employees = number_of_employees + 1
   WHERE dnumber = :NEW.dno;
   UPDATE department
   SET number_of_employees = number_of_employees - 1
   WHERE dnumber = :OLD.dno;
  ELSE
  -- If deleting, decrement no. of employees found
  -- in the old department.
   UPDATE department
   SET number_of_employees = number_of_employees - 1
   WHERE dnumber = :OLD.dno;
  END IF;
END;
/
