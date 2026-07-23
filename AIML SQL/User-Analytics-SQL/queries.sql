
-------------------------------------------------
-- 1. View All Users
-------------------------------------------------

SELECT *
FROM users;

-------------------------------------------------
-- 2. View All User Events
-------------------------------------------------

SELECT *
FROM user_events
ORDER BY event_time;

-------------------------------------------------
-- 3. Daily Active Users (DAU)
-------------------------------------------------
-- Number of unique users active each day

SELECT
DATE(event_time) AS activity_date,
COUNT(DISTINCT user_id) AS daily_active_users

FROM user_events

GROUP BY DATE(event_time)

ORDER BY activity_date;

-------------------------------------------------
-- 4. Monthly Active Users (MAU)
-------------------------------------------------

SELECT

DATE_TRUNC('month',event_time)::DATE AS month,

COUNT(DISTINCT user_id) AS monthly_active_users

FROM user_events

GROUP BY month

ORDER BY month;

-------------------------------------------------
-- 5. Daily Event Count
-------------------------------------------------

SELECT

DATE(event_time) AS activity_date,

COUNT(*) AS total_events

FROM user_events

GROUP BY DATE(event_time)

ORDER BY activity_date;

-------------------------------------------------
-- 6. Events by Device
-------------------------------------------------

SELECT

device,

COUNT(*) AS total_events

FROM user_events

GROUP BY device

ORDER BY total_events DESC;

-------------------------------------------------
-- 7. Events by Event Type
-------------------------------------------------

SELECT

event_type,

COUNT(*) AS total_events

FROM user_events

GROUP BY event_type

ORDER BY total_events DESC;

-------------------------------------------------
-- 8. Purchases Per Day
-------------------------------------------------

SELECT

DATE(event_time) AS purchase_date,

COUNT(*) AS purchases

FROM user_events

WHERE event_type='purchase'

GROUP BY DATE(event_time)

ORDER BY purchase_date;

-------------------------------------------------
-- 9. User Activity Count
-------------------------------------------------

SELECT

user_id,

COUNT(*) AS total_events

FROM user_events

GROUP BY user_id

ORDER BY total_events DESC;

-------------------------------------------------
-- 10. Most Active Users
-------------------------------------------------

SELECT

u.full_name,

COUNT(*) AS total_events

FROM users u

JOIN user_events e

ON u.user_id=e.user_id

GROUP BY u.full_name

ORDER BY total_events DESC

LIMIT 5;

-------------------------------------------------
-- 11. Average Events Per User
-------------------------------------------------

SELECT

ROUND(AVG(event_count),2) AS average_events

FROM

(

SELECT

user_id,

COUNT(*) AS event_count

FROM user_events

GROUP BY user_id

) AS user_activity;

-------------------------------------------------
-- 12. First Activity Date
-------------------------------------------------

SELECT

user_id,

MIN(event_time) AS first_activity

FROM user_events

GROUP BY user_id

ORDER BY first_activity;

-------------------------------------------------
-- 13. Last Activity Date
-------------------------------------------------

SELECT

user_id,

MAX(event_time) AS last_activity

FROM user_events

GROUP BY user_id

ORDER BY last_activity DESC;

-------------------------------------------------
-- 14. Feature Engineering
-- Days Since Signup
-------------------------------------------------

SELECT

u.user_id,

u.full_name,

u.signup_date,

MAX(e.event_time)::DATE AS last_active,

(MAX(e.event_time)::DATE-u.signup_date)
AS days_since_signup

FROM users u

JOIN user_events e

ON u.user_id=e.user_id

GROUP BY

u.user_id,
u.full_name,
u.signup_date

ORDER BY days_since_signup DESC;

-------------------------------------------------
-- 15. Feature Engineering
-- Number of Purchases
-------------------------------------------------

SELECT

user_id,

COUNT(*) AS purchase_count

FROM user_events

WHERE event_type='purchase'

GROUP BY user_id

ORDER BY purchase_count DESC;

-------------------------------------------------
-- 16. Feature Engineering
-- Login Count
-------------------------------------------------

SELECT

user_id,

COUNT(*) AS login_count

FROM user_events

WHERE event_type='login'

GROUP BY user_id

ORDER BY login_count DESC;

-------------------------------------------------
-- 17. Rolling Average
-- 3-Day Event Average
-------------------------------------------------

SELECT

activity_date,

total_events,

ROUND(

AVG(total_events)

OVER(

ORDER BY activity_date

ROWS BETWEEN 2 PRECEDING
AND CURRENT ROW

),

2

)

AS rolling_average

FROM

(

SELECT

DATE(event_time) AS activity_date,

COUNT(*) AS total_events

FROM user_events

GROUP BY DATE(event_time)

) daily_events;

-------------------------------------------------
-- 18. Running Total Events
-------------------------------------------------

SELECT

activity_date,

total_events,

SUM(total_events)

OVER(

ORDER BY activity_date

)

AS cumulative_events

FROM

(

SELECT

DATE(event_time) AS activity_date,

COUNT(*) AS total_events

FROM user_events

GROUP BY DATE(event_time)

) t;

-------------------------------------------------
-- 19. Daily Purchases

-------------------------------------------------

SELECT

DATE(event_time),

COUNT(*)

FROM user_events

WHERE event_type='purchase'

GROUP BY DATE(event_time)

ORDER BY DATE(event_time);

-------------------------------------------------
-- 20. Device Usage Percentage
-------------------------------------------------

SELECT

device,

COUNT(*) AS total_events,

ROUND(

100.0*COUNT(*)/

SUM(COUNT(*)) OVER(),

2

)

