-- ===========================================================
-- Data Cleaning
-- ===========================================================


------------------------------------------------------------
-- 1. View Raw Dataset
------------------------------------------------------------

SELECT *
FROM customer_data
ORDER BY customer_id;


------------------------------------------------------------
-- 2. Count Total Records
------------------------------------------------------------

SELECT COUNT(*) AS total_records
FROM customer_data;


------------------------------------------------------------
-- 3. Check Missing Annual Income
------------------------------------------------------------

SELECT *
FROM customer_data
WHERE annual_income IS NULL;


------------------------------------------------------------
-- 4. Count Missing Annual Income
------------------------------------------------------------

SELECT COUNT(*) AS missing_income
FROM customer_data
WHERE annual_income IS NULL;


------------------------------------------------------------
-- 5. Check Missing Spending Score
------------------------------------------------------------

SELECT *
FROM customer_data
WHERE spending_score IS NULL;


------------------------------------------------------------
-- 6. Check Missing Purchase Amount
------------------------------------------------------------

SELECT *
FROM customer_data
WHERE last_purchase_amount IS NULL;


------------------------------------------------------------
-- 7. Check Missing Preferred Device
------------------------------------------------------------

SELECT *
FROM customer_data
WHERE preferred_device IS NULL;


------------------------------------------------------------
-- 8. Check Missing Email
------------------------------------------------------------

SELECT *
FROM customer_data
WHERE email IS NULL;


------------------------------------------------------------
-- 9. Check Missing Phone Number
------------------------------------------------------------

SELECT *
FROM customer_data
WHERE phone IS NULL;


------------------------------------------------------------
-- 10. Summary of Missing Values
------------------------------------------------------------

SELECT

COUNT(*) FILTER (WHERE annual_income IS NULL)
AS missing_income,

COUNT(*) FILTER (WHERE spending_score IS NULL)
AS missing_spending_score,

COUNT(*) FILTER (WHERE last_purchase_amount IS NULL)
AS missing_purchase_amount,

COUNT(*) FILTER (WHERE preferred_device IS NULL)
AS missing_device,

COUNT(*) FILTER (WHERE email IS NULL)
AS missing_email,

COUNT(*) FILTER (WHERE phone IS NULL)
AS missing_phone

FROM customer_data;


------------------------------------------------------------
-- 11. Detect Duplicate Customers
------------------------------------------------------------

SELECT

customer_name,
email,
phone,
COUNT(*) AS duplicate_count

FROM customer_data

GROUP BY customer_name,email,phone

HAVING COUNT(*) > 1;


------------------------------------------------------------
-- 12. Display Duplicate Records
------------------------------------------------------------

SELECT *

FROM customer_data

WHERE (customer_name,email,phone)

IN

(
SELECT

customer_name,
email,
phone

FROM customer_data

GROUP BY customer_name,email,phone

HAVING COUNT(*) > 1
)

ORDER BY customer_name;


------------------------------------------------------------
-- 13. Backup Before Cleaning
------------------------------------------------------------

CREATE TABLE customer_data_backup AS

SELECT *

FROM customer_data;


------------------------------------------------------------
-- 14. Fill Missing Annual Income
------------------------------------------------------------

UPDATE customer_data

SET annual_income =
(
SELECT AVG(annual_income)

FROM customer_data

WHERE annual_income IS NOT NULL
)

WHERE annual_income IS NULL;


------------------------------------------------------------
-- 15. Fill Missing Spending Score
------------------------------------------------------------

UPDATE customer_data

SET spending_score =
(
SELECT ROUND(AVG(spending_score))

FROM customer_data

WHERE spending_score IS NOT NULL
)

WHERE spending_score IS NULL;


------------------------------------------------------------
-- 16. Fill Missing Purchase Amount
------------------------------------------------------------

UPDATE customer_data

SET last_purchase_amount =
(
SELECT AVG(last_purchase_amount)

FROM customer_data

WHERE last_purchase_amount IS NOT NULL
)

WHERE last_purchase_amount IS NULL;


------------------------------------------------------------
-- 17. Fill Missing Preferred Device
------------------------------------------------------------

UPDATE customer_data

SET preferred_device='Unknown'

WHERE preferred_device IS NULL;


------------------------------------------------------------
-- 18. Fill Missing Email
------------------------------------------------------------

UPDATE customer_data

SET email='not_available@email.com'

WHERE email IS NULL;


------------------------------------------------------------
-- 19. Fill Missing Phone Number
------------------------------------------------------------

UPDATE customer_data

SET phone='Not Available'

WHERE phone IS NULL;


------------------------------------------------------------
-- 20. Verify Missing Values Removed
------------------------------------------------------------

SELECT

COUNT(*) FILTER (WHERE annual_income IS NULL)
AS missing_income,

COUNT(*) FILTER (WHERE spending_score IS NULL)
AS missing_spending_score,

COUNT(*) FILTER (WHERE last_purchase_amount IS NULL)
AS missing_purchase_amount,

COUNT(*) FILTER (WHERE preferred_device IS NULL)
AS missing_device,

COUNT(*) FILTER (WHERE email IS NULL)
AS missing_email,

COUNT(*) FILTER (WHERE phone IS NULL)
AS missing_phone

FROM customer_data;


------------------------------------------------------------
-- 21. Delete Duplicate Records
------------------------------------------------------------

DELETE FROM customer_data

WHERE customer_id NOT IN

