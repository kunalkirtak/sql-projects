------------------------------------------------
-- View complete table
------------------------------------------------

SELECT *
FROM employees;

------------------------------------------------
-- UUID values
------------------------------------------------

SELECT employee_id,
       full_name
FROM employees;

------------------------------------------------
-- View Skills Array
------------------------------------------------

SELECT full_name,
       skills
FROM employees;

------------------------------------------------
-- First Skill
------------------------------------------------

SELECT
full_name,

skills[1]

FROM employees;

------------------------------------------------
-- Second Skill
------------------------------------------------

SELECT
full_name,

skills[2]

FROM employees;

------------------------------------------------
-- Array Length
------------------------------------------------

SELECT
full_name,

array_length(skills,1)

FROM employees;

------------------------------------------------
-- Employees having SQL skill
------------------------------------------------

SELECT *

FROM employees

WHERE

skills @> ARRAY['SQL'];

------------------------------------------------
-- Employees having Python
------------------------------------------------

SELECT *

FROM employees

WHERE

skills @> ARRAY['Python'];

------------------------------------------------
-- Employees having AWS
------------------------------------------------

SELECT *

FROM employees

WHERE

skills @> ARRAY['AWS'];

------------------------------------------------
-- JSON complete
------------------------------------------------

SELECT
full_name,
profile

FROM employees;

------------------------------------------------
-- Extract City
------------------------------------------------

SELECT

full_name,

profile->>'city'

AS city

FROM employees;

------------------------------------------------
-- Extract Email
------------------------------------------------

SELECT

full_name,

profile->>'email'

AS email

FROM employees;

------------------------------------------------
-- Experience
------------------------------------------------

SELECT

full_name,

profile->>'experience'

AS experience

FROM employees;

------------------------------------------------
-- Certified?
------------------------------------------------

SELECT

full_name,

profile->>'certified'

AS certified

FROM employees;

------------------------------------------------
-- JSON Key Exists
------------------------------------------------

SELECT *

FROM employees

WHERE

profile ? 'city';

------------------------------------------------
-- JSON Contains
------------------------------------------------

SELECT *

FROM employees

WHERE

profile @>

'{"city":"Pune"}';

------------------------------------------------
-- Employees from Mumbai
------------------------------------------------

SELECT *

FROM employees

WHERE

profile @>

'{"city":"Mumbai"}';

------------------------------------------------
-- Salary above 90000
------------------------------------------------

SELECT *

FROM employees

WHERE salary>90000;

------------------------------------------------
-- Order by Salary
------------------------------------------------

SELECT *

FROM employees

ORDER BY salary DESC;

------------------------------------------------
-- Top 3 Salary
------------------------------------------------

SELECT *

FROM employees

ORDER BY salary DESC

LIMIT 3;

------------------------------------------------
-- Combine JSON + Array
------------------------------------------------

SELECT

full_name,

profile->>'city' AS city,

skills

FROM employees;

------------------------------------------------
-- JSON + Array + Salary
------------------------------------------------

SELECT

full_name,

salary,

profile->>'experience',

skills

FROM employees;