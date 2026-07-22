INSERT INTO dim_state(state_name)
VALUES
('Maharashtra'),
('Delhi');

INSERT INTO dim_city(city_name,state_id)
VALUES
('Nagpur',1),
('Pune',1),
('Mumbai',1),
('Delhi',2);

INSERT INTO dim_patient(patient_name,age,gender,city_id)
VALUES
('Aarav',25,'Male',1),
('Priya',28,'Female',2),
('Rahul',40,'Male',3),
('Sneha',32,'Female',4);

INSERT INTO dim_department(department_name)
VALUES
('Cardiology'),
('Neurology'),
('Orthopedics');

INSERT INTO dim_doctor(doctor_name,department_id)
VALUES
('Dr. Sharma',1),
('Dr. Patel',2),
('Dr. Singh',3);

INSERT INTO dim_hospital(hospital_name)
VALUES
('City Hospital'),
('Apollo Care');

INSERT INTO dim_date(treatment_date,month_name,year)
VALUES
('2026-01-15','January',2026),
('2026-02-18','February',2026),
('2026-03-20','March',2026);

INSERT INTO fact_treatment
(patient_id,doctor_id,hospital_id,date_id,treatment_cost,treatment_count)
VALUES
(1,1,1,1,12000,1),
(2,2,2,2,18000,1),
(3,3,1,3,9000,1),
(4,1,2,2,15000,1);