----------------------------------------------------
-- Customers
----------------------------------------------------

INSERT INTO dim_customer (customer_name, city)
VALUES
('Aarav Sharma','Mumbai'),
('Priya Patel','Pune'),
('Rahul Singh','Nagpur'),
('Sneha Joshi','Delhi'),
('Rohan Verma','Hyderabad');

----------------------------------------------------
-- Products
----------------------------------------------------

INSERT INTO dim_product (product_name, category)
VALUES
('Laptop','Electronics'),
('Keyboard','Accessories'),
('Mouse','Accessories'),
('Monitor','Electronics'),
('SSD','Storage');

----------------------------------------------------
-- Stores
----------------------------------------------------

INSERT INTO dim_store (store_name, city)
VALUES
('Mumbai Store','Mumbai'),
('Pune Store','Pune'),
('Nagpur Store','Nagpur');

----------------------------------------------------
-- Dates
----------------------------------------------------

INSERT INTO dim_date
(sales_date,month,year)
VALUES
('2026-01-10','January',2026),
('2026-01-11','January',2026),
('2026-02-01','February',2026),
('2026-02-05','February',2026),
('2026-03-01','March',2026);

----------------------------------------------------
-- Fact Sales
----------------------------------------------------

INSERT INTO fact_sales
(customer_key,product_key,store_key,date_key,quantity,sales_amount)
VALUES
(1,1,1,1,1,75000),
(2,2,2,2,2,4000),
(3,3,3,3,3,2400),
(4,4,1,4,1,12000),
(5,5,2,5,2,9000),
(2,1,2,2,1,76000),
(1,5,1,5,3,13500),
(3,2,3,1,1,2000),
(4,1,1,4,2,150000),
(5,3,2,3,5,4000);