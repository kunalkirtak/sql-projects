---------------------------------------------------------
-- Growth Analytics & Recommendation SQL
-- queries.sql
---------------------------------------------------------

---------------------------------------------------------
-- SECTION 1 : BASIC DATA VALIDATION
---------------------------------------------------------

-- Total Users

SELECT COUNT(*) AS total_users
FROM users;

---------------------------------------------------------

-- Total Sessions

SELECT COUNT(*) AS total_sessions
FROM sessions;

---------------------------------------------------------

-- Total Events

SELECT COUNT(*) AS total_events
FROM events;

---------------------------------------------------------

-- Total Orders

SELECT COUNT(*) AS total_orders
FROM orders;

---------------------------------------------------------

-- Total Revenue

SELECT SUM(total_amount) AS total_revenue
FROM orders;

---------------------------------------------------------
-- SECTION 2 : FUNNEL ANALYSIS
---------------------------------------------------------

-- Step 1 : Users who searched

SELECT
COUNT(DISTINCT s.user_id) AS searched_users
FROM events e
JOIN sessions s
ON e.session_id=s.session_id
WHERE event_type='search';

---------------------------------------------------------

-- Step 2 : Viewed Product

SELECT
COUNT(DISTINCT s.user_id) AS viewed_product
FROM events e
JOIN sessions s
ON e.session_id=s.session_id
WHERE event_type='view_product';

---------------------------------------------------------

-- Step 3 : Added To Cart

SELECT
COUNT(DISTINCT s.user_id) AS cart_users
FROM events e
JOIN sessions s
ON e.session_id=s.session_id
WHERE event_type='add_to_cart';

---------------------------------------------------------

-- Step 4 : Checkout

SELECT
COUNT(DISTINCT s.user_id) AS checkout_users
FROM events e
JOIN sessions s
ON e.session_id=s.session_id
WHERE event_type='checkout';

---------------------------------------------------------

-- Step 5 : Purchased

SELECT
COUNT(DISTINCT s.user_id) AS purchased_users
FROM events e
JOIN sessions s
ON e.session_id=s.session_id
WHERE event_type='purchase';

---------------------------------------------------------

-- Funnel Summary

SELECT
event_type,
COUNT(*) AS total_events
FROM events
GROUP BY event_type
ORDER BY total_events DESC;

---------------------------------------------------------

-- Product Views

SELECT
product_name,
COUNT(*) AS total_views
FROM events
WHERE event_type='view_product'
GROUP BY product_name
ORDER BY total_views DESC;

---------------------------------------------------------

-- Products Added To Cart

SELECT
product_name,
COUNT(*) AS cart_count
FROM events
WHERE event_type='add_to_cart'
GROUP BY product_name
ORDER BY cart_count DESC;

---------------------------------------------------------

-- Purchased Products

SELECT
product_name,
COUNT(*) AS purchase_count
FROM events
WHERE event_type='purchase'
GROUP BY product_name
ORDER BY purchase_count DESC;

---------------------------------------------------------

-- Purchase Conversion %

SELECT

ROUND(

100.0 *

(
SELECT COUNT(*)
FROM events
WHERE event_type='purchase'
)

/

(
SELECT COUNT(*)
FROM events
WHERE event_type='view_product'
),

2

)

AS purchase_conversion_percentage;

---------------------------------------------------------

-- Checkout Conversion %

SELECT

ROUND(

100.0 *

(
SELECT COUNT(*)
FROM events
WHERE event_type='checkout'
)

/

(
SELECT COUNT(*)
FROM events
WHERE event_type='add_to_cart'
),

2

)

AS checkout_conversion_percentage;

---------------------------------------------------------

-- Most Viewed Product

SELECT
product_name,
COUNT(*) AS views
FROM events
WHERE event_type='view_product'
GROUP BY product_name
ORDER BY views DESC
LIMIT 1;

---------------------------------------------------------

