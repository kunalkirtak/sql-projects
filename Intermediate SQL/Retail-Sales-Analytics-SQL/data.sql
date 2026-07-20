INSERT INTO customers (customer_name, city) VALUES
('Aarav Sharma','Mumbai'),
('Priya Patel','Pune'),
('Rahul Singh','Nagpur'),
('Sneha Joshi','Delhi'),
('Ananya Kulkarni','Pune'),
('Rohan Verma','Nagpur'),
('Isha Kapoor','Jaipur'),
('Vivek Patil','Mumbai'),
('Neha Gupta','Hyderabad'),
('Harsh Bansal','Delhi');

INSERT INTO products (product_name,category,price) VALUES
('Laptop','Electronics',70000),
('Keyboard','Accessories',1500),
('Mouse','Accessories',800),
('Monitor','Electronics',12000),
('SSD','Storage',4500),
('RAM','Storage',3500),
('Printer','Office',15000),
('Router','Networking',3000);

INSERT INTO sales
(customer_id,product_id,quantity,sale_date,payment_method)
VALUES
(1,1,1,'2026-01-10','UPI'),
(2,2,2,'2026-01-11','Card'),
(3,3,3,'2026-01-12','Cash'),
(4,4,1,'2026-01-15','Card'),
(5,5,2,'2026-01-17','UPI'),
(6,6,2,'2026-01-20','Cash'),
(7,7,1,'2026-01-22','Card'),
(8,8,3,'2026-01-25','UPI'),
(9,5,1,'2026-02-01','Card'),
(10,1,1,'2026-02-03','Cash'),
(2,4,2,'2026-02-05','UPI'),
(5,2,4,'2026-02-08','Card'),
(3,6,5,'2026-02-10','UPI'),
(1,5,2,'2026-02-12','Cash'),
(8,3,6,'2026-02-15','Card');