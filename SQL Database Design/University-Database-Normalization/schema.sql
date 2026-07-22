DROP TABLE IF EXISTS student_courses CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS instructors CASCADE;

-------------------------------------------------------
-- ====================================================
-- UNNORMALIZED FORM (UNF)
-- Example only (Not created as table)
--
-- Student_ID | Student_Name | Department |
-- Course1 | Course2 | Course3 | Instructor
--
-- Multiple course values exist in one row.
-- This violates 1NF.
-- ====================================================
-------------------------------------------------------

-------------------------------------------------------
-- FIRST NORMAL FORM (1NF)
-------------------------------------------------------

CREATE TABLE students
(
    student_id SERIAL PRIMARY KEY,

    student_name VARCHAR(100) NOT NULL,

    department_name VARCHAR(100),

    instructor_name VARCHAR(100)
);

CREATE TABLE student_courses
(
    enrollment_id SERIAL PRIMARY KEY,

    student_id INT,

    course_name VARCHAR(100),

    FOREIGN KEY(student_id)
    REFERENCES students(student_id)
);

-------------------------------------------------------
-- SECOND NORMAL FORM (2NF)
--
-- Separate course information.
-------------------------------------------------------

DROP TABLE IF EXISTS student_courses CASCADE;

CREATE TABLE courses
(
    course_id SERIAL PRIMARY KEY,

    course_name VARCHAR(100),

    credits INT
);

CREATE TABLE student_courses
(
    student_id INT,

    course_id INT,

    PRIMARY KEY(student_id,course_id),

    FOREIGN KEY(student_id)
    REFERENCES students(student_id),

    FOREIGN KEY(course_id)
    REFERENCES courses(course_id)
);

-------------------------------------------------------
-- THIRD NORMAL FORM (3NF)
--
-- Department details moved to another table.
-------------------------------------------------------

CREATE TABLE departments
(
    department_id SERIAL PRIMARY KEY,

    department_name VARCHAR(100) UNIQUE,

    hod_name VARCHAR(100)
);

ALTER TABLE students

ADD COLUMN department_id INT;

ALTER TABLE students

ADD CONSTRAINT fk_department

FOREIGN KEY(department_id)

REFERENCES departments(department_id);

ALTER TABLE students

DROP COLUMN department_name;

-------------------------------------------------------
-- BOYCE-CODD NORMAL FORM (BCNF)
--
-- Instructor information separated.
-------------------------------------------------------

CREATE TABLE instructors
(
    instructor_id SERIAL PRIMARY KEY,

    instructor_name VARCHAR(100),

    department_id INT,

    FOREIGN KEY(department_id)

    REFERENCES departments(department_id)
);

ALTER TABLE students

ADD COLUMN instructor_id INT;

ALTER TABLE students

ADD CONSTRAINT fk_instructor

FOREIGN KEY(instructor_id)

REFERENCES instructors(instructor_id);

ALTER TABLE students

DROP COLUMN instructor_name;

-------------------------------------------------------
-- DENORMALIZED REPORTING TABLE
--
-------------------------------------------------------

/*

Student Name

Department

Course

Instructor

All in one table.

Useful for reporting,
NOT recommended
for transaction processing.

*/