-- Most Purchased Product

SELECT
product_name,
COUNT(*) AS purchases
FROM events
WHERE event_type='purchase'
GROUP BY product_name
ORDER BY purchases DESC
LIMIT 1;

---------------------------------------------------------
-- SECTION 3 : A/B TESTING
---------------------------------------------------------

-- Number of Users in each Variant

SELECT
variant,
COUNT(*) AS users
FROM experiments
GROUP BY variant;

---------------------------------------------------------

-- Conversion by Variant

SELECT
variant,
COUNT(*) FILTER
(
WHERE converted=TRUE
)
AS converted_users
FROM experiments
GROUP BY variant;

---------------------------------------------------------

-- Conversion Rate

SELECT

variant,

ROUND

(

100.0 *

COUNT(*) FILTER

(
WHERE converted=TRUE
)

/

COUNT(*),

2

)

AS conversion_rate

FROM experiments

GROUP BY variant;

---------------------------------------------------------

-- Winning Variant

SELECT

variant,

ROUND

(

100.0 *

COUNT(*) FILTER

(
WHERE converted=TRUE
)

/

COUNT(*),

2

)

AS conversion_rate

FROM experiments

GROUP BY variant

ORDER BY conversion_rate DESC;

---------------------------------------------------------

-- Converted Users List

SELECT

u.full_name,

e.variant,

e.converted

FROM users u

JOIN experiments e

ON u.user_id=e.user_id

WHERE converted=TRUE;

---------------------------------------------------------

-- Non Converted Users

SELECT

u.full_name,

e.variant

FROM users u

JOIN experiments e

ON u.user_id=e.user_id

WHERE converted=FALSE;

---------------------------------------------------------

-- Revenue by Variant

SELECT

e.variant,

SUM(o.total_amount) AS revenue

FROM experiments e

JOIN orders o

ON e.user_id=o.user_id

GROUP BY e.variant;

---------------------------------------------------------

-- Average Revenue by Variant

SELECT

e.variant,

ROUND(AVG(o.total_amount),2) AS avg_revenue

FROM experiments e

JOIN orders o

ON e.user_id=o.user_id

GROUP BY e.variant

ORDER BY avg_revenue DESC;

---------------------------------------------------------

-- Top Converted Customers

SELECT

u.full_name,

SUM(o.total_amount) AS revenue

FROM users u

JOIN orders o

ON u.user_id=o.user_id

JOIN experiments e

ON u.user_id=e.user_id

WHERE converted=TRUE

GROUP BY u.full_name

ORDER BY revenue DESC;

---------------------------------------------------------
-- SECTION 4 : SESSIONIZATION
---------------------------------------------------------

-- Session Duration (Minutes)

SELECT
    session_id,
    user_id,
    ROUND(EXTRACT(EPOCH FROM (session_end - session_start)) / 60.0, 2)
        AS session_duration_minutes
FROM sessions
ORDER BY session_duration_minutes DESC;

---------------------------------------------------------

-- Average Session Duration

SELECT
ROUND(
AVG(EXTRACT(EPOCH FROM(session_end-session_start))/60.0),
2
)
AS average_session_duration_minutes
FROM sessions;

---------------------------------------------------------

-- Longest Session

SELECT
session_id,
user_id,
ROUND(EXTRACT(EPOCH FROM(session_end-session_start))/60.0,2)
AS duration_minutes
FROM sessions
ORDER BY duration_minutes DESC
LIMIT 1;

---------------------------------------------------------

-- Number of Sessions Per User

SELECT
user_id,
COUNT(*) AS total_sessions
FROM sessions
GROUP BY user_id
ORDER BY total_sessions DESC;

---------------------------------------------------------

-- Device Usage

SELECT
device,
COUNT(*) AS total_sessions
FROM sessions
GROUP BY device
ORDER BY total_sessions DESC;

---------------------------------------------------------

-- Most Active Users

