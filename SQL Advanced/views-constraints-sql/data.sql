-------------------------------------------------------
-- Insert Departments
-------------------------------------------------------

INSERT INTO departments
(department_name, hod_name)

VALUES
('Computer Science', 'Dr. Rajesh Sharma'),
('Artificial Intelligence', 'Dr. Meena Kulkarni'),
('Electronics', 'Dr. Amit Verma'),
('Mechanical', 'Dr. Neha Patil'),
('Civil', 'Dr. Sunil Deshmukh');

-------------------------------------------------------
-- Insert Students
-------------------------------------------------------

INSERT INTO students
(
    roll_number,
    first_name,
    last_name,
    age,
    gender,
    email,
    city,
    cgpa,
    department_id
)

VALUES

('CS101','Aarav','Sharma',20,'Male','aarav@gmail.com','Mumbai',8.70,1),

('CS102','Priya','Patel',21,'Female','priya@gmail.com','Pune',9.10,1),

('AI101','Ananya','Kulkarni',20,'Female','ananya@gmail.com','Nagpur',9.55,2),

('AI102','Vivek','Patil',22,'Male','vivek@gmail.com','Mumbai',8.95,2),

('EC101','Rahul','Singh',21,'Male','rahul@gmail.com','Delhi',8.20,3),

('EC102','Sneha','Joshi',20,'Female','sneha@gmail.com','Hyderabad',8.75,3),

('ME101','Rohan','Verma',22,'Male','rohan@gmail.com','Pune',7.60,4),

('ME102','Karan','Mehta',21,'Male','karan@gmail.com','Ahmedabad',7.95,4),

('CV101','Neha','Gupta',20,'Female','neha@gmail.com','Nagpur',8.30,5),

('CV102','Isha','Kapoor',21,'Female','isha@gmail.com','Jaipur',9.05,5),

('AI103','Meera','Naik',23,'Female','meera@gmail.com','Goa',9.40,2),

('CS103','Harsh','Bansal',22,'Male','harsh@gmail.com','Delhi',8.65,1),

('EC103','Divya','Shinde',20,'Female','divya@gmail.com','Pune',8.55,3),

('ME103','Arjun','Mishra',21,'Male','arjun@gmail.com','Lucknow',8.10,4),

('CV103','Yash','Rao',20,'Male','yash@gmail.com','Bengaluru',8.45,5);

-------------------------------------------------------
-- Insert Courses
-------------------------------------------------------

INSERT INTO courses
(
    course_code,
    course_name,
    credits,
    department_id
)

VALUES

('CS201','Database Management Systems',4,1),

('CS202','Operating Systems',4,1),

('AI201','Machine Learning',4,2),

('AI202','Deep Learning',4,2),

('EC201','Digital Electronics',3,3),

('EC202','Microprocessors',4,3),

('ME201','Thermodynamics',4,4),

('ME202','Machine Design',4,4),

('CV201','Structural Engineering',4,5),

('CV202','Surveying',3,5);

-------------------------------------------------------
-- Insert Enrollments
-------------------------------------------------------

INSERT INTO enrollments
(
    student_id,
    course_id,
    semester,
    grade
)

VALUES

(1,1,4,'A'),

(2,2,4,'A+'),

(3,3,5,'A+'),

(4,4,5,'A'),

(5,5,4,'B+'),

(6,6,4,'A'),

(7,7,5,'B'),

(8,8,5,'B+'),

(9,9,4,'A'),

(10,10,4,'A+'),

(11,3,6,'A'),

(12,1,5,'B+'),

(13,6,4,'A'),

(14,8,6,'A'),

(15,9,5,'A');