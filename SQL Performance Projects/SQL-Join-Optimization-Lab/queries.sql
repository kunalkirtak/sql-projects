-------------------------------------------------
-- Join without filtering
-------------------------------------------------

SELECT

o.order_id,

c.city,

c.membership,

o.amount

FROM orders o

JOIN customers c

ON o.customer_id=c.customer_id;

-------------------------------------------------
-- Filter after Join
-------------------------------------------------

SELECT

o.order_id,

o.amount,

c.city

FROM orders o

JOIN customers c

ON o.customer_id=c.customer_id

WHERE c.city='Mumbai';

-------------------------------------------------
-- Composite Index Usage
-------------------------------------------------

SELECT *

FROM customers

WHERE city='Pune'

AND membership='Gold';

-------------------------------------------------
-- Optimized Join
-------------------------------------------------

SELECT

c.city,

COUNT(*) AS total_orders

FROM customers c

JOIN orders o

ON c.customer_id=o.customer_id

GROUP BY c.city;

-------------------------------------------------
-- High Value Orders
-------------------------------------------------

SELECT

*

FROM orders

WHERE status='Delivered'

AND amount>9000;

-------------------------------------------------
-- Top Orders

SELECT *

FROM orders

ORDER BY amount DESC

LIMIT 20;