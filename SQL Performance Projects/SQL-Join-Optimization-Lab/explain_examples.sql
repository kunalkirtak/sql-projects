-------------------------------------------------
-- Execution Plan
-------------------------------------------------

EXPLAIN

SELECT *

FROM orders

WHERE customer_id=25000;

-------------------------------------------------
-- Execution Time
-------------------------------------------------

EXPLAIN ANALYZE

SELECT *

FROM orders

WHERE customer_id=25000;

-------------------------------------------------
-- Join Execution Plan
-------------------------------------------------

EXPLAIN

SELECT

*

FROM customers c

JOIN orders o

ON c.customer_id=o.customer_id

WHERE c.city='Mumbai';

-------------------------------------------------
-- Join Analyze
-------------------------------------------------

EXPLAIN ANALYZE

SELECT

*

FROM customers c

JOIN orders o

ON c.customer_id=o.customer_id

WHERE c.city='Mumbai';

-------------------------------------------------
-- Composite Index Check
-------------------------------------------------

EXPLAIN ANALYZE

SELECT *

FROM customers

WHERE city='Delhi'

AND membership='Gold';

-------------------------------------------------
-- Large Aggregation
-------------------------------------------------

EXPLAIN ANALYZE

SELECT

status,

COUNT(*)

FROM orders

GROUP BY status;