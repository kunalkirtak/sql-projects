-------------------------------------------------------
-- View Complete Sales Data
-------------------------------------------------------

SELECT *
FROM sales;

-------------------------------------------------------
-- Total Number of Sales
-------------------------------------------------------

SELECT COUNT(*) AS total_sales
FROM sales;

-------------------------------------------------------
-- Total Customers
-------------------------------------------------------

SELECT COUNT(*) AS total_customers
FROM customers;

-------------------------------------------------------
-- Total Products
-------------------------------------------------------

SELECT COUNT(*) AS total_products
FROM products;

-------------------------------------------------------
-- COUNT(DISTINCT)
-------------------------------------------------------

SELECT COUNT(DISTINCT city)
AS unique_cities
FROM customers;

-------------------------------------------------------
-- DISTINCT Categories
-------------------------------------------------------

SELECT COUNT(DISTINCT category)
AS unique_categories
FROM products;

-------------------------------------------------------
-- Total Quantity Sold
-------------------------------------------------------

SELECT SUM(quantity)
AS total_quantity
FROM sales;

-------------------------------------------------------
-- Average Product Price
-------------------------------------------------------

SELECT AVG(price)
AS average_price
FROM products;

-------------------------------------------------------
-- Highest Product Price
-------------------------------------------------------

SELECT MAX(price)
AS highest_price
FROM products;

-------------------------------------------------------
-- Lowest Product Price
-------------------------------------------------------

SELECT MIN(price)
AS lowest_price
FROM products;

-------------------------------------------------------
-- Total Inventory Value
-------------------------------------------------------

SELECT SUM(price)
AS total_product_value
FROM products;

-------------------------------------------------------
-- Average Quantity Per Sale
-------------------------------------------------------

SELECT AVG(quantity)
AS average_quantity
FROM sales;

-------------------------------------------------------
-- Total Electronics Products
-------------------------------------------------------

SELECT COUNT(*)
FROM products
WHERE category='Electronics';

-------------------------------------------------------
-- Total Storage Products
-------------------------------------------------------

SELECT COUNT(*)
FROM products
WHERE category='Storage';

-------------------------------------------------------
-- Conditional Aggregation
-------------------------------------------------------

SELECT

SUM(

CASE

WHEN payment_method='UPI'

THEN quantity

ELSE 0

END

)

AS upi_quantity

FROM sales;

-------------------------------------------------------
-- Card Sales
-------------------------------------------------------

SELECT

SUM(

CASE

WHEN payment_method='Card'

THEN quantity

ELSE 0

END

)

AS card_quantity

FROM sales;

-------------------------------------------------------
-- Cash Sales
-------------------------------------------------------

SELECT

SUM(

CASE

WHEN payment_method='Cash'

THEN quantity

ELSE 0

END

)

AS cash_quantity

FROM sales;

-------------------------------------------------------
-- Expensive Products
-------------------------------------------------------

SELECT

COUNT(

CASE

WHEN price>10000

THEN 1

END

)

AS expensive_products

FROM products;

-------------------------------------------------------
-- Affordable Products
-------------------------------------------------------

SELECT

COUNT(

CASE

WHEN price<=10000

THEN 1

END

)

AS affordable_products

FROM products;

-------------------------------------------------------
-- Revenue Estimate
-------------------------------------------------------

SELECT

SUM(p.price*s.quantity)
AS estimated_revenue

FROM sales s

JOIN products p

ON s.product_id=p.product_id;

-------------------------------------------------------
-- Electronics Revenue
-------------------------------------------------------

SELECT

SUM(

CASE

WHEN p.category='Electronics'

THEN p.price*s.quantity

ELSE 0

END

)

AS electronics_revenue

FROM sales s

JOIN products p

ON s.product_id=p.product_id;

-------------------------------------------------------
-- Storage Revenue
-------------------------------------------------------

SELECT

SUM(

CASE

WHEN p.category='Storage'

THEN p.price*s.quantity

ELSE 0

END

)

AS storage_revenue

FROM sales s

JOIN products p

ON s.product_id=p.product_id;

-------------------------------------------------------
-- Office Revenue
-------------------------------------------------------

SELECT

SUM(

CASE

WHEN p.category='Office'

THEN p.price*s.quantity

ELSE 0

END

)

AS office_revenue

FROM sales s

JOIN products p

ON s.product_id=p.product_id;