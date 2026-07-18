--------------------------------------------------
-- View all students
--------------------------------------------------

SELECT *
FROM students;

--------------------------------------------------
-- Display only first and last name
--------------------------------------------------

SELECT first_name,
       last_name
FROM students;

--------------------------------------------------
-- Students from Pune
--------------------------------------------------

SELECT *
FROM students
WHERE city='Pune';

--------------------------------------------------
-- AI & ML department
--------------------------------------------------

SELECT *
FROM students
WHERE department='AI & ML';

--------------------------------------------------
-- Students having CGPA above 9
--------------------------------------------------

SELECT *
FROM students
WHERE cgpa>9;

--------------------------------------------------
-- Students age less than 21
--------------------------------------------------

SELECT *
FROM students
WHERE age<21;

--------------------------------------------------
-- Order students by CGPA
--------------------------------------------------

SELECT *
FROM students
ORDER BY cgpa DESC;

--------------------------------------------------
-- Alphabetical order
--------------------------------------------------

SELECT *
FROM students
ORDER BY first_name;

--------------------------------------------------
-- Top 5 students
--------------------------------------------------

SELECT *
FROM students
ORDER BY cgpa DESC
LIMIT 5;

--------------------------------------------------
-- First 3 Computer Science students
--------------------------------------------------

SELECT *
FROM students
WHERE department='Computer Science'
LIMIT 3;