DROP TABLE IF EXISTS fact_treatment CASCADE;
DROP TABLE IF EXISTS dim_patient CASCADE;
DROP TABLE IF EXISTS dim_city CASCADE;
DROP TABLE IF EXISTS dim_state CASCADE;
DROP TABLE IF EXISTS dim_doctor CASCADE;
DROP TABLE IF EXISTS dim_department CASCADE;
DROP TABLE IF EXISTS dim_hospital CASCADE;
DROP TABLE IF EXISTS dim_date CASCADE;

CREATE TABLE dim_state
(
    state_id SERIAL PRIMARY KEY,
    state_name VARCHAR(50)
);

CREATE TABLE dim_city
(
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50),
    state_id INT REFERENCES dim_state(state_id)
);

CREATE TABLE dim_patient
(
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city_id INT REFERENCES dim_city(city_id)
);

CREATE TABLE dim_department
(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE dim_doctor
(
    doctor_id SERIAL PRIMARY KEY,
    doctor_name VARCHAR(100),
    department_id INT REFERENCES dim_department(department_id)
);

CREATE TABLE dim_hospital
(
    hospital_id SERIAL PRIMARY KEY,
    hospital_name VARCHAR(100)
);

CREATE TABLE dim_date
(
    date_id SERIAL PRIMARY KEY,
    treatment_date DATE,
    month_name VARCHAR(20),
    year INT
);

CREATE TABLE fact_treatment
(
    treatment_id SERIAL PRIMARY KEY,

    patient_id INT REFERENCES dim_patient(patient_id),

    doctor_id INT REFERENCES dim_doctor(doctor_id),

    hospital_id INT REFERENCES dim_hospital(hospital_id),

    date_id INT REFERENCES dim_date(date_id),

    treatment_cost NUMERIC(10,2),

    treatment_count INT
);