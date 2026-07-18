--------------------------------------------------------
-- View all employees
--------------------------------------------------------

SELECT *
FROM employees;

--------------------------------------------------------
-- Employees from Pune
--------------------------------------------------------

SELECT *
FROM employees
WHERE city='Pune';

--------------------------------------------------------
-- Employees earning more than 90000
--------------------------------------------------------

SELECT *
FROM employees
WHERE salary>90000;

--------------------------------------------------------
-- AI & ML Department
--------------------------------------------------------

SELECT *
FROM employees
WHERE department='AI & ML';

--------------------------------------------------------
-- DISTINCT Departments
--------------------------------------------------------

SELECT DISTINCT department
FROM employees;

--------------------------------------------------------
-- DISTINCT Cities
--------------------------------------------------------

SELECT DISTINCT city
FROM employees;

--------------------------------------------------------
-- Highest Salary
--------------------------------------------------------

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;

--------------------------------------------------------
-- Top 5 Highest Paid Employees
--------------------------------------------------------

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

--------------------------------------------------------
-- Update Salary
--------------------------------------------------------

UPDATE employees
SET salary=80000
WHERE employee_id=3;

--------------------------------------------------------
-- Update Bonus
--------------------------------------------------------

UPDATE employees
SET bonus=10000
WHERE employee_id=5;

--------------------------------------------------------
-- Delete Sales Executive
--------------------------------------------------------

DELETE FROM employees
WHERE employee_id=9;

--------------------------------------------------------
-- Employees with NULL Bonus
--------------------------------------------------------

SELECT *
FROM employees
WHERE bonus IS NULL;

--------------------------------------------------------
-- Employees with Bonus
--------------------------------------------------------

SELECT *
FROM employees
WHERE bonus IS NOT NULL;

--------------------------------------------------------
-- Replace NULL Bonus
--------------------------------------------------------

SELECT
first_name,
COALESCE(bonus,0) AS bonus
FROM employees;

--------------------------------------------------------
-- Salary Grade
--------------------------------------------------------

SELECT
first_name,
salary,

CASE

WHEN salary>=120000 THEN 'Excellent'

WHEN salary>=100000 THEN 'Very High'

WHEN salary>=80000 THEN 'High'

WHEN salary>=60000 THEN 'Medium'

ELSE 'Entry'

END AS salary_grade

FROM employees;

--------------------------------------------------------
-- Experience Level
--------------------------------------------------------

SELECT

first_name,
experience_years,

CASE

WHEN experience_years>=7 THEN 'Senior'

WHEN experience_years>=4 THEN 'Experienced'

WHEN experience_years>=2 THEN 'Mid Level'

ELSE 'Junior'

END AS experience_level

FROM employees;

--------------------------------------------------------
-- Performance Bonus Status
--------------------------------------------------------

SELECT

first_name,

CASE

WHEN bonus IS NULL THEN 'No Bonus'

ELSE 'Bonus Given'

END AS bonus_status

FROM employees;

--------------------------------------------------------
-- Software Department
--------------------------------------------------------

SELECT *
FROM employees
WHERE department='Software'
ORDER BY salary DESC;

--------------------------------------------------------
-- AI & ML Employees Ordered by Experience
--------------------------------------------------------

SELECT *
FROM employees
WHERE department='AI & ML'
ORDER BY experience_years DESC;

--------------------------------------------------------
-- First Three Employees
--------------------------------------------------------

SELECT *
FROM employees
LIMIT 3;