SELECT
user_id,
COUNT(*) AS sessions
FROM sessions
GROUP BY user_id
ORDER BY sessions DESC
LIMIT 10;

---------------------------------------------------------

-- Events Per Session

SELECT
session_id,
COUNT(*) AS total_events
FROM events
GROUP BY session_id
ORDER BY total_events DESC;

---------------------------------------------------------

-- Average Events Per Session

SELECT
ROUND(AVG(event_count),2)
AS average_events
FROM
(
SELECT
session_id,
COUNT(*) AS event_count
FROM events
GROUP BY session_id
) t;

---------------------------------------------------------

-- Users With Multiple Sessions

SELECT
user_id,
COUNT(*) AS sessions
FROM sessions
GROUP BY user_id
HAVING COUNT(*)>1;

---------------------------------------------------------

---------------------------------------------------------
-- SECTION 5 : USER BEHAVIOR
---------------------------------------------------------

-- Search Events

SELECT
COUNT(*) AS searches
FROM events
WHERE event_type='search';

---------------------------------------------------------

-- Product Views

SELECT
COUNT(*) AS product_views
FROM events
WHERE event_type='view_product';

---------------------------------------------------------

-- Cart Events

SELECT
COUNT(*) AS cart_events
FROM events
WHERE event_type='add_to_cart';

---------------------------------------------------------

-- Checkout Events

SELECT
COUNT(*) AS checkout_events
FROM events
WHERE event_type='checkout';

---------------------------------------------------------

-- Purchase Events

SELECT
COUNT(*) AS purchase_events
FROM events
WHERE event_type='purchase';

---------------------------------------------------------

-- Top 5 Most Viewed Products

SELECT
product_name,
COUNT(*) AS total_views
FROM events
WHERE event_type='view_product'
GROUP BY product_name
ORDER BY total_views DESC
LIMIT 5;

---------------------------------------------------------

-- Top Purchased Products

SELECT
product_name,
COUNT(*) AS purchases
FROM events
WHERE event_type='purchase'
GROUP BY product_name
ORDER BY purchases DESC;

---------------------------------------------------------

---------------------------------------------------------
-- SECTION 6 : RECOMMENDATION DATASET
---------------------------------------------------------

-- Products Viewed By Users

SELECT
s.user_id,
e.product_name
FROM sessions s
JOIN events e
ON s.session_id=e.session_id
WHERE event_type='view_product'
ORDER BY s.user_id;

---------------------------------------------------------

-- Purchased Products By Users

SELECT
o.user_id,
e.product_name
FROM orders o
JOIN sessions s
ON o.user_id=s.user_id
JOIN events e
ON s.session_id=e.session_id
WHERE event_type='purchase'
ORDER BY o.user_id;

---------------------------------------------------------

-- User-Product Interaction Dataset

SELECT
s.user_id,
e.product_name,
e.event_type,
e.event_time
FROM sessions s
JOIN events e
ON s.session_id=e.session_id
ORDER BY s.user_id,e.event_time;

---------------------------------------------------------

-- Product Popularity

SELECT
product_name,
COUNT(*) AS interactions
FROM events
GROUP BY product_name
ORDER BY interactions DESC;

---------------------------------------------------------

-- Products Purchased More Than Once

SELECT
product_name,
COUNT(*) AS purchases
FROM events
WHERE event_type='purchase'
GROUP BY product_name
HAVING COUNT(*)>1;

---------------------------------------------------------

-- User Purchase Count

SELECT
user_id,
COUNT(*) AS purchases
FROM orders
GROUP BY user_id
ORDER BY purchases DESC;

---------------------------------------------------------

-- Average Order Value Per User

SELECT
user_id,
ROUND(AVG(total_amount),2)
AS average_order_value
FROM orders
GROUP BY user_id
ORDER BY average_order_value DESC;

---------------------------------------------------------

-- Recommendation Feature Dataset

