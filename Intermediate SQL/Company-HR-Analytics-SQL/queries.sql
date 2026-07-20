------------------------------------------------------------
-- 1. View all employees
------------------------------------------------------------

SELECT *
FROM employees;

------------------------------------------------------------
-- 2. Total number of employees
------------------------------------------------------------

SELECT COUNT(*) AS total_employees
FROM employees;

------------------------------------------------------------
-- 3. Total salary paid by the company
------------------------------------------------------------

SELECT SUM(salary) AS total_salary
FROM employees;

------------------------------------------------------------
-- 4. Average salary
------------------------------------------------------------

SELECT ROUND(AVG(salary),2) AS average_salary
FROM employees;

------------------------------------------------------------
-- 5. Highest salary
------------------------------------------------------------

SELECT MAX(salary) AS highest_salary
FROM employees;

------------------------------------------------------------
-- 6. Lowest salary
------------------------------------------------------------

SELECT MIN(salary) AS lowest_salary
FROM employees;

------------------------------------------------------------
-- 7. Number of unique cities
------------------------------------------------------------

SELECT COUNT(DISTINCT city) AS unique_cities
FROM employees;

------------------------------------------------------------
-- 8. Number of unique designations
------------------------------------------------------------

SELECT COUNT(DISTINCT designation) AS unique_designations
FROM employees;

------------------------------------------------------------
-- GROUP BY
------------------------------------------------------------

------------------------------------------------------------
-- 9. Employees in each department
------------------------------------------------------------

SELECT
department_id,
COUNT(*) AS total_employees
FROM employees
GROUP BY department_id
ORDER BY department_id;

------------------------------------------------------------
-- 10. Average salary by department
------------------------------------------------------------

SELECT
department_id,
ROUND(AVG(salary),2) AS average_salary
FROM employees
GROUP BY department_id
ORDER BY average_salary DESC;

------------------------------------------------------------
-- 11. Highest salary in each department
------------------------------------------------------------

SELECT
department_id,
MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id
ORDER BY highest_salary DESC;

------------------------------------------------------------
-- 12. Lowest salary in each department
------------------------------------------------------------

SELECT
department_id,
MIN(salary) AS lowest_salary
FROM employees
GROUP BY department_id
ORDER BY lowest_salary;

------------------------------------------------------------
-- 13. Total salary by department
------------------------------------------------------------

SELECT
department_id,
SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC;

------------------------------------------------------------
-- 14. Average experience by department
------------------------------------------------------------

SELECT
department_id,
ROUND(AVG(experience_years),2) AS avg_experience
FROM employees
GROUP BY department_id
ORDER BY avg_experience DESC;

------------------------------------------------------------
-- GROUP BY Multiple Columns
------------------------------------------------------------

------------------------------------------------------------
-- 15. Employees grouped by Department and Gender
------------------------------------------------------------

SELECT
department_id,
gender,
COUNT(*) AS total
FROM employees
GROUP BY department_id, gender
ORDER BY department_id;

------------------------------------------------------------
-- 16. Salary by Department and Gender
------------------------------------------------------------

SELECT
department_id,
gender,
SUM(salary) AS total_salary
FROM employees
GROUP BY department_id, gender
ORDER BY department_id;

------------------------------------------------------------
-- 17. Average salary by Department and Gender
------------------------------------------------------------

SELECT
department_id,
gender,
ROUND(AVG(salary),2) AS average_salary
FROM employees
GROUP BY department_id, gender
ORDER BY department_id;

------------------------------------------------------------
-- 18. Employee count by City and Gender
------------------------------------------------------------

SELECT
city,
gender,
COUNT(*) AS total_employees
FROM employees
GROUP BY city, gender
ORDER BY city;

------------------------------------------------------------
-- HAVING
------------------------------------------------------------

------------------------------------------------------------
-- 19. Departments having more than 4 employees
------------------------------------------------------------

SELECT
department_id,
COUNT(*) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 4;

------------------------------------------------------------
-- 20. Departments with average salary above 90000
------------------------------------------------------------

SELECT
department_id,
ROUND(AVG(salary),2) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 90000;

------------------------------------------------------------
-- 21. Departments whose total salary exceeds 400000
------------------------------------------------------------

SELECT
department_id,
SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 400000;

------------------------------------------------------------
-- 22. Cities having more than two employees
------------------------------------------------------------

SELECT
city,
COUNT(*) AS employees
FROM employees
GROUP BY city
HAVING COUNT(*) > 2;

------------------------------------------------------------
-- Conditional Aggregation
------------------------------------------------------------

------------------------------------------------------------
-- 23. Male and Female employees
------------------------------------------------------------

SELECT

SUM(CASE
WHEN gender='Male' THEN 1
ELSE 0
END) AS male_employees,

SUM(CASE
WHEN gender='Female' THEN 1
ELSE 0
END) AS female_employees

FROM employees;

------------------------------------------------------------
-- 24. Employees earning above ₹100000
------------------------------------------------------------

SELECT

SUM(CASE
WHEN salary>100000 THEN 1
ELSE 0
END) AS employees_above_100k

FROM employees;

------------------------------------------------------------
-- 25. Employees earning below ₹80000
------------------------------------------------------------

SELECT

SUM(CASE
WHEN salary<80000 THEN 1
ELSE 0
END) AS employees_below_80k

FROM employees;

------------------------------------------------------------
-- 26. Total salary of Male employees
------------------------------------------------------------

SELECT

SUM(CASE
WHEN gender='Male'
THEN salary
ELSE 0
END) AS male_salary

FROM employees;

------------------------------------------------------------
-- 27. Total salary of Female employees
------------------------------------------------------------

SELECT

SUM(CASE
WHEN gender='Female'
THEN salary
ELSE 0
END) AS female_salary

FROM employees;

------------------------------------------------------------
-- 28. Total experienced employees
------------------------------------------------------------

SELECT

SUM(CASE
WHEN experience_years>=5
THEN 1
ELSE 0
END) AS experienced_employees

FROM employees;

------------------------------------------------------------
-- Combined Analytics
------------------------------------------------------------

------------------------------------------------------------
-- 29. Department Salary Report
------------------------------------------------------------

SELECT

department_id,

COUNT(*) AS employees,

SUM(salary) AS total_salary,

ROUND(AVG(salary),2) AS average_salary,

MIN(salary) AS minimum_salary,

MAX(salary) AS maximum_salary

FROM employees

GROUP BY department_id

ORDER BY total_salary DESC;

------------------------------------------------------------
-- 30. City-wise Employee Report
------------------------------------------------------------

SELECT

city,

COUNT(*) AS total_employees,

ROUND(AVG(salary),2) AS average_salary

FROM employees

GROUP BY city

ORDER BY total_employees DESC;

------------------------------------------------------------
-- 31. Department Experience Report
------------------------------------------------------------

SELECT

department_id,

COUNT(*) AS employees,

ROUND(AVG(experience_years),2) AS average_experience

FROM employees

GROUP BY department_id

HAVING AVG(experience_years) >=4

ORDER BY average_experience DESC;
