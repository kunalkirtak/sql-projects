DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

CREATE TABLE products
(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE sales
(
    sale_id SERIAL PRIMARY KEY,

    customer_id INT REFERENCES customers(customer_id),

    product_id INT REFERENCES products(product_id),

    quantity INT NOT NULL,

    sale_date DATE,

    payment_method VARCHAR(30)
);