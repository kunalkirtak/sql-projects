DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    city VARCHAR(50),
    membership VARCHAR(20)
);

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    amount NUMERIC(10,2),
    status VARCHAR(20)
);