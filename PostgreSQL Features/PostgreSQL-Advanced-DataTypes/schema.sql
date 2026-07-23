CREATE EXTENSION IF NOT EXISTS "pgcrypto";

DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    employee_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    full_name VARCHAR(100) NOT NULL,

    department VARCHAR(50),

    salary NUMERIC(10,2),

    skills TEXT[],

    profile JSONB
);