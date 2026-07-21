--------------------------------------------------------
-- Insert Customers
--------------------------------------------------------

INSERT INTO customers
(customer_name, city, email, registration_date)
VALUES
('Aarav Sharma', 'Mumbai', 'aarav.sharma@gmail.com', '2025-01-10'),
('Priya Patel', 'Pune', 'priya.patel@gmail.com', '2025-01-15'),
('Rahul Singh', 'Nagpur', 'rahul.singh@gmail.com', '2025-02-05'),
('Sneha Joshi', 'Delhi', 'sneha.joshi@gmail.com', '2025-02-18'),
('Rohan Verma', 'Hyderabad', 'rohan.verma@gmail.com', '2025-03-01'),
('Ananya Kulkarni', 'Pune', 'ananya.k@gmail.com', '2025-03-12'),
('Vivek Patil', 'Mumbai', 'vivek.patil@gmail.com', '2025-03-20'),
('Neha Gupta', 'Nagpur', 'neha.gupta@gmail.com', '2025-04-02'),
('Karan Mehta', 'Ahmedabad', 'karan.mehta@gmail.com', '2025-04-08'),
('Isha Kapoor', 'Bengaluru', 'isha.kapoor@gmail.com', '2025-04-15'),
('Harsh Bansal', 'Delhi', 'harsh.b@gmail.com', '2025-05-01'),
('Meera Naik', 'Goa', 'meera.naik@gmail.com', '2025-05-10');

--------------------------------------------------------
-- Insert Products
--------------------------------------------------------

INSERT INTO products
(product_name, category, price)
VALUES
('Laptop', 'Electronics', 75000),
('Gaming Laptop', 'Electronics', 98000),
('Wireless Mouse', 'Accessories', 900),
('Mechanical Keyboard', 'Accessories', 3200),
('Monitor 24 Inch', 'Electronics', 14500),
('External SSD', 'Storage', 6200),
('USB Flash Drive', 'Storage', 700),
('Office Chair', 'Furniture', 8200),
('Study Table', 'Furniture', 11500),
('Webcam HD', 'Accessories', 2800),
('Printer', 'Electronics', 13000),
('Noise Cancelling Headphones', 'Accessories', 8900);

--------------------------------------------------------
-- Insert Orders
--------------------------------------------------------

INSERT INTO orders
(customer_id, product_id, quantity, order_date)
VALUES

(1,1,1,'2025-05-01'),
(1,3,2,'2025-05-03'),

(2,2,1,'2025-05-02'),
(2,4,1,'2025-05-10'),
(2,6,2,'2025-05-12'),

(3,3,4,'2025-05-04'),

(4,5,1,'2025-05-06'),
(4,12,1,'2025-05-15'),

(5,8,2,'2025-05-08'),

(6,9,1,'2025-05-09'),
(6,4,2,'2025-05-16'),

(7,2,1,'2025-05-11'),

(8,7,5,'2025-05-13'),

(9,10,2,'2025-05-17'),

(10,11,1,'2025-05-18'),
(10,6,1,'2025-05-20'),

(11,1,1,'2025-05-22'),

(12,3,3,'2025-05-24'),

(5,12,1,'2025-05-26'),

(7,5,1,'2025-05-27');