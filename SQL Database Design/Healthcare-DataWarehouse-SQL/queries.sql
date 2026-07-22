---------------------------------------------------
-- View Fact Table
---------------------------------------------------

SELECT *
FROM fact_treatment;

---------------------------------------------------
-- View Patients
---------------------------------------------------

SELECT *
FROM dim_patient;

---------------------------------------------------
-- Total Revenue
---------------------------------------------------

SELECT
SUM(treatment_cost) AS total_revenue
FROM fact_treatment;

---------------------------------------------------
-- Revenue by Hospital
---------------------------------------------------

SELECT
h.hospital_name,
SUM(f.treatment_cost) AS revenue

FROM fact_treatment f

JOIN dim_hospital h

ON f.hospital_id=h.hospital_id

GROUP BY h.hospital_name;

---------------------------------------------------
-- Treatments by Department
---------------------------------------------------

SELECT
d.department_name,
COUNT(*) AS total_treatments

FROM fact_treatment f

JOIN dim_doctor doc

ON f.doctor_id=doc.doctor_id

JOIN dim_department d

ON doc.department_id=d.department_id

GROUP BY d.department_name;

---------------------------------------------------
-- Revenue by Month
---------------------------------------------------

SELECT

dt.month_name,

SUM(f.treatment_cost)

FROM fact_treatment f

JOIN dim_date dt

ON f.date_id=dt.date_id

GROUP BY dt.month_name;

---------------------------------------------------
-- Patients with City and State
---------------------------------------------------

SELECT

p.patient_name,

c.city_name,

s.state_name

FROM dim_patient p

JOIN dim_city c

ON p.city_id=c.city_id

JOIN dim_state s

ON c.state_id=s.state_id;

---------------------------------------------------
-- Doctor Wise Revenue
---------------------------------------------------

SELECT

doc.doctor_name,

SUM(f.treatment_cost)

FROM fact_treatment f

JOIN dim_doctor doc

ON f.doctor_id=doc.doctor_id

GROUP BY doc.doctor_name;