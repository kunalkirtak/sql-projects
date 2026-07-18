DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    designation VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    experience_years INT,
    manager_name VARCHAR(100),
    bonus DECIMAL(10,2)
);