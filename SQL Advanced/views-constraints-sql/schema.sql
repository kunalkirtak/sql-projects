-------------------------------------------------------
-- Remove existing tables
-------------------------------------------------------

DROP TABLE IF EXISTS enrollments CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS departments CASCADE;

-------------------------------------------------------
-- Departments
-------------------------------------------------------

CREATE TABLE departments
(
    department_id SERIAL PRIMARY KEY,

    department_name VARCHAR(100)
    UNIQUE
    NOT NULL,

    hod_name VARCHAR(100)
    NOT NULL
);

-------------------------------------------------------
-- Students
-------------------------------------------------------

CREATE TABLE students
(
    student_id SERIAL PRIMARY KEY,

    roll_number VARCHAR(20)
    UNIQUE
    NOT NULL,

    first_name VARCHAR(50)
    NOT NULL,

    last_name VARCHAR(50)
    NOT NULL,

    age INT
    CHECK(age>=17),

    gender VARCHAR(10)
    CHECK(gender IN ('Male','Female')),

    email VARCHAR(100)
    UNIQUE,

    city VARCHAR(50)
    DEFAULT 'Unknown',

    cgpa DECIMAL(3,2)
    CHECK(cgpa BETWEEN 0 AND 10),

    department_id INT
    NOT NULL,

    CONSTRAINT fk_student_department

    FOREIGN KEY(department_id)

    REFERENCES departments(department_id)
);

-------------------------------------------------------
-- Courses
-------------------------------------------------------

CREATE TABLE courses
(
    course_id SERIAL PRIMARY KEY,

    course_code VARCHAR(20)
    UNIQUE
    NOT NULL,

    course_name VARCHAR(100)
    NOT NULL,

    credits INT
    CHECK(credits BETWEEN 1 AND 5),

    department_id INT
    NOT NULL,

    CONSTRAINT fk_course_department

    FOREIGN KEY(department_id)

    REFERENCES departments(department_id)
);

-------------------------------------------------------
-- Enrollments
-------------------------------------------------------

CREATE TABLE enrollments
(
    enrollment_id SERIAL PRIMARY KEY,

    student_id INT
    NOT NULL,

    course_id INT
    NOT NULL,

    semester INT
    CHECK(semester BETWEEN 1 AND 8),

    grade CHAR(2)
    DEFAULT 'NA',

    CONSTRAINT fk_student

    FOREIGN KEY(student_id)

    REFERENCES students(student_id)

    ON DELETE CASCADE,

    CONSTRAINT fk_course

    FOREIGN KEY(course_id)

    REFERENCES courses(course_id)

    ON DELETE CASCADE
);