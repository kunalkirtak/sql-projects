DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders
(
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    discount DECIMAL(5,2),
    order_status VARCHAR(20),
    payment_method VARCHAR(30)
);