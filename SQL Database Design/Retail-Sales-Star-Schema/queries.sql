----------------------------------------------------
-- View Dimension Tables
----------------------------------------------------

SELECT * FROM dim_customer;

SELECT * FROM dim_product;

SELECT * FROM dim_store;

SELECT * FROM dim_date;

----------------------------------------------------
-- View Fact Table
----------------------------------------------------

SELECT *
FROM fact_sales;

----------------------------------------------------
-- Total Sales
----------------------------------------------------

SELECT
SUM(sales_amount) AS total_sales
FROM fact_sales;

----------------------------------------------------
-- Total Quantity Sold
----------------------------------------------------

SELECT
SUM(quantity) AS total_quantity
FROM fact_sales;

----------------------------------------------------
-- Sales Above 50000
----------------------------------------------------

SELECT *
FROM fact_sales
WHERE sales_amount > 50000;

----------------------------------------------------
-- Highest Sale
----------------------------------------------------

SELECT *
FROM fact_sales
ORDER BY sales_amount DESC
LIMIT 1;

----------------------------------------------------
-- Top Five Sales
----------------------------------------------------

SELECT *
FROM fact_sales
ORDER BY sales_amount DESC
LIMIT 5;

----------------------------------------------------
-- Sales by Customer
----------------------------------------------------

SELECT

c.customer_name,

f.sales_amount

FROM fact_sales f

JOIN dim_customer c

ON f.customer_key=c.customer_key

ORDER BY f.sales_amount DESC;

----------------------------------------------------
-- Sales by Product
----------------------------------------------------

SELECT

p.product_name,

f.sales_amount

FROM fact_sales f

JOIN dim_product p

ON f.product_key=p.product_key

ORDER BY f.sales_amount DESC;

----------------------------------------------------
-- Sales by Store
----------------------------------------------------

SELECT

s.store_name,

f.sales_amount

FROM fact_sales f

JOIN dim_store s

ON f.store_key=s.store_key;

----------------------------------------------------
-- Sales by Month
----------------------------------------------------

SELECT

d.month,

f.sales_amount

FROM fact_sales f

JOIN dim_date d

ON f.date_key=d.date_key;

----------------------------------------------------
-- Electronics Sales
----------------------------------------------------

SELECT

p.product_name,

f.sales_amount

FROM fact_sales f

JOIN dim_product p

ON p.product_key=f.product_key

WHERE p.category='Electronics';

----------------------------------------------------
-- Mumbai Customers
----------------------------------------------------

SELECT

c.customer_name,

f.sales_amount

FROM fact_sales f

JOIN dim_customer c

ON c.customer_key=f.customer_key

WHERE c.city='Mumbai';