AS percentage

FROM user_events

GROUP BY device

ORDER BY percentage DESC;

-------------------------------------------------
-- 21. User Retention
-- Number of days between signup and latest activity
-------------------------------------------------

SELECT
    u.user_id,
    u.full_name,
    u.signup_date,
    MAX(e.event_time)::DATE AS last_active_date,
    (MAX(e.event_time)::DATE - u.signup_date) AS retention_days

FROM users u
JOIN user_events e
ON u.user_id = e.user_id

GROUP BY
u.user_id,
u.full_name,
u.signup_date

ORDER BY retention_days DESC;

-------------------------------------------------
-- 22. Returning Users
-------------------------------------------------

SELECT

user_id,

COUNT(DISTINCT DATE(event_time)) AS active_days

FROM user_events

GROUP BY user_id

HAVING COUNT(DISTINCT DATE(event_time)) > 1

ORDER BY active_days DESC;

-------------------------------------------------
-- 23. User Cohorts
-- Group users by signup month
-------------------------------------------------

SELECT

DATE_TRUNC('month',signup_date)::DATE AS cohort_month,

COUNT(*) AS users

FROM users

GROUP BY cohort_month

ORDER BY cohort_month;

-------------------------------------------------
-- 24. Activity by Cohort
-------------------------------------------------

SELECT

DATE_TRUNC('month',u.signup_date)::DATE AS cohort,

DATE(e.event_time) AS activity_date,

COUNT(DISTINCT u.user_id) AS active_users

FROM users u

JOIN user_events e

ON u.user_id=e.user_id

GROUP BY

cohort,

activity_date

ORDER BY

cohort,

activity_date;

-------------------------------------------------
-- 25. Users With Purchases
-------------------------------------------------

SELECT DISTINCT

u.user_id,

u.full_name

FROM users u

JOIN user_events e

ON u.user_id=e.user_id

WHERE e.event_type='purchase'

ORDER BY u.user_id;

-------------------------------------------------
-- 26. Users Without Purchases
-------------------------------------------------

SELECT

u.user_id,

u.full_name

FROM users u

WHERE u.user_id NOT IN

(

SELECT DISTINCT user_id

FROM user_events

WHERE event_type='purchase'

);

-------------------------------------------------
-- 27. User Segmentation
-------------------------------------------------

SELECT

u.user_id,

u.full_name,

COUNT(e.event_id) AS total_events,

CASE

WHEN COUNT(e.event_id)>=5 THEN 'Highly Active'

WHEN COUNT(e.event_id)>=3 THEN 'Active'

ELSE 'Low Activity'

END AS user_segment

FROM users u

LEFT JOIN user_events e

ON u.user_id=e.user_id

GROUP BY

u.user_id,

u.full_name

ORDER BY total_events DESC;

-------------------------------------------------
-- 28. Average Events Per Active Day
-------------------------------------------------

SELECT

user_id,

ROUND(

COUNT(*)::NUMERIC /

COUNT(DISTINCT DATE(event_time)),

2

)

AS avg_events_per_day

FROM user_events

GROUP BY user_id

ORDER BY avg_events_per_day DESC;

-------------------------------------------------
-- 29. Most Popular Event Type
-------------------------------------------------

SELECT

event_type,

COUNT(*) AS total

FROM user_events

GROUP BY event_type

ORDER BY total DESC

LIMIT 1;

-------------------------------------------------
-- 30. Device Usage by User
-------------------------------------------------

SELECT

user_id,

device,

COUNT(*) AS total_events

FROM user_events

GROUP BY

user_id,

device

ORDER BY

user_id,

total_events DESC;

-------------------------------------------------
-- 31. First Login of Every User
-------------------------------------------------

SELECT

user_id,

MIN(event_time) AS first_login

FROM user_events

WHERE event_type='login'

GROUP BY user_id

ORDER BY first_login;

-------------------------------------------------
-- 32. Last Purchase of Every User
-------------------------------------------------

SELECT

user_id,

MAX(event_time) AS last_purchase

FROM user_events

WHERE event_type='purchase'

GROUP BY user_id

ORDER BY last_purchase DESC;

-------------------------------------------------
-- 33. Login to Purchase Conversion
-------------------------------------------------

SELECT

user_id,

SUM(

CASE

WHEN event_type='login' THEN 1

ELSE 0

END

) AS total_logins,

SUM(

CASE

WHEN event_type='purchase' THEN 1

ELSE 0

END

) AS total_purchases

FROM user_events

GROUP BY user_id

ORDER BY total_purchases DESC;

-------------------------------------------------
-- 34. Active Users by City
-------------------------------------------------

SELECT

u.city,

COUNT(DISTINCT e.user_id) AS active_users

FROM users u

JOIN user_events e

ON u.user_id=e.user_id

GROUP BY u.city

ORDER BY active_users DESC;

-------------------------------------------------
-- 35. Training Dataset for ML
-------------------------------------------------

SELECT

u.user_id,

u.city,

u.signup_date,

COUNT(e.event_id) AS total_events,

SUM(

CASE

WHEN e.event_type='login' THEN 1

ELSE 0

END

) AS login_count,

SUM(

CASE

WHEN e.event_type='search' THEN 1

ELSE 0

END

) AS search_count,

SUM(

CASE

WHEN e.event_type='purchase' THEN 1

ELSE 0

END

) AS purchase_count,

COUNT(DISTINCT DATE(e.event_time)) AS active_days

FROM users u

LEFT JOIN user_events e

ON u.user_id=e.user_id

GROUP BY

u.user_id,

u.city,

u.signup_date

ORDER BY u.user_id;