----------------------------------------------------------
-- University Course Enrollment System
-- data.sql
----------------------------------------------------------

----------------------------------------------------------
-- INSERT INTO DEPARTMENTS
----------------------------------------------------------

INSERT INTO departments (department_name)
VALUES
('Computer Science'),
('Artificial Intelligence'),
('Electronics'),
('Mechanical Engineering'),
('Civil Engineering');

----------------------------------------------------------
-- INSERT INTO STUDENTS
----------------------------------------------------------

INSERT INTO students
(first_name,last_name,gender,age,department_id)
VALUES
('Aarav','Sharma','Male',20,1),
('Priya','Patel','Female',21,2),
('Rahul','Singh','Male',22,3),
('Sneha','Joshi','Female',20,1),
('Rohan','Verma','Male',19,4),
('Ananya','Kulkarni','Female',21,2),
('Vivek','Patil','Male',22,2),
('Neha','Gupta','Female',20,3),
('Karan','Mehta','Male',23,5),
('Isha','Kapoor','Female',21,1),
('Aditya','Deshmukh','Male',22,4),
('Pooja','Yadav','Female',20,2),
('Harsh','Bansal','Male',21,1),
('Meera','Naik','Female',22,3),
('Arjun','Mishra','Male',20,2);

----------------------------------------------------------
-- INSERT INTO STUDENT PROFILES
----------------------------------------------------------

INSERT INTO student_profiles
(student_id,email,phone,city)
VALUES
(1,'aarav@gmail.com','9876543201','Mumbai'),
(2,'priya@gmail.com','9876543202','Pune'),
(3,'rahul@gmail.com','9876543203','Nagpur'),
(4,'sneha@gmail.com','9876543204','Delhi'),
(5,'rohan@gmail.com','9876543205','Nagpur'),
(6,'ananya@gmail.com','9876543206','Pune'),
(7,'vivek@gmail.com','9876543207','Mumbai'),
(8,'neha@gmail.com','9876543208','Hyderabad'),
(9,'karan@gmail.com','9876543209','Ahmedabad'),
(10,'isha@gmail.com','9876543210','Jaipur'),
(11,'aditya@gmail.com','9876543211','Pune'),
(12,'pooja@gmail.com','9876543212','Nagpur'),
(13,'harsh@gmail.com','9876543213','Delhi'),
(14,'meera@gmail.com','9876543214','Goa'),
(15,'arjun@gmail.com','9876543215','Lucknow');

----------------------------------------------------------
-- INSERT INTO INSTRUCTORS
----------------------------------------------------------

INSERT INTO instructors
(instructor_name,department_id)
VALUES
('Dr. Rajesh Kumar',1),
('Dr. Anita Sharma',2),
('Dr. Vivek Rao',3),
('Dr. Sunil Patil',4),
('Dr. Neha Jain',5),
('Dr. Pooja Verma',1),
('Dr. Amit Kulkarni',2),
('Dr. Kavita Joshi',3);

----------------------------------------------------------
-- INSERT INTO COURSES
----------------------------------------------------------

INSERT INTO courses
(course_name,credits,instructor_id)
VALUES
('Database Management Systems',4,1),
('Operating Systems',4,6),
('Machine Learning',4,2),
('Deep Learning',4,7),
('Digital Electronics',3,3),
('Signals and Systems',3,8),
('Thermodynamics',4,4),
('Fluid Mechanics',4,4),
('Structural Engineering',4,5),
('Concrete Technology',3,5);

----------------------------------------------------------
-- INSERT INTO ENROLLMENTS
----------------------------------------------------------

INSERT INTO enrollments
(student_id,course_id,semester,grade)
VALUES
(1,1,'Semester 5','A'),
(1,2,'Semester 5','A+'),
(1,3,'Semester 6','A'),

(2,3,'Semester 6','A+'),
(2,4,'Semester 6','A'),

(3,5,'Semester 5','B+'),
(3,6,'Semester 6','A'),

(4,1,'Semester 5','A'),
(4,2,'Semester 5','A'),

(5,7,'Semester 5','B'),

(6,3,'Semester 6','A'),
(6,4,'Semester 6','A+'),

(7,3,'Semester 6','A'),
(7,4,'Semester 6','A'),

(8,5,'Semester 5','B+'),

(9,9,'Semester 7','A'),

(10,1,'Semester 5','A+'),
(10,3,'Semester 6','A'),

(11,7,'Semester 6','B'),

(12,3,'Semester 6','A'),

(13,2,'Semester 5','A'),

(14,6,'Semester 5','B+'),

(15,3,'Semester 6','A'),
(15,4,'Semester 6','A+'),
(15,1,'Semester 5','A');