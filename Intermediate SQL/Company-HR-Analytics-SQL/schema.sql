DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-------------------------------------------------------
-- Departments Table
-------------------------------------------------------

CREATE TABLE departments
(
    department_id SERIAL PRIMARY KEY,

    department_name VARCHAR(50) UNIQUE NOT NULL,

    location VARCHAR(50)
);

-------------------------------------------------------
-- Employees Table
-------------------------------------------------------

CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    department_id INT REFERENCES departments(department_id),

    designation VARCHAR(50),

    gender VARCHAR(10),

    city VARCHAR(50),

    salary DECIMAL(10,2),

    experience_years INT
);