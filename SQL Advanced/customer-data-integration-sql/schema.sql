DROP TABLE IF EXISTS store_customers;
DROP TABLE IF EXISTS online_customers;

CREATE TABLE online_customers
(
    customer_id INT PRIMARY KEY,

    customer_name VARCHAR(100),

    city VARCHAR(50)
);

CREATE TABLE store_customers
(
    customer_id INT PRIMARY KEY,

    customer_name VARCHAR(100),

    city VARCHAR(50)
);