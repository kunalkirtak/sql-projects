-------------------------------------------------------
-- 1. View all departments
-------------------------------------------------------

SELECT *
FROM departments;

-------------------------------------------------------
-- 2. View all instructors
-------------------------------------------------------

SELECT *
FROM instructors;

-------------------------------------------------------
-- 3. View all courses
-------------------------------------------------------

SELECT *
FROM courses;

-------------------------------------------------------
-- 4. View all students
-------------------------------------------------------

SELECT *
FROM students;

-------------------------------------------------------
-- 5. View student enrollments
-------------------------------------------------------

SELECT *
FROM student_courses;

-------------------------------------------------------
-- 6. Students with their department
-------------------------------------------------------

SELECT
    s.student_id,
    s.student_name,
    d.department_name
FROM students s
JOIN departments d
ON s.department_id = d.department_id
ORDER BY s.student_name;

-------------------------------------------------------
-- 7. Students with assigned instructor
-------------------------------------------------------

SELECT
    s.student_name,
    i.instructor_name
FROM students s
JOIN instructors i
ON s.instructor_id = i.instructor_id
ORDER BY s.student_name;

-------------------------------------------------------
-- 8. Instructor with department
-------------------------------------------------------

SELECT
    i.instructor_name,
    d.department_name
FROM instructors i
JOIN departments d
ON i.department_id = d.department_id
ORDER BY d.department_name;

-------------------------------------------------------
-- 9. Student and enrolled courses
-------------------------------------------------------

SELECT
    s.student_name,
    c.course_name
FROM student_courses sc
JOIN students s
ON sc.student_id = s.student_id
JOIN courses c
ON sc.course_id = c.course_id
ORDER BY s.student_name;

-------------------------------------------------------
-- 10. Students in Computer Science department
-------------------------------------------------------

SELECT
    s.student_name
FROM students s
JOIN departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-------------------------------------------------------
-- 11. Courses with 4 credits
-------------------------------------------------------

SELECT *
FROM courses
WHERE credits = 4;

-------------------------------------------------------
-- 12. Students learning Machine Learning
-------------------------------------------------------

SELECT
    s.student_name
FROM student_courses sc
JOIN students s
ON sc.student_id = s.student_id
JOIN courses c
ON sc.course_id = c.course_id
WHERE c.course_name = 'Machine Learning';

-------------------------------------------------------
-- 13. Number of students
-------------------------------------------------------

SELECT COUNT(*) AS total_students
FROM students;

-------------------------------------------------------
-- 14. Number of courses
-------------------------------------------------------

SELECT COUNT(*) AS total_courses
FROM courses;

-------------------------------------------------------
-- 15. Number of departments
-------------------------------------------------------

SELECT COUNT(*) AS total_departments
FROM departments;

-------------------------------------------------------
-- 16. Number of instructors
-------------------------------------------------------

SELECT COUNT(*) AS total_instructors
FROM instructors;

-------------------------------------------------------
-- 17. Number of enrollments
-------------------------------------------------------

SELECT COUNT(*) AS total_enrollments
FROM student_courses;

-------------------------------------------------------
-- 18. Student count per department
-------------------------------------------------------

SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
GROUP BY d.department_name
ORDER BY total_students DESC;

-------------------------------------------------------
-- 19. Courses ordered alphabetically
-------------------------------------------------------

SELECT *
FROM courses
ORDER BY course_name;

-------------------------------------------------------
-- 20. First five students
-------------------------------------------------------

SELECT *
FROM students
ORDER BY student_id
LIMIT 5;