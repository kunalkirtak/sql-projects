-------------------------------------------------
-- Generate 50,000 Customers
-------------------------------------------------

INSERT INTO customers

SELECT

id,

CASE

WHEN id % 4 = 0 THEN 'Mumbai'

WHEN id % 4 = 1 THEN 'Pune'

WHEN id % 4 = 2 THEN 'Nagpur'

ELSE 'Delhi'

END,

CASE

WHEN id % 3 = 0 THEN 'Gold'

WHEN id % 3 = 1 THEN 'Silver'

ELSE 'Bronze'

END

FROM generate_series(1,50000) AS id;

-------------------------------------------------
-- Generate 100,000 Orders
-------------------------------------------------

INSERT INTO orders

SELECT

id,

(id % 50000)+1,

CURRENT_DATE-(id % 365),

(random()*10000)::numeric(10,2),

CASE

WHEN id % 3 = 0 THEN 'Delivered'

WHEN id % 3 = 1 THEN 'Pending'

ELSE 'Cancelled'

END

FROM generate_series(1,100000) AS id;