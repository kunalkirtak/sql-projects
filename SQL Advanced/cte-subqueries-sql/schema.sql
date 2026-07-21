--------------------------------------------------------
-- Remove existing tables
--------------------------------------------------------

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

--------------------------------------------------------
-- Customers Table
--------------------------------------------------------

CREATE TABLE customers
(
    customer_id SERIAL PRIMARY KEY,

    customer_name VARCHAR(100) NOT NULL,

    city VARCHAR(50) NOT NULL,

    email VARCHAR(100) UNIQUE,

    registration_date DATE NOT NULL DEFAULT CURRENT_DATE
);

--------------------------------------------------------
-- Products Table
--------------------------------------------------------

CREATE TABLE products
(
    product_id SERIAL PRIMARY KEY,

    product_name VARCHAR(100) NOT NULL,

    category VARCHAR(50) NOT NULL,

    price DECIMAL(10,2) NOT NULL CHECK(price > 0)
);

--------------------------------------------------------
-- Orders Table
--------------------------------------------------------

CREATE TABLE orders
(
    order_id SERIAL PRIMARY KEY,

    customer_id INT NOT NULL,

    product_id INT NOT NULL,

    quantity INT NOT NULL CHECK(quantity > 0),

    order_date DATE NOT NULL,

    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_product
        FOREIGN KEY(product_id)
        REFERENCES products(product_id)
);