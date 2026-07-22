---------------------------------------------------------
-- View Existing Indexes
---------------------------------------------------------

SELECT *
FROM pg_indexes
WHERE tablename='products';

---------------------------------------------------------
-- Create B-Tree Index
---------------------------------------------------------

CREATE INDEX idx_products_category
ON products(category);

---------------------------------------------------------
-- Create B-Tree Index on Price
---------------------------------------------------------

CREATE INDEX idx_products_price
ON products(price);

---------------------------------------------------------
-- Create Hash Index
---------------------------------------------------------

CREATE INDEX idx_products_hash_category
ON products
USING HASH(category);

---------------------------------------------------------
-- View Indexes Again
---------------------------------------------------------

SELECT *
FROM pg_indexes
WHERE tablename='products';

---------------------------------------------------------
-- Cluster Table
---------------------------------------------------------

CLUSTER products USING idx_products_price;

---------------------------------------------------------
-- Remove Hash Index
---------------------------------------------------------

DROP INDEX idx_products_hash_category;