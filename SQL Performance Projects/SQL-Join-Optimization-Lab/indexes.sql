-------------------------------------------------
-- Single Index
-------------------------------------------------

CREATE INDEX idx_orders_customer
ON orders(customer_id);

-------------------------------------------------
-- Composite Index
-------------------------------------------------

CREATE INDEX idx_customer_city_membership
ON customers(city,membership);

-------------------------------------------------
-- Composite Index on Orders
-------------------------------------------------

CREATE INDEX idx_orders_status_amount
ON orders(status,amount);