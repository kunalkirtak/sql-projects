-- ==========================================
-- Window Functions - Part A
-- ==========================================

--------------------------------------------------
-- View Complete Employee Table
--------------------------------------------------

SELECT *
FROM employees;

--------------------------------------------------
-- 1. ROW_NUMBER()
-- Assign a unique row number based on salary
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    department,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_number
FROM employees;

--------------------------------------------------
-- 2. ROW_NUMBER() with PARTITION BY
-- Restart numbering for every department
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    department,
    salary,

    ROW_NUMBER() OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_row_number

FROM employees;

--------------------------------------------------
-- 3. RANK()
-- Employees having same salary receive same rank.
-- Next rank is skipped.
--------------------------------------------------

SELECT

    employee_id,
    first_name,
    salary,

    RANK() OVER
    (
        ORDER BY salary DESC
    ) AS salary_rank

FROM employees;

--------------------------------------------------
-- 4. DENSE_RANK()
-- Same salary gets same rank.
-- No gaps in ranking.
--------------------------------------------------

SELECT

    employee_id,
    first_name,
    salary,

    DENSE_RANK() OVER
    (
        ORDER BY salary DESC
    ) AS dense_salary_rank

FROM employees;

--------------------------------------------------
-- 5. Compare ROW_NUMBER vs RANK vs DENSE_RANK
--------------------------------------------------

SELECT

    first_name,
    department,
    salary,

    ROW_NUMBER() OVER
    (
        ORDER BY salary DESC
    ) AS row_num,

    RANK() OVER
    (
        ORDER BY salary DESC
    ) AS rank_num,

    DENSE_RANK() OVER
    (
        ORDER BY salary DESC
    ) AS dense_rank_num

FROM employees;

--------------------------------------------------
-- 6. Department-wise Salary Ranking
--------------------------------------------------

SELECT

    first_name,
    department,
    salary,

    RANK() OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank

FROM employees;

--------------------------------------------------
-- 7. Department-wise Dense Ranking
--------------------------------------------------

SELECT

    first_name,
    department,
    salary,

    DENSE_RANK() OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_dense_rank

FROM employees;

--------------------------------------------------
-- 8. Highest Paid Employee from Each Department
--------------------------------------------------

