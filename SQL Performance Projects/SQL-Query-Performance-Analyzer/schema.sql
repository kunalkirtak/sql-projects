DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,

    employee_name VARCHAR(100),

    department VARCHAR(50),

    salary INT,

    city VARCHAR(50)
);