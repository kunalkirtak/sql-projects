-------------------------------------------------------
-- View all departments
-------------------------------------------------------

SELECT *
FROM departments;

-------------------------------------------------------
-- View all students
-------------------------------------------------------

SELECT *
FROM students;

-------------------------------------------------------
-- View all courses
-------------------------------------------------------

SELECT *
FROM courses;

-------------------------------------------------------
-- View all enrollments
-------------------------------------------------------

SELECT *
FROM enrollments;

-------------------------------------------------------
-- Students with CGPA greater than 9
-------------------------------------------------------

SELECT
roll_number,
first_name,
last_name,
cgpa

FROM students

WHERE cgpa > 9

ORDER BY cgpa DESC;

-------------------------------------------------------
-- Students from AI Department
-------------------------------------------------------

SELECT
first_name,
last_name,
department_id

FROM students

WHERE department_id = 2;

-------------------------------------------------------
-- Create View
-------------------------------------------------------

CREATE VIEW student_basic_details AS

SELECT

roll_number,
first_name,
last_name,
city,
cgpa

FROM students;

-------------------------------------------------------
-- Query View
-------------------------------------------------------

SELECT *
FROM student_basic_details;

-------------------------------------------------------
-- Create View for Course Details
-------------------------------------------------------

CREATE VIEW course_information AS

SELECT

course_code,
course_name,
credits

FROM courses;

-------------------------------------------------------
-- Query View
-------------------------------------------------------

SELECT *
FROM course_information;

-------------------------------------------------------
-- Create View for Enrollment Details
-------------------------------------------------------

CREATE VIEW enrollment_details AS

SELECT

student_id,
course_id,
semester,
grade

FROM enrollments;

-------------------------------------------------------
-- Query View
-------------------------------------------------------

SELECT *
FROM enrollment_details;

-------------------------------------------------------
-- Create Materialized View
-------------------------------------------------------

CREATE MATERIALIZED VIEW student_performance AS

SELECT

roll_number,
first_name,
last_name,
cgpa

FROM students

ORDER BY cgpa DESC;

-------------------------------------------------------
-- Query Materialized View
-------------------------------------------------------

SELECT *
FROM student_performance;

-------------------------------------------------------
-- Refresh Materialized View
-------------------------------------------------------

REFRESH MATERIALIZED VIEW student_performance;

-------------------------------------------------------
-- Update Student CGPA
-------------------------------------------------------

UPDATE students

SET cgpa = 9.80

WHERE student_id = 1;

-------------------------------------------------------
-- Materialized View (Old Data)
-------------------------------------------------------

SELECT *
FROM student_performance;

-------------------------------------------------------
-- Refresh Materialized View Again
-------------------------------------------------------

REFRESH MATERIALIZED VIEW student_performance;

-------------------------------------------------------
-- Materialized View (Updated Data)
-------------------------------------------------------

SELECT *
FROM student_performance;

-------------------------------------------------------
-- Constraint Demonstration
-------------------------------------------------------

-- PRIMARY KEY

SELECT student_id,
       first_name
FROM students;

-------------------------------------------------------
-- UNIQUE
-------------------------------------------------------

SELECT DISTINCT city
FROM students;

-------------------------------------------------------
-- CHECK
-------------------------------------------------------

SELECT

first_name,
cgpa

FROM students

WHERE cgpa BETWEEN 8 AND 10;

-------------------------------------------------------
-- DEFAULT
-------------------------------------------------------

INSERT INTO students
(
roll_number,
first_name,
last_name,
age,
gender,
email,
cgpa,
department_id
)

VALUES
(
'CS104',
'Rohit',
'Sharma',
20,
'Male',
'rohit@gmail.com',
8.20,
1
);

-------------------------------------------------------
-- Verify DEFAULT city
-------------------------------------------------------

SELECT

roll_number,
city

FROM students

WHERE roll_number='CS104';

-------------------------------------------------------
-- Delete Views Run when needed
-------------------------------------------------------

--DROP VIEW enrollment_details;

--DROP VIEW course_information;

--DROP VIEW student_basic_details;

-------------------------------------------------------
-- Drop Materialized View
-------------------------------------------------------

--DROP MATERIALIZED VIEW student_performance;