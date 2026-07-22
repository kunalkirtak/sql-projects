INSERT INTO products
(product_name, category, price, stock_quantity)

SELECT

'Product-' || gs,

CASE

WHEN gs % 5 = 0 THEN 'Electronics'

WHEN gs % 5 = 1 THEN 'Books'

WHEN gs % 5 = 2 THEN 'Clothing'

WHEN gs % 5 = 3 THEN 'Furniture'

ELSE 'Sports'

END,

ROUND((random()*9000+500)::numeric,2),

(random()*100)::INT

FROM generate_series(1,100000) AS gs;