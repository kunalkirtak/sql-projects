------------------------------------------------------------
-- University Course Enrollment System
-- PostgreSQL
-- SQL JOINS
------------------------------------------------------------

------------------------------------------------------------
-- View All Tables
------------------------------------------------------------

SELECT * FROM departments;

SELECT * FROM students;

SELECT * FROM student_profiles;

SELECT * FROM instructors;

SELECT * FROM courses;

SELECT * FROM enrollments;

------------------------------------------------------------
-- INNER JOIN
------------------------------------------------------------

-- Student with Department

SELECT
s.student_id,
s.first_name,
s.last_name,
d.department_name

FROM students s

INNER JOIN departments d

ON s.department_id=d.department_id;

------------------------------------------------------------

-- Course with Instructor

SELECT

c.course_name,
c.credits,
i.instructor_name

FROM courses c

INNER JOIN instructors i

ON c.instructor_id=i.instructor_id;

------------------------------------------------------------

-- Student with Course

SELECT

s.first_name,
c.course_name,
e.semester,
e.grade

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id;

------------------------------------------------------------

-- Instructor with Department

SELECT

i.instructor_name,
d.department_name

FROM instructors i

INNER JOIN departments d

ON i.department_id=d.department_id;

------------------------------------------------------------

-- Student Complete Information

SELECT

s.first_name,
s.last_name,
d.department_name,
sp.email,
sp.city

FROM students s

INNER JOIN departments d

ON s.department_id=d.department_id

INNER JOIN student_profiles sp

ON s.student_id=sp.student_id;

------------------------------------------------------------
-- LEFT JOIN
------------------------------------------------------------

-- Show every student even if profile missing

SELECT

s.student_id,
s.first_name,
sp.email

FROM students s

LEFT JOIN student_profiles sp

ON s.student_id=sp.student_id;

------------------------------------------------------------

-- Show every instructor

SELECT

i.instructor_name,
c.course_name

FROM instructors i

LEFT JOIN courses c

ON i.instructor_id=c.instructor_id;

------------------------------------------------------------

-- Students and their enrollments

SELECT

s.first_name,
e.course_id

FROM students s

LEFT JOIN enrollments e

ON s.student_id=e.student_id;

------------------------------------------------------------

-- Departments with students

SELECT

d.department_name,
s.first_name

FROM departments d

LEFT JOIN students s

ON d.department_id=s.department_id;

------------------------------------------------------------
-- RIGHT JOIN
------------------------------------------------------------

-- Every profile

SELECT

s.first_name,
sp.email

FROM students s

RIGHT JOIN student_profiles sp

ON s.student_id=sp.student_id;

------------------------------------------------------------

-- Every course

SELECT

i.instructor_name,
c.course_name

FROM instructors i

RIGHT JOIN courses c

ON i.instructor_id=c.instructor_id;

------------------------------------------------------------

-- Every enrollment

SELECT

s.first_name,
e.grade

FROM students s

RIGHT JOIN enrollments e

ON s.student_id=e.student_id;

------------------------------------------------------------
-- FULL OUTER JOIN
------------------------------------------------------------

SELECT

s.first_name,
sp.email

FROM students s

FULL OUTER JOIN student_profiles sp

ON s.student_id=sp.student_id;

------------------------------------------------------------

SELECT

d.department_name,
s.first_name

FROM departments d

FULL OUTER JOIN students s

ON d.department_id=s.department_id;

------------------------------------------------------------

SELECT

i.instructor_name,
c.course_name

FROM instructors i

FULL OUTER JOIN courses c

ON i.instructor_id=c.instructor_id;

------------------------------------------------------------
-- Multiple INNER JOIN
------------------------------------------------------------

SELECT

s.first_name,
d.department_name,
c.course_name,
e.grade

FROM students s

INNER JOIN departments d

ON s.department_id=d.department_id

INNER JOIN enrollments e

ON s.student_id=e.student_id

INNER JOIN courses c

ON e.course_id=c.course_id;

------------------------------------------------------------

SELECT

s.first_name,
sp.city,
d.department_name

FROM students s

INNER JOIN student_profiles sp

ON s.student_id=sp.student_id

INNER JOIN departments d

ON s.department_id=d.department_id;

------------------------------------------------------------

SELECT

c.course_name,
i.instructor_name,
d.department_name

FROM courses c

INNER JOIN instructors i

ON c.instructor_id=i.instructor_id

INNER JOIN departments d

ON i.department_id=d.department_id;

------------------------------------------------------------
-- JOIN with WHERE
------------------------------------------------------------

SELECT

s.first_name,
c.course_name

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

WHERE c.course_name='Machine Learning';

------------------------------------------------------------

SELECT

s.first_name,
d.department_name

FROM students s

INNER JOIN departments d

ON s.department_id=d.department_id

WHERE d.department_name='Artificial Intelligence';

------------------------------------------------------------

SELECT

c.course_name,
i.instructor_name

FROM courses c

INNER JOIN instructors i

ON c.instructor_id=i.instructor_id

WHERE c.credits=4;

------------------------------------------------------------
-- ORDER BY with JOIN
------------------------------------------------------------

SELECT

s.first_name,
d.department_name

FROM students s

INNER JOIN departments d

ON s.department_id=d.department_id

ORDER BY s.first_name;

------------------------------------------------------------

SELECT

c.course_name,
i.instructor_name

FROM courses c

INNER JOIN instructors i

ON c.instructor_id=i.instructor_id

ORDER BY c.course_name;

------------------------------------------------------------

SELECT

s.first_name,
c.course_name

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

ORDER BY s.first_name;

------------------------------------------------------------
-- SELF JOIN
------------------------------------------------------------

-- Example 1
-- Pair students from the same department

