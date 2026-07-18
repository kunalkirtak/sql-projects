-- View all customers
--------------------------------------------------
SELECT *
FROM customers;
--------------------------------------------------

-- View all orders
SELECT *
FROM orders;
--------------------------------------------------

-- DISTINCT

-- Unique Cities
SELECT DISTINCT city
FROM customers;

-- Unique Payment Methods
SELECT DISTINCT payment_method
FROM orders;
--------------------------------------------------

-- UPDATE

-- Customer changed city
UPDATE customers
SET city='Bengaluru'
WHERE customer_id=5;

-- Update order status

UPDATE orders
SET order_status='Delivered'
WHERE order_id=2;

-- Increase discount

UPDATE orders
SET discount=1000
WHERE order_id=7;
--------------------------------------------------

-- DELETE

-- Delete cancelled order

DELETE FROM orders
WHERE order_status='Cancelled';

-- Delete customer

DELETE FROM customers
WHERE customer_id=9;
--------------------------------------------------
-- NULL Handling

-- Customers without email

SELECT *
FROM customers
WHERE email IS NULL;

-- Customers having email

SELECT *
FROM customers
WHERE email IS NOT NULL;

-- Replace NULL email

SELECT
customer_name,
COALESCE(email,'Email Not Available') AS email
FROM customers;

-- Replace NULL Discount

SELECT
product_name,
COALESCE(discount,0) AS discount
FROM orders;
--------------------------------------------------

-- CASE WHEN

-- Order Price Category

SELECT
product_name,
price,

CASE

WHEN price>=50000 THEN 'Premium'

WHEN price>=10000 THEN 'High'

WHEN price>=3000 THEN 'Medium'

ELSE 'Budget'

END AS category

FROM orders;

-- Discount Status

SELECT
product_name,

CASE

WHEN discount IS NULL THEN 'No Discount'

ELSE 'Discount Available'

END AS discount_status

FROM orders;

-- Order Delivery Status

SELECT

product_name,

CASE

WHEN order_status='Delivered' THEN 'Completed'

WHEN order_status='Pending' THEN 'In Progress'

ELSE 'Closed'

END AS status

FROM orders;
--------------------------------------------------

-- Revision Queries

-- Pending Orders

SELECT *
FROM orders
WHERE order_status='Pending';

-- Highest Price Product

SELECT *
FROM orders
ORDER BY price DESC
LIMIT 1;

-- Top 5 Costliest Orders

SELECT *
FROM orders
ORDER BY price DESC
LIMIT 5;

-- Delivered Orders

SELECT *
FROM orders
WHERE order_status='Delivered';

-- Products paid using UPI

SELECT *
FROM orders
WHERE payment_method='UPI';

-- Products above ₹5000

SELECT *
FROM orders
WHERE price>5000;