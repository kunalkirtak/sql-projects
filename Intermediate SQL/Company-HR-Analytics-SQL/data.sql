-------------------------------------------------------
-- Insert Departments
-------------------------------------------------------

INSERT INTO departments (department_name, location)
VALUES
('AI & ML', 'Pune'),
('Software Development', 'Bengaluru'),
('Human Resources', 'Mumbai'),
('Finance', 'Delhi'),
('Marketing', 'Hyderabad');

-------------------------------------------------------
-- Insert Employees
-------------------------------------------------------

INSERT INTO employees
(first_name,last_name,department_id,designation,gender,city,salary,experience_years)

VALUES

('Aarav','Sharma',1,'ML Engineer','Male','Pune',95000,3),

('Priya','Patel',1,'Data Scientist','Female','Mumbai',120000,6),

('Rahul','Singh',2,'Backend Developer','Male','Nagpur',82000,4),

('Sneha','Joshi',2,'Frontend Developer','Female','Pune',78000,2),

('Rohan','Verma',3,'HR Executive','Male','Delhi',55000,1),

('Ananya','Kulkarni',1,'AI Engineer','Female','Pune',135000,7),

('Vivek','Patil',2,'Python Developer','Male','Bengaluru',90000,5),

('Neha','Gupta',4,'Accountant','Female','Mumbai',70000,3),

('Karan','Mehta',5,'Marketing Executive','Male','Ahmedabad',65000,2),

('Isha','Kapoor',1,'Research Engineer','Female','Pune',145000,8),

('Aditya','Deshmukh',2,'QA Engineer','Male','Pune',72000,2),

('Pooja','Yadav',3,'HR Manager','Female','Delhi',85000,9),

('Harsh','Bansal',5,'Digital Marketer','Male','Hyderabad',78000,4),

('Nikita','More',4,'Financial Analyst','Female','Nagpur',82000,5),

('Arjun','Mishra',1,'Computer Vision Engineer','Male','Lucknow',118000,6),

('Meera','Naik',3,'Talent Acquisition','Female','Goa',62000,3),

('Yash','Rao',2,'DevOps Engineer','Male','Bengaluru',98000,6),

('Divya','Shinde',4,'Senior Accountant','Female','Mumbai',92000,7),

('Sahil','Chauhan',5,'Marketing Analyst','Male','Delhi',68000,3),

('Ritika','Jain',1,'NLP Engineer','Female','Jaipur',128000,5),

('Akash','Patil',2,'Software Engineer','Male','Pune',85000,4),

('Simran','Kaur',3,'HR Coordinator','Female','Chandigarh',58000,2),

('Manish','Gupta',4,'Finance Manager','Male','Delhi',110000,10),

('Kavya','Nair',5,'Brand Manager','Female','Kochi',96000,8),

('Rakesh','Sharma',1,'Senior ML Engineer','Male','Pune',155000,10);