INSERT INTO customers (customer_name, city, email) VALUES
('Aarav Sharma','Mumbai','aarav@gmail.com'),
('Priya Patel','Pune','priya@gmail.com'),
('Rahul Singh','Nagpur',NULL),
('Sneha Joshi','Delhi','sneha@gmail.com'),
('Rohan Verma','Nagpur',NULL),
('Ananya Kulkarni','Pune','ananya@gmail.com'),
('Vivek Patil','Mumbai','vivek@gmail.com'),
('Neha Gupta','Hyderabad','neha@gmail.com'),
('Karan Mehta','Ahmedabad',NULL),
('Isha Kapoor','Jaipur','isha@gmail.com');

INSERT INTO orders
(customer_id, product_name, quantity, price, discount, order_status, payment_method)
VALUES
(1,'Laptop',1,75000,5000,'Delivered','UPI'),
(2,'Keyboard',2,2000,NULL,'Pending','Card'),
(3,'Mouse',1,800,NULL,'Pending','Cash'),
(4,'Monitor',1,12000,1000,'Delivered','Card'),
(5,'Printer',1,15000,NULL,'Cancelled','Cash'),
(6,'SSD',2,4500,300,'Delivered','UPI'),
(7,'RAM',2,3500,NULL,'Pending','UPI'),
(8,'Webcam',1,2500,NULL,'Delivered','Card'),
(9,'Headphones',1,3000,500,'Delivered','Cash'),
(10,'Router',1,2800,NULL,'Pending','UPI');