DROP TABLE IF EXISTS products;

CREATE TABLE products
(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    stock_quantity INT
);