--Function 1
--Return yearly salary
--------------------------------------------------------------
CREATE OR REPLACE FUNCTION yearly_salary(emp_salary NUMERIC)

RETURNS NUMERIC

LANGUAGE plpgsql

AS

$$

BEGIN

RETURN emp_salary * 12;

END;

$$;

--Example

SELECT employee_name,
salary,
yearly_salary(salary) AS annual_salary
FROM employees;
----------------------------------------------------------------
--Function 2
--Return salary category
----------------------------------------------------------------
CREATE OR REPLACE FUNCTION salary_grade(emp_salary NUMERIC)

RETURNS TEXT

LANGUAGE plpgsql

AS

$$

BEGIN

IF emp_salary >=100000 THEN

RETURN 'High';

ELSIF emp_salary>=80000 THEN

RETURN 'Medium';

ELSE

RETURN 'Standard';

END IF;

END;

$$;

--Run

SELECT
employee_name,
salary,
salary_grade(salary)
FROM employees;