
DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    department VARCHAR(50) NOT NULL,

    designation VARCHAR(50) NOT NULL,

    city VARCHAR(50),

    salary DECIMAL(10,2) NOT NULL,

    experience_years INT NOT NULL,

    joining_date DATE NOT NULL,

    performance_score DECIMAL(3,1),

    bonus DECIMAL(10,2)
);