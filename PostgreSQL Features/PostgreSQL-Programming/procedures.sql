--Procedure 1
--Increase salary
----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE increase_salary

(emp_id INT,
increment_amount NUMERIC)

LANGUAGE plpgsql

AS

$$

BEGIN

UPDATE employees

SET salary = salary + increment_amount

WHERE employee_id = emp_id;

END;

$$;

--Run

CALL increase_salary(2,5000);

SELECT * FROM employees;
----------------------------------------------------------------
--Procedure 2
--Change Department
----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE transfer_department
(emp_id INT, new_department VARCHAR)
LANGUAGE plpgsql
AS
$$
BEGIN
UPDATE employees
SET department=new_department
WHERE employee_id=emp_id;
END;
$$;

--Run

CALL transfer_department(3,'AI');

SELECT * FROM employees;