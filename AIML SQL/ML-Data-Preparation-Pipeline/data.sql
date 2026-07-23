-- =====================================================
-- Raw customer dataset for AI/ML preprocessing
-- =====================================================

INSERT INTO customer_data
(customer_name,
 age,
 gender,
 city,
 annual_income,
 spending_score,
 membership_type,
 last_purchase_amount,
 total_orders,
 days_since_last_purchase,
 preferred_device,
 email,
 phone,
 will_purchase)

VALUES

-------------------------------------------------------
-- Clean Records
-------------------------------------------------------

('Aarav Sharma',25,'Male','Mumbai',650000,82,'Gold',12500,15,5,'Mobile','aarav@gmail.com','9876543210',1),

('Priya Patel',29,'Female','Pune',820000,91,'Gold',21000,21,2,'Laptop','priya@gmail.com','9876543211',1),

('Rahul Singh',35,'Male','Nagpur',540000,61,'Silver',8000,11,14,'Desktop','rahul@gmail.com','9876543212',0),

('Sneha Joshi',27,'Female','Delhi',910000,95,'Platinum',32000,27,1,'Laptop','sneha@gmail.com','9876543213',1),

('Rohan Verma',31,'Male','Pune',480000,44,'Silver',4200,7,20,'Mobile','rohan@gmail.com','9876543214',0),

('Ananya Kulkarni',24,'Female','Mumbai',760000,88,'Gold',18500,19,4,'Tablet','ananya@gmail.com','9876543215',1),

('Vivek Patil',37,'Male','Hyderabad',990000,78,'Platinum',25000,24,6,'Laptop','vivek@gmail.com','9876543216',1),

('Neha Gupta',30,'Female','Bengaluru',620000,59,'Silver',9000,10,17,'Desktop','neha@gmail.com','9876543217',0),

('Karan Mehta',40,'Male','Ahmedabad',450000,35,'Basic',2500,5,40,'Mobile','karan@gmail.com','9876543218',0),

('Isha Kapoor',26,'Female','Jaipur',870000,93,'Gold',28000,22,3,'Laptop','isha@gmail.com','9876543219',1);

-------------------------------------------------------
-- Missing Annual Income
-------------------------------------------------------

INSERT INTO customer_data
(customer_name,age,gender,city,annual_income,spending_score,
membership_type,last_purchase_amount,total_orders,
days_since_last_purchase,preferred_device,email,phone,will_purchase)

VALUES

('Arjun Mishra',28,'Male','Lucknow',NULL,74,'Silver',14000,14,9,'Mobile','arjun@gmail.com','9876543220',1),

('Divya Shinde',33,'Female','Pune',NULL,48,'Basic',5000,6,25,'Desktop','divya@gmail.com','9876543221',0);

-------------------------------------------------------
-- Missing Spending Score
-------------------------------------------------------

INSERT INTO customer_data
(customer_name,age,gender,city,annual_income,spending_score,
membership_type,last_purchase_amount,total_orders,
days_since_last_purchase,preferred_device,email,phone,will_purchase)

VALUES

('Yash Rao',29,'Male','Nagpur',670000,NULL,'Gold',16000,15,8,'Laptop','yash@gmail.com','9876543222',1),

('Meera Naik',41,'Female','Goa',720000,NULL,'Silver',11000,13,11,'Tablet','meera@gmail.com','9876543223',1);

-------------------------------------------------------
-- Missing Purchase Amount
-------------------------------------------------------

INSERT INTO customer_data
(customer_name,age,gender,city,annual_income,spending_score,
membership_type,last_purchase_amount,total_orders,
days_since_last_purchase,preferred_device,email,phone,will_purchase)

VALUES

('Harsh Bansal',34,'Male','Delhi',690000,68,'Silver',NULL,12,18,'Desktop','harsh@gmail.com','9876543224',0),

('Pooja Yadav',27,'Female','Nagpur',800000,87,'Gold',NULL,18,4,'Laptop','pooja@gmail.com','9876543225',1);

-------------------------------------------------------
-- Missing Device
-------------------------------------------------------

INSERT INTO customer_data
(customer_name,age,gender,city,annual_income,spending_score,
membership_type,last_purchase_amount,total_orders,
days_since_last_purchase,preferred_device,email,phone,will_purchase)

VALUES

('Sahil Chauhan',32,'Male','Pune',560000,55,'Silver',7600,8,19,NULL,'sahil@gmail.com','9876543226',0),

('Ritika Jain',23,'Female','Mumbai',780000,90,'Gold',21000,20,2,NULL,'ritika@gmail.com','9876543227',1);

-------------------------------------------------------
-- Missing Email
-------------------------------------------------------

INSERT INTO customer_data
(customer_name,age,gender,city,annual_income,spending_score,
membership_type,last_purchase_amount,total_orders,
days_since_last_purchase,preferred_device,email,phone,will_purchase)

VALUES

('Aditya Deshmukh',36,'Male','Pune',630000,63,'Silver',9800,10,12,'Mobile',NULL,'9876543228',0),

('Nikita More',28,'Female','Nagpur',850000,92,'Gold',26000,23,3,'Laptop',NULL,'9876543229',1);

-------------------------------------------------------
-- Missing Phone Number
-------------------------------------------------------

INSERT INTO customer_data
(customer_name,age,gender,city,annual_income,spending_score,
membership_type,last_purchase_amount,total_orders,
days_since_last_purchase,preferred_device,email,phone,will_purchase)

VALUES

('Amit Kulkarni',38,'Male','Mumbai',710000,73,'Gold',17500,16,6,'Desktop','amit@gmail.com',NULL,1),

('Kavya Sharma',24,'Female','Delhi',600000,66,'Silver',9200,11,15,'Mobile','kavya@gmail.com',NULL,0);

-------------------------------------------------------
-- Intentional Duplicate Records
-------------------------------------------------------

INSERT INTO customer_data
(customer_name,age,gender,city,annual_income,spending_score,
membership_type,last_purchase_amount,total_orders,
days_since_last_purchase,preferred_device,email,phone,will_purchase)

VALUES

('Rahul Singh',35,'Male','Nagpur',540000,61,'Silver',8000,11,14,'Desktop','rahul@gmail.com','9876543212',0),

('Priya Patel',29,'Female','Pune',820000,91,'Gold',21000,21,2,'Laptop','priya@gmail.com','9876543211',1),

('Rohan Verma',31,'Male','Pune',480000,44,'Silver',4200,7,20,'Mobile','rohan@gmail.com','9876543214',0);

-------------------------------------------------------
-- Verify Raw Dataset
-------------------------------------------------------

SELECT *
FROM customer_data
ORDER BY customer_id;