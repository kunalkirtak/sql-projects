DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_store;
DROP TABLE IF EXISTS dim_date;

----------------------------------------------------
-- Customer Dimension
----------------------------------------------------

CREATE TABLE dim_customer
(
    customer_key SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

----------------------------------------------------
-- Product Dimension
----------------------------------------------------

CREATE TABLE dim_product
(
    product_key SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

----------------------------------------------------
-- Store Dimension
----------------------------------------------------

CREATE TABLE dim_store
(
    store_key SERIAL PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

----------------------------------------------------
-- Date Dimension
----------------------------------------------------

CREATE TABLE dim_date
(
    date_key SERIAL PRIMARY KEY,
    sales_date DATE,
    month VARCHAR(20),
    year INT
);

----------------------------------------------------
-- Fact Table
----------------------------------------------------

CREATE TABLE fact_sales
(
    sales_key SERIAL PRIMARY KEY,

    customer_key INT REFERENCES dim_customer(customer_key),

    product_key INT REFERENCES dim_product(product_key),

    store_key INT REFERENCES dim_store(store_key),

    date_key INT REFERENCES dim_date(date_key),

    quantity INT,

    sales_amount DECIMAL(10,2)
);