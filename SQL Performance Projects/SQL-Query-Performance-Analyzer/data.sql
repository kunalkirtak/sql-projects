INSERT INTO employees
(employee_name,
department,
salary,
city)

SELECT

'Employee ' || g,

CASE

WHEN g % 5 = 0 THEN 'AI'

WHEN g % 5 = 1 THEN 'HR'

WHEN g % 5 = 2 THEN 'Finance'

WHEN g % 5 = 3 THEN 'Sales'

ELSE 'Software'

END,

40000 + (random()*80000)::INT,

CASE

WHEN g % 4 = 0 THEN 'Pune'

WHEN g % 4 = 1 THEN 'Mumbai'

WHEN g % 4 = 2 THEN 'Delhi'

ELSE 'Nagpur'

END

FROM generate_series(1,100000) g;