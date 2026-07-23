--Trigger Function
----------------------------------------------------------------
CREATE OR REPLACE FUNCTION employee_audit_function()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
INSERT INTO employee_audit
(employee_id,action_type)
VALUES
(NEW.employee_id,'INSERT');
RETURN NEW;
END;
$$;
----------------------------------------------------------------
--Trigger

CREATE TRIGGER employee_insert_trigger
AFTER INSERT
ON employees
FOR EACH ROW
EXECUTE FUNCTION employee_audit_function();
----------------------------------------------------------------
--Test Trigger

INSERT INTO employees
(employee_name,department,salary,joining_date)
VALUES
('Karan Mehta','Marketing',70000,'2024-06-10');
----------------------------------------------------------------
--Check Audit

SELECT *

FROM employee_audit;
----------------------------------------------------------------
--BEFORE UPDATE Trigger

CREATE OR REPLACE FUNCTION update_audit()

RETURNS TRIGGER

LANGUAGE plpgsql

AS

$$

BEGIN

INSERT INTO employee_audit

(employee_id,action_type)

VALUES

(NEW.employee_id,'UPDATE');

RETURN NEW;

END;

$$;
----------------------------------------------------------------
CREATE TRIGGER employee_update_trigger

BEFORE UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION update_audit();
----------------------------------------------------------------
--Test

UPDATE employees

SET salary=120000

WHERE employee_id=1;
----------------------------------------------------------------
--Check Audit

SELECT *

FROM employee_audit;