SELECT
s1.first_name AS student_1,
s2.first_name AS student_2,
s1.department_id

FROM students s1

INNER JOIN students s2

ON s1.department_id = s2.department_id

AND s1.student_id < s2.student_id

ORDER BY s1.department_id;

------------------------------------------------------------

-- Example 2
-- Pair instructors from the same department

SELECT

i1.instructor_name AS instructor_1,
i2.instructor_name AS instructor_2,
i1.department_id

FROM instructors i1

INNER JOIN instructors i2

ON i1.department_id=i2.department_id

AND i1.instructor_id<i2.instructor_id;

------------------------------------------------------------

------------------------------------------------------------
-- CROSS JOIN
------------------------------------------------------------

-- Every Student with Every Department

SELECT

s.first_name,
d.department_name

FROM students s

CROSS JOIN departments d;

------------------------------------------------------------

-- Every Instructor with Every Course

SELECT

i.instructor_name,
c.course_name

FROM instructors i

CROSS JOIN courses c;

------------------------------------------------------------

------------------------------------------------------------
-- ONE TO ONE RELATIONSHIP
------------------------------------------------------------

-- Student with Profile

SELECT

s.student_id,
s.first_name,
s.last_name,
sp.email,
sp.phone,
sp.city

FROM students s

INNER JOIN student_profiles sp

ON s.student_id=sp.student_id;

------------------------------------------------------------

-- Students living in Pune

SELECT

s.first_name,
sp.city

FROM students s

INNER JOIN student_profiles sp

ON s.student_id=sp.student_id

WHERE sp.city='Pune';

------------------------------------------------------------

------------------------------------------------------------
-- ONE TO MANY RELATIONSHIP
------------------------------------------------------------

-- Department -> Students

SELECT

d.department_name,
s.first_name

FROM departments d

INNER JOIN students s

ON d.department_id=s.department_id

ORDER BY d.department_name;

------------------------------------------------------------

-- Instructor -> Courses

SELECT

i.instructor_name,
c.course_name

FROM instructors i

INNER JOIN courses c

ON i.instructor_id=c.instructor_id

ORDER BY i.instructor_name;

------------------------------------------------------------

------------------------------------------------------------
-- MANY TO MANY RELATIONSHIP
------------------------------------------------------------

-- Students with Courses

SELECT

s.first_name,
c.course_name,
e.grade

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

ORDER BY s.first_name;

------------------------------------------------------------

-- Courses with Students

SELECT

c.course_name,
s.first_name

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

ORDER BY c.course_name;

------------------------------------------------------------

------------------------------------------------------------
-- INTERVIEW STYLE QUERIES
------------------------------------------------------------

-- Students enrolled in Machine Learning

SELECT

s.first_name,
c.course_name

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

WHERE c.course_name='Machine Learning';

------------------------------------------------------------

-- Students enrolled in Database Management Systems

SELECT

s.first_name,
c.course_name

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

WHERE c.course_name='Database Management Systems';

------------------------------------------------------------

-- AI Department Students

SELECT

s.first_name,
d.department_name

FROM students s

INNER JOIN departments d

ON s.department_id=d.department_id

WHERE d.department_name='Artificial Intelligence';

------------------------------------------------------------

-- Computer Science Students

SELECT

s.first_name,
d.department_name

FROM students s

INNER JOIN departments d

ON s.department_id=d.department_id

WHERE d.department_name='Computer Science';

------------------------------------------------------------

-- Courses taught by Dr. Anita Sharma

SELECT

c.course_name,
i.instructor_name

FROM courses c

INNER JOIN instructors i

ON c.instructor_id=i.instructor_id

WHERE i.instructor_name='Dr. Anita Sharma';

------------------------------------------------------------

-- Students with Grade A

SELECT

s.first_name,
c.course_name,
e.grade

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

WHERE e.grade='A';

------------------------------------------------------------

-- Students with Grade A+

SELECT

s.first_name,
c.course_name,
e.grade

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

WHERE e.grade='A+';

------------------------------------------------------------

-- Students ordered by Department

SELECT

s.first_name,
d.department_name

FROM students s

INNER JOIN departments d

ON s.department_id=d.department_id

ORDER BY d.department_name;

------------------------------------------------------------

-- Courses ordered by Credits

SELECT

c.course_name,
c.credits,
i.instructor_name

FROM courses c

INNER JOIN instructors i

ON c.instructor_id=i.instructor_id

ORDER BY c.credits DESC;

------------------------------------------------------------

-- Students with their Instructor

SELECT

s.first_name,
c.course_name,
i.instructor_name

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

INNER JOIN instructors i

ON c.instructor_id=i.instructor_id

ORDER BY s.first_name;

------------------------------------------------------------

-- Students from Pune

SELECT

s.first_name,
sp.city

FROM students s

INNER JOIN student_profiles sp

ON s.student_id=sp.student_id

WHERE sp.city='Pune';

------------------------------------------------------------

-- Students from Mumbai

SELECT

s.first_name,
sp.city

FROM students s

INNER JOIN student_profiles sp

ON s.student_id=sp.student_id

WHERE sp.city='Mumbai';

------------------------------------------------------------

-- Students from Nagpur

SELECT

s.first_name,
sp.city

FROM students s

INNER JOIN student_profiles sp

ON s.student_id=sp.student_id

WHERE sp.city='Nagpur';

------------------------------------------------------------

-- Top 10 Enrollment Records

SELECT

s.first_name,
c.course_name,
e.grade

FROM enrollments e

INNER JOIN students s

ON e.student_id=s.student_id

INNER JOIN courses c

ON e.course_id=c.course_id

LIMIT 10;

------------------------------------------------------------

-- End of queries.sql
------------------------------------------------------------