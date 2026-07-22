--1 Sequential Scan
EXPLAIN

SELECT *

FROM employees

WHERE city='Pune';
-----------------------------------------------

--2 Index Scan
EXPLAIN

SELECT *

FROM employees

WHERE department='AI';

-----------------------------------------------

--3 EXPLAIN ANALYZE
EXPLAIN ANALYZE

SELECT *

FROM employees

WHERE department='AI';

--------------------------------------------------
--4 Salary Query
EXPLAIN ANALYZE

SELECT *

FROM employees

WHERE salary>100000;
-----------------------------------------------
--5 Sorting
EXPLAIN ANALYZE

SELECT *

FROM employees

ORDER BY salary DESC

LIMIT 10;
--------------------------------------------------
--6 Aggregate
EXPLAIN ANALYZE

SELECT COUNT(*)

FROM employees

WHERE department='Finance';
-----------------------------------------------
--7 Before Dropping Index
EXPLAIN ANALYZE

SELECT *

FROM employees

WHERE department='HR';

------------------------------------------------

--8 Drop Index
DROP INDEX idx_department;
-----------------------------------------------
--9 Same Query Again
EXPLAIN ANALYZE

SELECT *

FROM employees

WHERE department='HR';

-----------------------------------------------
--10 Recreate Index
CREATE INDEX idx_department
ON employees(department);
-----------------------------------------------
--11 Compare Again
EXPLAIN ANALYZE

SELECT *

FROM employees

WHERE department='HR';

-----------------------------------------------
--12 Sorting Without Index
EXPLAIN ANALYZE

SELECT *

FROM employees

ORDER BY city;
---------------------------------------------------
--13 Aggregate Query
EXPLAIN ANALYZE

SELECT department,

COUNT(*)

FROM employees

GROUP BY department;