/*=========================================================
VIEW ALL DATA
=========================================================*/

SELECT *
FROM online_customers;

SELECT *
FROM store_customers;


/*=========================================================
UNION
(Removes duplicate rows)
=========================================================*/

-- 1. All customers

SELECT customer_name, city
FROM online_customers

UNION

SELECT customer_name, city
FROM store_customers;


-----------------------------------------------------------

-- 2. All customer names

SELECT customer_name
FROM online_customers

UNION

SELECT customer_name
FROM store_customers;


-----------------------------------------------------------

-- 3. All customer cities

SELECT city
FROM online_customers

UNION

SELECT city
FROM store_customers;


-----------------------------------------------------------

-- 4. Customers ordered alphabetically

SELECT customer_name
FROM online_customers

UNION

SELECT customer_name
FROM store_customers

ORDER BY customer_name;


-----------------------------------------------------------

-- 5. Customers from Mumbai or Pune

SELECT customer_name, city
FROM online_customers
WHERE city IN ('Mumbai','Pune')

UNION

SELECT customer_name, city
FROM store_customers
WHERE city IN ('Mumbai','Pune')

ORDER BY city;


/*=========================================================
UNION ALL
(Does NOT remove duplicates)
=========================================================*/

-- 6. Complete customer list

SELECT customer_name
FROM online_customers

UNION ALL

SELECT customer_name
FROM store_customers;


-----------------------------------------------------------

-- 7. Customer IDs

SELECT customer_id
FROM online_customers

UNION ALL

SELECT customer_id
FROM store_customers;


-----------------------------------------------------------

-- 8. Customer Names with City

SELECT customer_name, city
FROM online_customers

UNION ALL

SELECT customer_name, city
FROM store_customers;


-----------------------------------------------------------

-- 9. Mumbai customers

SELECT customer_name
FROM online_customers
WHERE city='Mumbai'

UNION ALL

SELECT customer_name
FROM store_customers
WHERE city='Mumbai';


-----------------------------------------------------------

-- 10. Nagpur customers

SELECT customer_name
FROM online_customers
WHERE city='Nagpur'

UNION ALL

SELECT customer_name
FROM store_customers
WHERE city='Nagpur';


/*=========================================================
INTERSECT
(Common Records
=========================================================*/

-- 11. Customers present in both tables

SELECT customer_name
FROM online_customers

INTERSECT

SELECT customer_name
FROM store_customers;


-----------------------------------------------------------

-- 12. Common Customer IDs

SELECT customer_id
FROM online_customers

INTERSECT

SELECT customer_id
FROM store_customers;


-----------------------------------------------------------

-- 13. Common customer names with city

SELECT customer_name, city
FROM online_customers

INTERSECT

SELECT customer_name, city
FROM store_customers;


-----------------------------------------------------------

-- 14. Common Pune customers

SELECT customer_name
FROM online_customers
WHERE city='Pune'

INTERSECT

SELECT customer_name
FROM store_customers
WHERE city='Pune';


-----------------------------------------------------------

-- 15. Common Mumbai customers

SELECT customer_name
FROM online_customers
WHERE city='Mumbai'

INTERSECT

SELECT customer_name
FROM store_customers
WHERE city='Mumbai';


/*=========================================================
EXCEPT
=========================================================*/

-- 16. Online customers only

SELECT customer_name
FROM online_customers

EXCEPT

SELECT customer_name
FROM store_customers;


-----------------------------------------------------------

-- 17. Store customers only

SELECT customer_name
FROM store_customers

EXCEPT

SELECT customer_name
FROM online_customers;


-----------------------------------------------------------

-- 18. Customer IDs only in online table

SELECT customer_id
FROM online_customers

EXCEPT

SELECT customer_id
FROM store_customers;


-----------------------------------------------------------

-- 19. Customer IDs only in store table

SELECT customer_id
FROM store_customers

EXCEPT

SELECT customer_id
FROM online_customers;


-----------------------------------------------------------

-- 20. Mumbai online customers only

SELECT customer_name
FROM online_customers
WHERE city='Mumbai'

EXCEPT

SELECT customer_name
FROM store_customers
WHERE city='Mumbai';


/*=========================================================
REALISTIC BUSINESS QUERIES
=========================================================*/

-- 21. Every customer from both systems

SELECT customer_name, city
FROM online_customers

UNION

SELECT customer_name, city
FROM store_customers

ORDER BY customer_name;


-----------------------------------------------------------

-- 22. Customers available in both systems

SELECT customer_name
FROM online_customers

INTERSECT

SELECT customer_name
FROM store_customers

ORDER BY customer_name;


-----------------------------------------------------------

-- 23. Customers available only online

SELECT customer_name
FROM online_customers

EXCEPT

SELECT customer_name
FROM store_customers

ORDER BY customer_name;


-----------------------------------------------------------

-- 24. Customers available only in physical stores

SELECT customer_name
FROM store_customers

EXCEPT

SELECT customer_name
FROM online_customers

ORDER BY customer_name;


-----------------------------------------------------------

-- 25. Complete customer history

SELECT customer_name
FROM online_customers

UNION ALL

SELECT customer_name
FROM store_customers

ORDER BY customer_name;