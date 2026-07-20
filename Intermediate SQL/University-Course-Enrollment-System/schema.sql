----------------------------------------------------------
-- Drop Existing Tables
----------------------------------------------------------

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS student_profiles;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

----------------------------------------------------------
-- Departments
----------------------------------------------------------

CREATE TABLE departments
(
    department_id SERIAL PRIMARY KEY,

    department_name VARCHAR(100) NOT NULL UNIQUE
);

----------------------------------------------------------
-- Students
----------------------------------------------------------

CREATE TABLE students
(
    student_id SERIAL PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    gender VARCHAR(10),

    age INT,

    department_id INT,

    CONSTRAINT fk_student_department
    FOREIGN KEY(department_id)
    REFERENCES departments(department_id)
);

----------------------------------------------------------
-- Student Profiles
-- One-to-One Relationship
----------------------------------------------------------

CREATE TABLE student_profiles
(
    profile_id SERIAL PRIMARY KEY,

    student_id INT UNIQUE,

    email VARCHAR(100),

    phone VARCHAR(20),

    city VARCHAR(50),

    CONSTRAINT fk_profile_student
    FOREIGN KEY(student_id)
    REFERENCES students(student_id)
);

----------------------------------------------------------
-- Instructors
----------------------------------------------------------

CREATE TABLE instructors
(
    instructor_id SERIAL PRIMARY KEY,

    instructor_name VARCHAR(100),

    department_id INT,

    CONSTRAINT fk_instructor_department
    FOREIGN KEY(department_id)
    REFERENCES departments(department_id)
);

----------------------------------------------------------
-- Courses
----------------------------------------------------------

CREATE TABLE courses
(
    course_id SERIAL PRIMARY KEY,

    course_name VARCHAR(100),

    credits INT,

    instructor_id INT,

    CONSTRAINT fk_course_instructor
    FOREIGN KEY(instructor_id)
    REFERENCES instructors(instructor_id)
);

----------------------------------------------------------
-- Enrollments
-- Many-to-Many Relationship
----------------------------------------------------------

CREATE TABLE enrollments
(
    enrollment_id SERIAL PRIMARY KEY,

    student_id INT,

    course_id INT,

    semester VARCHAR(20),

    grade VARCHAR(5),

    CONSTRAINT fk_enrollment_student
    FOREIGN KEY(student_id)
    REFERENCES students(student_id),

    CONSTRAINT fk_enrollment_course
    FOREIGN KEY(course_id)
    REFERENCES courses(course_id)
);
