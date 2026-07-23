-- ============================================
-- Sample Data
-- ============================================

------------------------------------------------
-- Insert Users
------------------------------------------------

INSERT INTO users (full_name, city, signup_date)
VALUES
('Aarav Sharma','Mumbai','2026-01-02'),
('Priya Patel','Pune','2026-01-05'),
('Rahul Singh','Nagpur','2026-01-08'),
('Sneha Joshi','Delhi','2026-01-10'),
('Rohan Verma','Bengaluru','2026-01-12'),
('Ananya Kulkarni','Pune','2026-01-15'),
('Vivek Patil','Hyderabad','2026-01-18'),
('Neha Gupta','Mumbai','2026-01-20'),
('Karan Mehta','Ahmedabad','2026-01-22'),
('Isha Kapoor','Jaipur','2026-01-25'),
('Harsh Bansal','Delhi','2026-02-01'),
('Pooja Yadav','Nagpur','2026-02-03'),
('Aditya Deshmukh','Pune','2026-02-05'),
('Nikita More','Mumbai','2026-02-08'),
('Meera Naik','Goa','2026-02-10');

------------------------------------------------
--user events

INSERT INTO user_events
(user_id,event_type,event_time,session_id,device)

VALUES

(1,'login','2026-02-01 09:00:00','S001','Mobile'),
(1,'search','2026-02-01 09:03:00','S001','Mobile'),
(1,'purchase','2026-02-01 09:10:00','S001','Mobile'),

(2,'login','2026-02-01 10:00:00','S002','Desktop'),
(2,'search','2026-02-01 10:02:00','S002','Desktop'),
(2,'logout','2026-02-01 10:15:00','S002','Desktop'),

(3,'login','2026-02-01 11:20:00','S003','Mobile'),
(3,'purchase','2026-02-01 11:45:00','S003','Mobile'),

(4,'login','2026-02-02 09:10:00','S004','Tablet'),
(4,'search','2026-02-02 09:15:00','S004','Tablet'),

(5,'login','2026-02-02 10:30:00','S005','Desktop'),
(5,'purchase','2026-02-02 10:40:00','S005','Desktop'),

(6,'login','2026-02-02 11:15:00','S006','Mobile'),
(6,'logout','2026-02-02 11:40:00','S006','Mobile'),

(7,'login','2026-02-03 08:50:00','S007','Desktop'),
(7,'search','2026-02-03 09:00:00','S007','Desktop'),
(7,'purchase','2026-02-03 09:20:00','S007','Desktop'),

(8,'login','2026-02-03 10:30:00','S008','Mobile'),
(8,'search','2026-02-03 10:45:00','S008','Mobile'),

(9,'login','2026-02-03 11:10:00','S009','Desktop'),
(9,'logout','2026-02-03 11:30:00','S009','Desktop'),

(10,'login','2026-02-04 09:20:00','S010','Tablet'),
(10,'purchase','2026-02-04 09:45:00','S010','Tablet'),

(11,'login','2026-02-04 10:15:00','S011','Mobile'),
(11,'search','2026-02-04 10:20:00','S011','Mobile'),

(12,'login','2026-02-04 11:00:00','S012','Desktop'),
(12,'purchase','2026-02-04 11:25:00','S012','Desktop'),

(13,'login','2026-02-05 09:05:00','S013','Mobile'),
(13,'search','2026-02-05 09:12:00','S013','Mobile'),
(13,'purchase','2026-02-05 09:25:00','S013','Mobile'),

(14,'login','2026-02-05 10:40:00','S014','Desktop'),
(14,'logout','2026-02-05 10:55:00','S014','Desktop'),

(15,'login','2026-02-05 11:15:00','S015','Tablet'),
(15,'search','2026-02-05 11:20:00','S015','Tablet'),

(1,'login','2026-02-06 09:00:00','S016','Mobile'),
(1,'purchase','2026-02-06 09:15:00','S016','Mobile'),

(2,'login','2026-02-06 09:30:00','S017','Desktop'),
(2,'search','2026-02-06 09:40:00','S017','Desktop'),

(3,'login','2026-02-06 10:10:00','S018','Mobile'),
(3,'logout','2026-02-06 10:35:00','S018','Mobile'),

(4,'login','2026-02-07 08:45:00','S019','Tablet'),
(4,'purchase','2026-02-07 09:05:00','S019','Tablet'),

(5,'login','2026-02-07 09:30:00','S020','Desktop'),
(5,'search','2026-02-07 09:45:00','S020','Desktop');