(
SELECT MIN(customer_id)

FROM customer_data

GROUP BY

customer_name,
age,
gender,
city,
annual_income,
spending_score,
membership_type,
last_purchase_amount,
total_orders,
days_since_last_purchase,
preferred_device,
email,
phone,
will_purchase
);


------------------------------------------------------------
-- 22. Verify Duplicate Removal
------------------------------------------------------------

SELECT

customer_name,
email,
phone,
COUNT(*) AS total

FROM customer_data

GROUP BY customer_name,email,phone

HAVING COUNT(*)>1;


------------------------------------------------------------
-- 23. Total Records After Cleaning
------------------------------------------------------------

SELECT COUNT(*) AS cleaned_records

FROM customer_data;


------------------------------------------------------------
-- 24. View Clean Dataset
------------------------------------------------------------

SELECT *

FROM customer_data

ORDER BY customer_id;

------------------------------------------------------------
-- 25. Feature Engineering - Age Group
------------------------------------------------------------

SELECT
customer_id,
customer_name,
age,

CASE
WHEN age < 25 THEN 'Young'
WHEN age BETWEEN 25 AND 35 THEN 'Adult'
ELSE 'Senior'
END AS age_group

FROM customer_data;


------------------------------------------------------------
-- 26. Feature Engineering - Income Category
------------------------------------------------------------

SELECT
customer_name,
annual_income,

CASE
WHEN annual_income < 500000 THEN 'Low'
WHEN annual_income BETWEEN 500000 AND 800000 THEN 'Medium'
ELSE 'High'
END AS income_category

FROM customer_data;


------------------------------------------------------------
-- 27. Feature Engineering - Spending Category
------------------------------------------------------------

SELECT
customer_name,
spending_score,

CASE
WHEN spending_score >= 80 THEN 'High Spender'
WHEN spending_score >= 50 THEN 'Medium Spender'
ELSE 'Low Spender'
END AS spending_category

FROM customer_data;


------------------------------------------------------------
-- 28. Purchase Frequency Feature
------------------------------------------------------------

SELECT
customer_name,
total_orders,

CASE
WHEN total_orders >= 20 THEN 'Frequent'
WHEN total_orders >= 10 THEN 'Regular'
ELSE 'Occasional'
END AS purchase_frequency

FROM customer_data;


------------------------------------------------------------
-- 29. Customer Activity Feature
------------------------------------------------------------

SELECT
customer_name,
days_since_last_purchase,

CASE
WHEN days_since_last_purchase <= 7 THEN 'Active'
WHEN days_since_last_purchase <= 30 THEN 'Warm'
ELSE 'Inactive'
END AS customer_activity

FROM customer_data;


------------------------------------------------------------
-- 30. Average Purchase Value Feature
------------------------------------------------------------

SELECT
customer_name,
last_purchase_amount,
total_orders,

ROUND(last_purchase_amount / total_orders,2)
AS average_order_value

FROM customer_data;


------------------------------------------------------------
-- 31. High Value Customer Feature
------------------------------------------------------------

SELECT
customer_name,
annual_income,
last_purchase_amount,

CASE

WHEN annual_income >= 800000
AND last_purchase_amount >= 15000

THEN 'Yes'

ELSE 'No'

END AS high_value_customer

FROM customer_data;


------------------------------------------------------------
-- 32. Label Distribution
------------------------------------------------------------

SELECT

will_purchase,

COUNT(*) AS customers

FROM customer_data

GROUP BY will_purchase;


------------------------------------------------------------
-- 33. Purchase Percentage
------------------------------------------------------------

SELECT

ROUND(

100.0 * SUM(will_purchase) / COUNT(*)

,2)

AS purchase_rate

FROM customer_data;


------------------------------------------------------------
-- 34. Create ML Training Dataset
------------------------------------------------------------

DROP TABLE IF EXISTS ml_training_dataset;

CREATE TABLE ml_training_dataset AS

SELECT

customer_id,

age,

annual_income,

spending_score,

total_orders,

days_since_last_purchase,

last_purchase_amount,

membership_type,

preferred_device,

will_purchase

FROM customer_data;


------------------------------------------------------------
-- 35. View Training Dataset
------------------------------------------------------------

SELECT *

FROM ml_training_dataset;


------------------------------------------------------------
-- 36. Training Dataset Size
------------------------------------------------------------

SELECT COUNT(*)

AS total_training_records

FROM ml_training_dataset;


------------------------------------------------------------
-- 37. Simulated Train Dataset (80%)
------------------------------------------------------------

SELECT *

FROM ml_training_dataset

ORDER BY customer_id

LIMIT ROUND(
(
SELECT COUNT(*)*0.80
FROM ml_training_dataset
)
);


------------------------------------------------------------
-- 38. Simulated Test Dataset (Remaining 20%)
------------------------------------------------------------

SELECT *

FROM ml_training_dataset

ORDER BY customer_id

OFFSET ROUND(
(
SELECT COUNT(*)*0.80
FROM ml_training_dataset
)
);


------------------------------------------------------------
-- 39. Dataset Summary
------------------------------------------------------------

SELECT

MIN(age) AS minimum_age,

MAX(age) AS maximum_age,

ROUND(AVG(age),2) AS average_age,

ROUND(AVG(annual_income),2)
AS average_income,

ROUND(AVG(spending_score),2)
AS average_spending_score,

ROUND(AVG(last_purchase_amount),2)
AS average_purchase_amount

FROM ml_training_dataset;


------------------------------------------------------------
-- 40. Final Model Dataset
------------------------------------------------------------

SELECT *

FROM ml_training_dataset

ORDER BY customer_id;