SELECT *
FROM
(
    SELECT

        first_name,
        department,
        salary,

        ROW_NUMBER() OVER
        (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS rn

    FROM employees

) ranked

WHERE rn = 1;

--------------------------------------------------
-- 9. Top 2 Highest Paid Employees
-- from Every Department
--------------------------------------------------

SELECT *
FROM
(
    SELECT

        first_name,
        department,
        salary,

        ROW_NUMBER() OVER
        (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS rn

    FROM employees

) ranked

WHERE rn <= 2;

--------------------------------------------------
-- 10. Rank Employees by Performance Score
--------------------------------------------------

SELECT

    first_name,
    performance_score,

    RANK() OVER
    (
        ORDER BY performance_score DESC
    ) AS performance_rank

FROM employees;

--------------------------------------------------
-- 11. Dense Rank by Performance
--------------------------------------------------

SELECT

    first_name,
    performance_score,

    DENSE_RANK() OVER
    (
        ORDER BY performance_score DESC
    ) AS dense_performance_rank

FROM employees;

--------------------------------------------------
-- 12. Number Employees
-- by Joining Date
--------------------------------------------------

SELECT

    first_name,
    joining_date,

    ROW_NUMBER() OVER
    (
        ORDER BY joining_date
    ) AS joining_order

FROM employees;

--------------------------------------------------
-- 13. Department-wise Joining Order
--------------------------------------------------

SELECT

    first_name,
    department,
    joining_date,

    ROW_NUMBER() OVER
    (
        PARTITION BY department
        ORDER BY joining_date
    ) AS joining_sequence

FROM employees;

--------------------------------------------------
-- 14. Salary Rank inside AI & ML Department
--------------------------------------------------

SELECT

    first_name,
    salary,

    RANK() OVER
    (
        ORDER BY salary DESC
    ) AS rank

FROM employees

WHERE department='AI & ML';

--------------------------------------------------
-- 15. Salary Rank inside Software Department
--------------------------------------------------

SELECT

    first_name,
    salary,

    DENSE_RANK() OVER
    (
        ORDER BY salary DESC
    ) AS rank

FROM employees

WHERE department='Software';

--------------------------------------------------
-- 16. Highest Performance Employee
--------------------------------------------------

SELECT *
FROM
(
    SELECT

        first_name,
        department,
        performance_score,

        ROW_NUMBER() OVER
        (
            ORDER BY performance_score DESC
        ) AS rn

    FROM employees

) ranked

WHERE rn=1;

--------------------------------------------------
-- 17. Lowest Salary Employee
--------------------------------------------------

SELECT *
FROM
(
    SELECT

        first_name,
        salary,

        ROW_NUMBER() OVER
        (
            ORDER BY salary
        ) AS rn

    FROM employees

) ranked

WHERE rn=1;

--------------------------------------------------
-- 18. Rank Employees by Bonus
--------------------------------------------------

SELECT

    first_name,
    bonus,

    DENSE_RANK() OVER
    (
        ORDER BY bonus DESC
    ) AS bonus_rank

FROM employees;

--------------------------------------------------
-- 19. Department-wise Bonus Ranking
--------------------------------------------------

SELECT

    first_name,
    department,
    bonus,

    RANK() OVER
    (
        PARTITION BY department
        ORDER BY bonus DESC
    ) AS department_bonus_rank

FROM employees;

--------------------------------------------------
-- 20. Complete Ranking Dashboard
--------------------------------------------------

SELECT

    first_name,
    department,
    salary,
    performance_score,

    ROW_NUMBER() OVER
    (
        ORDER BY salary DESC
    ) AS row_num,

    RANK() OVER
    (
        ORDER BY salary DESC
    ) AS salary_rank,

    DENSE_RANK() OVER
    (
        ORDER BY salary DESC
    ) AS dense_rank,

    ROW_NUMBER() OVER
    (
        PARTITION BY department
        ORDER BY performance_score DESC
    ) AS department_performance_position

FROM employees

ORDER BY department, salary DESC;

-- ==========================================
-- Window Functions - Part B
-- ==========================================

--------------------------------------------------
-- 21. NTILE()
-- Divide employees into 4 salary groups
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    department,
    salary,

    NTILE(4) OVER
    (
        ORDER BY salary DESC
    ) AS salary_quartile

FROM employees;

--------------------------------------------------
-- 22. NTILE()
-- Divide employees into 5 performance groups
--------------------------------------------------

SELECT
    first_name,
    performance_score,

    NTILE(5) OVER
    (
        ORDER BY performance_score DESC
    ) AS performance_group

FROM employees;

--------------------------------------------------
-- 23. Department-wise NTILE
--------------------------------------------------

SELECT
    first_name,
    department,
    salary,

    NTILE(3) OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_salary_group

FROM employees;

--------------------------------------------------
-- 24. LAG()
-- Previous Employee Salary
--------------------------------------------------

SELECT
    first_name,
    joining_date,
    salary,

    LAG(salary) OVER
    (
        ORDER BY joining_date
    ) AS previous_salary

FROM employees;

--------------------------------------------------
-- 25. Salary Difference from Previous Employee
--------------------------------------------------

SELECT
    first_name,
    joining_date,
    salary,

    LAG(salary) OVER
    (
        ORDER BY joining_date
    ) AS previous_salary,

    salary -
    LAG(salary) OVER
    (
        ORDER BY joining_date
    ) AS salary_difference

FROM employees;

--------------------------------------------------
-- 26. Previous Bonus
--------------------------------------------------

SELECT
    first_name,
    joining_date,
    bonus,

    LAG(bonus) OVER
    (
        ORDER BY joining_date
    ) AS previous_bonus

FROM employees;

--------------------------------------------------
-- 27. Department-wise Previous Salary
--------------------------------------------------

SELECT
    first_name,
    department,
    salary,

    LAG(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS previous_department_salary

FROM employees;

--------------------------------------------------
-- 28. LEAD()
-- Next Employee Salary
--------------------------------------------------

SELECT
    first_name,
    joining_date,
    salary,

    LEAD(salary) OVER
    (
        ORDER BY joining_date
    ) AS next_salary

FROM employees;

--------------------------------------------------
-- 29. Salary Difference with Next Employee
--------------------------------------------------

SELECT
    first_name,
    joining_date,
    salary,

    LEAD(salary) OVER
    (
        ORDER BY joining_date
    ) AS next_salary,

    LEAD(salary) OVER
    (
        ORDER BY joining_date
    ) - salary AS difference

FROM employees;

--------------------------------------------------
-- 30. Next Performance Score
--------------------------------------------------

SELECT
    first_name,
    performance_score,

    LEAD(performance_score) OVER
    (
        ORDER BY performance_score DESC
    ) AS next_performance

FROM employees;

--------------------------------------------------
-- 31. Department-wise LEAD()
--------------------------------------------------

SELECT
    first_name,
    department,
    salary,

    LEAD(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS next_department_salary

FROM employees;

--------------------------------------------------
-- 32. FIRST_VALUE()
-- Highest Salary in Company
--------------------------------------------------

SELECT
    first_name,
    salary,

    FIRST_VALUE(salary) OVER
    (
        ORDER BY salary DESC
    ) AS company_highest_salary

FROM employees;

--------------------------------------------------
-- 33. FIRST_VALUE()
-- Highest Salary in Each Department
--------------------------------------------------

SELECT
    first_name,
    department,
    salary,

    FIRST_VALUE(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_highest_salary

FROM employees;

--------------------------------------------------
-- 34. FIRST_VALUE()
-- Top Performance in Department
--------------------------------------------------

SELECT
    first_name,
    department,
    performance_score,

    FIRST_VALUE(performance_score) OVER
    (
        PARTITION BY department
        ORDER BY performance_score DESC
    ) AS best_department_score

FROM employees;

--------------------------------------------------
-- 35. LAST_VALUE()
-- Lowest Salary in Company
--------------------------------------------------

SELECT
    first_name,
    salary,

    LAST_VALUE(salary) OVER
    (
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS company_lowest_salary

FROM employees;

--------------------------------------------------
-- 36. LAST_VALUE()
-- Lowest Salary in Department
--------------------------------------------------

SELECT
    first_name,
    department,
    salary,

    LAST_VALUE(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS department_lowest_salary

FROM employees;

--------------------------------------------------
-- 37. FIRST_VALUE() Employee Name
--------------------------------------------------

SELECT
    first_name,
    salary,

    FIRST_VALUE(first_name) OVER
    (
        ORDER BY salary DESC
    ) AS highest_paid_employee

FROM employees;

--------------------------------------------------
-- 38. LAST_VALUE() Employee Name
--------------------------------------------------

SELECT
    first_name,
    salary,

    LAST_VALUE(first_name) OVER
    (
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_paid_employee

FROM employees;

--------------------------------------------------
-- 39. Compare Previous and Next Salary
--------------------------------------------------

SELECT
    first_name,
    salary,

    LAG(salary) OVER
    (
        ORDER BY salary
    ) AS previous_salary,

    LEAD(salary) OVER
    (
        ORDER BY salary
    ) AS next_salary

FROM employees;

--------------------------------------------------
-- 40. Complete Analytics Dashboard
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    department,
    salary,
    performance_score,

    NTILE(4) OVER
    (
        ORDER BY salary DESC
    ) AS salary_quartile,

    LAG(salary) OVER
    (
        ORDER BY salary DESC
    ) AS previous_salary,

    LEAD(salary) OVER
    (
        ORDER BY salary DESC
    ) AS next_salary,

    FIRST_VALUE(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_max_salary,

    LAST_VALUE(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS department_min_salary

FROM employees
ORDER BY department, salary DESC;

-- ==========================================
-- Window Functions - Part C
-- ==========================================

--------------------------------------------------
-- 41. Running Total of Salary
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,

    SUM(salary) OVER
    (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total_salary

FROM employees;

--------------------------------------------------
-- 42. Running Total of Bonus
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    bonus,

    SUM(bonus) OVER
    (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total_bonus

FROM employees;

--------------------------------------------------
-- 43. Running Average Salary
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,

    AVG(salary) OVER
    (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_average_salary

FROM employees;

--------------------------------------------------
-- 44. Cumulative Maximum Salary
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,

    MAX(salary) OVER
    (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_max_salary

FROM employees;

--------------------------------------------------
-- 45. Cumulative Minimum Salary
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,

    MIN(salary) OVER
    (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_min_salary

FROM employees;

--------------------------------------------------
-- 46. Moving Average (Current + Previous + Next)
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,

    AVG(salary) OVER
    (
        ORDER BY employee_id
        ROWS BETWEEN 1 PRECEDING
        AND 1 FOLLOWING
    ) AS moving_average_salary

FROM employees;

--------------------------------------------------
-- 47. Sum of Previous, Current and Next Salary
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,

    SUM(salary) OVER
    (
        ORDER BY employee_id
        ROWS BETWEEN 1 PRECEDING
        AND 1 FOLLOWING
    ) AS nearby_salary_sum

FROM employees;

--------------------------------------------------
-- 48. Department-wise Running Total
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    department,
    salary,

    SUM(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS department_running_total

FROM employees;

--------------------------------------------------
-- 49. Department-wise Running Average
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    department,
    salary,

    AVG(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS department_running_average

FROM employees;

--------------------------------------------------
-- 50. Department-wise Highest Salary So Far
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    department,
    salary,

    MAX(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS department_max_so_far

FROM employees;

--------------------------------------------------
-- 51. Department-wise Lowest Salary So Far
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    department,
    salary,

    MIN(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS department_min_so_far

FROM employees;

--------------------------------------------------
-- 52. Salary Difference from Department Average
--------------------------------------------------

SELECT
    first_name,
    department,
    salary,

    AVG(salary) OVER
    (
        PARTITION BY department
    ) AS department_average,

    salary -
    AVG(salary) OVER
    (
        PARTITION BY department
    ) AS difference_from_average

FROM employees;

--------------------------------------------------
-- 53. Percentage of Department Salary
--------------------------------------------------

SELECT
    first_name,
    department,
    salary,

    ROUND
    (
        salary * 100.0 /

        SUM(salary) OVER
        (
            PARTITION BY department
        ),
        2
    ) AS salary_percentage

FROM employees;

--------------------------------------------------
-- 54. Company Salary Percentage
--------------------------------------------------

SELECT
    first_name,
    salary,

    ROUND
    (
        salary * 100.0 /

        SUM(salary) OVER (),
        2
    ) AS company_salary_percentage

FROM employees;

--------------------------------------------------
-- 55. Count Employees in Each Department
--------------------------------------------------

SELECT
    first_name,
    department,

    COUNT(*) OVER
    (
        PARTITION BY department
    ) AS department_employee_count

FROM employees;

--------------------------------------------------
-- 56. Total Bonus by Department
--------------------------------------------------

SELECT
    first_name,
    department,
    bonus,

    SUM(bonus) OVER
    (
        PARTITION BY department
    ) AS total_department_bonus

FROM employees;

--------------------------------------------------
-- 57. Average Performance by Department
--------------------------------------------------

SELECT
    first_name,
    department,
    performance_score,

    AVG(performance_score) OVER
    (
        PARTITION BY department
    ) AS department_average_score

FROM employees;

--------------------------------------------------
-- 58. Highest Bonus in Department
--------------------------------------------------

SELECT
    first_name,
    department,
    bonus,

    MAX(bonus) OVER
    (
        PARTITION BY department
    ) AS department_highest_bonus

FROM employees;

--------------------------------------------------
-- 59. Lowest Bonus in Department
--------------------------------------------------

SELECT
    first_name,
    department,
    bonus,

    MIN(bonus) OVER
    (
        PARTITION BY department
    ) AS department_lowest_bonus

FROM employees;

--------------------------------------------------
-- 60. Complete Employee Analytics Dashboard
--------------------------------------------------

SELECT
    employee_id,
    first_name,
    department,
    salary,
    bonus,
    performance_score,

    ROW_NUMBER() OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS row_number,

    RANK() OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank,

    DENSE_RANK() OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dense_rank,

    NTILE(4) OVER
    (
        ORDER BY salary DESC
    ) AS salary_quartile,

    LAG(salary) OVER
    (
        ORDER BY salary DESC
    ) AS previous_salary,

    LEAD(salary) OVER
    (
        ORDER BY salary DESC
    ) AS next_salary,

    SUM(salary) OVER
    (
        PARTITION BY department
    ) AS department_total_salary,

    AVG(salary) OVER
    (
        PARTITION BY department
    ) AS department_average_salary,

    FIRST_VALUE(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS highest_salary,

    LAST_VALUE(salary) OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_salary

FROM employees

ORDER BY department, salary DESC;