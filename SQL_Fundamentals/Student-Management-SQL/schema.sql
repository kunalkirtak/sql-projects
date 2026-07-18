DROP TABLE IF EXISTS students;

CREATE TABLE students
(
    student_id SERIAL PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    age INT,

    gender VARCHAR(10),

    department VARCHAR(50),

    city VARCHAR(50),

    cgpa DECIMAL(3,2)
);