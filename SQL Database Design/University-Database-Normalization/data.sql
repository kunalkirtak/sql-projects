-------------------------------------------------------
-- Departments
-------------------------------------------------------

INSERT INTO departments
(department_name, hod_name)

VALUES
('Computer Science','Dr. Amit Sharma'),
('Artificial Intelligence','Dr. Priya Joshi'),
('Electronics','Dr. Neha Verma'),
('Mechanical','Dr. Rahul Singh'),
('Civil','Dr. Anjali Patil');

-------------------------------------------------------
-- Instructors
-------------------------------------------------------

INSERT INTO instructors
(instructor_name, department_id)

VALUES
('Prof. Rajesh Kumar',1),
('Prof. Sneha Patil',1),
('Prof. Kiran Deshmukh',2),
('Prof. Meera Kulkarni',2),
('Prof. Vivek Joshi',3),
('Prof. Ankit Sharma',4),
('Prof. Pooja Verma',5);

-------------------------------------------------------
-- Courses
-------------------------------------------------------

INSERT INTO courses
(course_name, credits)

VALUES
('Database Management Systems',4),
('Data Structures',4),
('Machine Learning',4),
('Artificial Intelligence',4),
('Digital Electronics',3),
('Thermodynamics',3),
('Structural Engineering',4),
('Operating Systems',4),
('Computer Networks',4),
('Python Programming',3);

-------------------------------------------------------
-- Students
-------------------------------------------------------

INSERT INTO students
(student_name, department_id, instructor_id)

VALUES
('Aarav Sharma',1,1),
('Priya Patel',2,3),
('Rahul Singh',3,5),
('Sneha Joshi',1,2),
('Rohan Verma',4,6),
('Ananya Kulkarni',2,4),
('Vivek Patil',1,1),
('Neha Gupta',3,5),
('Karan Mehta',5,7),
('Isha Kapoor',2,3);

-------------------------------------------------------
-- Student Course Enrollment
-------------------------------------------------------

INSERT INTO student_courses
(student_id, course_id)

VALUES
(1,1),
(1,2),
(1,8),

(2,3),
(2,4),
(2,10),

(3,5),
(3,8),

(4,1),
(4,9),

(5,6),

(6,3),
(6,10),

(7,2),
(7,8),
(7,9),

(8,5),

(9,7),

(10,3),
(10,4),
(10,10);