SELECT

u.user_id,

u.city,

u.gender,

COUNT(DISTINCT s.session_id) AS sessions,

COUNT(e.event_id) AS events,

COUNT(o.order_id) AS orders,

COALESCE(SUM(o.total_amount),0) AS total_spent

FROM users u

LEFT JOIN sessions s
ON u.user_id=s.user_id

LEFT JOIN events e
ON s.session_id=e.session_id

LEFT JOIN orders o
ON u.user_id=o.user_id

GROUP BY
u.user_id,
u.city,
u.gender

ORDER BY total_spent DESC;

---------------------------------------------------------
-- SECTION 7 : CUSTOMER LIFETIME VALUE (CLV)
---------------------------------------------------------

-- Total Revenue Generated by Each Customer

SELECT
    u.user_id,
    u.full_name,
    SUM(o.total_amount) AS lifetime_value
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name
ORDER BY lifetime_value DESC;

---------------------------------------------------------

-- Top 10 Customers by Lifetime Value

SELECT
    u.user_id,
    u.full_name,
    SUM(o.total_amount) AS lifetime_value
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name
ORDER BY lifetime_value DESC
LIMIT 10;

---------------------------------------------------------

-- Average Customer Lifetime Value

SELECT
ROUND(AVG(customer_total),2)
AS average_clv
FROM
(
    SELECT
        user_id,
        SUM(total_amount) AS customer_total
    FROM orders
    GROUP BY user_id
) customer_spending;

---------------------------------------------------------

-- Total Orders Per Customer

SELECT
    user_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC;

---------------------------------------------------------

-- Average Order Value Per Customer

SELECT
    user_id,
    ROUND(AVG(total_amount),2) AS average_order_value
FROM orders
GROUP BY user_id
ORDER BY average_order_value DESC;

---------------------------------------------------------

-- Highest Single Order

SELECT *
FROM orders
ORDER BY total_amount DESC
LIMIT 1;

---------------------------------------------------------

-- Revenue by City

SELECT
    u.city,
    ROUND(SUM(o.total_amount),2) AS revenue
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.city
ORDER BY revenue DESC;

---------------------------------------------------------

-- Revenue by Gender

SELECT
    u.gender,
    ROUND(SUM(o.total_amount),2) AS revenue
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.gender;

---------------------------------------------------------

-- Customers with Multiple Purchases

SELECT
    user_id,
    COUNT(order_id) AS purchases
FROM orders
GROUP BY user_id
HAVING COUNT(order_id) > 1
ORDER BY purchases DESC;

---------------------------------------------------------

-- Customers Spending Above Average

SELECT
    user_id,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY user_id
HAVING SUM(total_amount) >
(
    SELECT AVG(customer_total)
    FROM
    (
        SELECT
            user_id,
            SUM(total_amount) AS customer_total
        FROM orders
        GROUP BY user_id
    ) t
)
ORDER BY total_spent DESC;

---------------------------------------------------------
-- SECTION 8 : BUSINESS KPI QUERIES
---------------------------------------------------------

-- Total Revenue

SELECT
SUM(total_amount)
AS total_revenue
FROM orders;

---------------------------------------------------------

-- Total Customers

SELECT
COUNT(*)
AS total_customers
FROM users;

---------------------------------------------------------

-- Paying Customers

SELECT
COUNT(DISTINCT user_id)
AS paying_customers
FROM orders;

---------------------------------------------------------

-- Average Revenue Per Customer

SELECT

ROUND(

SUM(total_amount)
/ COUNT(DISTINCT user_id),

2

)

AS arpu

FROM orders;

---------------------------------------------------------

-- Average Orders Per Customer

SELECT

ROUND(

COUNT(order_id)::numeric

/

COUNT(DISTINCT user_id),

2

)

AS average_orders

FROM orders;

---------------------------------------------------------

-- Purchase Frequency

SELECT

