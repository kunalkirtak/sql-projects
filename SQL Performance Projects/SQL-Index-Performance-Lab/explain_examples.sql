---------------------------------------------------------
-- Before Creating Index
---------------------------------------------------------

EXPLAIN

SELECT *
FROM products
WHERE category='Electronics';

---------------------------------------------------------
-- After Creating Index
---------------------------------------------------------

EXPLAIN

SELECT *
FROM products
WHERE category='Books';

---------------------------------------------------------
-- Price Index
---------------------------------------------------------

EXPLAIN

SELECT *
FROM products
WHERE price>7000;

---------------------------------------------------------
-- Hash Index Example
---------------------------------------------------------

EXPLAIN

SELECT *
FROM products
WHERE category='Furniture';

---------------------------------------------------------
-- Exact Match
---------------------------------------------------------

EXPLAIN

SELECT *
FROM products
WHERE product_name='Product-90000';