DROP TABLE IF EXISTS employee_audit;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary NUMERIC(10,2),
    joining_date DATE
);

CREATE TABLE employee_audit
(
    audit_id SERIAL PRIMARY KEY,
    employee_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);