ROUND(

COUNT(*)::numeric

/

COUNT(DISTINCT user_id),

2

)

AS purchase_frequency

FROM orders;

---------------------------------------------------------

-- Revenue Distribution

SELECT

CASE

WHEN total_amount >= 50000 THEN 'Premium'

WHEN total_amount >= 20000 THEN 'High'

WHEN total_amount >= 5000 THEN 'Medium'

ELSE 'Low'

END
AS order_category,

COUNT(*) AS orders,

SUM(total_amount) AS revenue

FROM orders

GROUP BY order_category

ORDER BY revenue DESC;

---------------------------------------------------------

-- User Signup by Month

SELECT

DATE_TRUNC('month', signup_date) AS signup_month,

COUNT(*) AS users

FROM users

GROUP BY signup_month

ORDER BY signup_month;

---------------------------------------------------------

-- Daily Orders

SELECT

order_date,

COUNT(*) AS total_orders,

SUM(total_amount) AS revenue

FROM orders

GROUP BY order_date

ORDER BY order_date;

---------------------------------------------------------

-- Revenue Trend

SELECT

order_date,

SUM(total_amount) AS daily_revenue

FROM orders

GROUP BY order_date

ORDER BY order_date;

---------------------------------------------------------
-- SECTION 9 : FEATURE ENGINEERING
---------------------------------------------------------

-- ML Training Dataset

SELECT

u.user_id,

u.city,

u.gender,

COUNT(DISTINCT s.session_id) AS total_sessions,

COUNT(DISTINCT o.order_id) AS total_orders,

COALESCE(SUM(o.total_amount),0) AS total_spent,

ROUND(

COALESCE(AVG(o.total_amount),0),

2

) AS avg_order_value,

CASE

WHEN COALESCE(SUM(o.total_amount),0) >= 100000 THEN 'High Value'

WHEN COALESCE(SUM(o.total_amount),0) >= 30000 THEN 'Medium Value'

ELSE 'Low Value'

END AS customer_segment

FROM users u

LEFT JOIN sessions s
ON u.user_id=s.user_id

LEFT JOIN orders o
ON u.user_id=o.user_id

GROUP BY
u.user_id,
u.city,
u.gender

ORDER BY total_spent DESC;

---------------------------------------------------------

-- Purchase Label for Classification

SELECT

user_id,

CASE

WHEN COUNT(order_id)>=2 THEN 1

ELSE 0

END AS repeat_customer

FROM orders

GROUP BY user_id;

---------------------------------------------------------

-- Customer Engagement Score

SELECT

u.user_id,

COUNT(DISTINCT s.session_id) * 5 +

COUNT(e.event_id) * 2 +

COUNT(o.order_id) * 10

AS engagement_score

FROM users u

LEFT JOIN sessions s
ON u.user_id=s.user_id

LEFT JOIN events e
ON s.session_id=e.session_id

LEFT JOIN orders o
ON u.user_id=o.user_id

GROUP BY u.user_id

ORDER BY engagement_score DESC;

---------------------------------------------------------

-- Final Dataset for ML Models

SELECT

u.user_id,

u.city,

u.gender,

COUNT(DISTINCT s.session_id) AS sessions,

COUNT(e.event_id) AS events,

COUNT(DISTINCT o.order_id) AS orders,

COALESCE(SUM(o.total_amount),0) AS total_spent,

CASE

WHEN COUNT(DISTINCT o.order_id)>=2 THEN 'Repeat'

ELSE 'New'

END AS customer_type

FROM users u

LEFT JOIN sessions s
ON u.user_id=s.user_id

LEFT JOIN events e
ON s.session_id=e.session_id

LEFT JOIN orders o
ON u.user_id=o.user_id

GROUP BY
u.user_id,
u.city,
u.gender

ORDER BY total_spent DESC;

---------------------------------------------------------
-- END OF PROJECT
---------------------------------------------------------
