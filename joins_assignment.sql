CREATE DATABASE hospital_join_demo;
USE hospital_join_demo;

CREATE TABLE patients(
patient_id INT primary key ,
patient_name varchar(50),
age INT,
gender varchar (50),
doctor_id INT
);

INSERT INTO patients
(patient_id, patient_name, age, gender, doctor_id)
VALUES
(1, 'Sakshi', 23, 'Female', 1),
(2, 'Riya', 25, 'Female', 2),
(3, 'Amit', 35, 'Male', 3),
(4, 'Rahul', 40, 'Male', NULL),
(5, 'Sneha', 30, 'Female', 1);

CREATE TABLE doctors(
doctor_id INT primary key ,
doctor_name varchar (50),
specialization varchar(100),
consultation_fee int
);

INSERT INTO doctors
(doctor_id, doctor_name, specialization, consultation_fee)
VALUES
(1, 'Dr. Amit Sharma', 'Cardiologist', 1500),
(2, 'Dr. Priya Patil', 'Dermatologist', 1200),
(3, 'Dr. Rahul Joshi', 'Orthopedic', 1800),
(4, 'Dr. Sneha Kulkarni', 'Neurologist', 2000),
(5, 'Dr. Neha Deshmukh', 'Pediatrician', 1000);

SELECT * FROM patients;
SELECT * FROM doctors;

-- 3.	Display patient names along with their assigned doctor names using an INNER JOIN.
SELECT p.patient_name, d.doctor_name
FROM patients AS p
INNER JOIN doctors AS d
ON p.doctor_id = d.doctor_id;

-- 4.	Display patient names, doctor names, and consultation fees using an INNER JOIN.
SELECT
p.patient_name,d.doctor_name,d.consultation_fee
FROM patients AS p
INNER JOIN doctors AS d
ON p.doctor_id = d.doctor_id;


-- 5.	Display all patients along with their doctor information, including patients who have not been assigned a doctor.
SELECT
    p.patient_name,
    d.doctor_name,
    d.specialization
FROM patients p
LEFT JOIN doctors d
ON p.doctor_id = d.doctor_id;

-- 6.	Display all doctors along with their patient information, including doctors who currently have no patients.
SELECT
    d.doctor_name,
    p.patient_name
FROM doctors AS d
left join patients AS p
ON d.doctor_id = p.doctor_id;

-- 7.	Display all patients and all doctors in a single result, including patients without doctors and doctors without patients.
SELECT
    p.patient_name,
    d.doctor_name
FROM patients p
LEFT JOIN doctors d
ON p.doctor_id = d.doctor_id

UNION

SELECT
    p.patient_name,
    d.doctor_name
FROM patients p
RIGHT JOIN doctors d
ON p.doctor_id = d.doctor_id;

-- 8.	Find patients who have not been assigned to any doctor.
SELECT
    patient_name
FROM patients
WHERE doctor_id IS NULL;

-- 9.	Find doctors who do not currently have any patients.
SELECT
    d.doctor_name
FROM doctors d
LEFT JOIN patients p
ON d.doctor_id = p.doctor_id
WHERE p.patient_id IS NULL;

-- 10.	Display each doctor along with the total number of patients assigned to that doctor.
SELECT
    d.doctor_name,
    COUNT(p.patient_id) AS total_patients
FROM doctors d
LEFT JOIN patients p
ON d.doctor_id = p.doctor_id
GROUP BY d.doctor_id, d.doctor_name;

-- 11.	Display each doctor along with the total consultation fees collected from their patients.
SELECT
    d.doctor_name,
    SUM(d.consultation_fee) AS total_fees
FROM doctors d
LEFT JOIN patients p
ON d.doctor_id = p.doctor_id
GROUP BY d.doctor_id, d.doctor_name;

-- 12.	Find doctors whose total consultation fees are greater than 5000.
SELECT
d.doctor_name,
sum(d.consultation_fee) AS total_fees
from doctors d
inner join patients p
ON d.doctor_id = p.doctor_id
group by d.doctor_id, p.doctor_id
HAVING sum(consultation_fee) > 5000;

-- 13.	Create another table named medical_tests with suitable columns and establish an appropriate relationship with the patients table.
CREATE TABLE medical_tests (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    test_name VARCHAR(100),
    test_cost DECIMAL(10,2),

    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id)
);
-- 14.	Insert five records into the medical_tests table and display patient names along with their test names using an INNER JOIN.
INSERT INTO medical_tests
(patient_id, test_name, test_cost)
VALUES
(1, 'Blood Test', 500),
(1, 'ECG', 1000),
(2, 'Skin Test', 800),
(3, 'X-Ray', 1200),
(5, 'Blood Test', 500);

SELECT * FROM medical_tests;

SELECT
p.patient_name,
m.test_name
FROM patients p
INNER JOIN medical_tests AS m
ON p.patient_id = m.patient_id;


-- 15.	Display patient names, doctor names, and medical test names by joining all three related tables.
SELECT
p.patient_name,
d.doctor_name,
m.test_name
FROM patients p
INNER JOIN doctors d
ON p.doctor_id = d.doctor_id
INNER JOIN medical_tests m
ON p.patient_id = m.patient_id;


-- 16.	Display all patients along with their medical test information, including patients who have not undergone any medical test.
SELECT
    p.patient_name,
    m.test_name,
    m.test_cost
FROM patients p
LEFT JOIN medical_tests m
ON p.patient_id = m.patient_id;

-- 17.	Find patients who have undergone more than one medical test.
SELECT
    p.patient_name,
    COUNT(m.test_id) AS total_tests
FROM patients p
INNER JOIN medical_tests m
ON p.patient_id = m.patient_id
GROUP BY p.patient_id, p.patient_name
HAVING COUNT(m.test_id) > 1;

-- 18.	Display doctors and their patients in descending order of consultation fees
SELECT
    d.doctor_name,
    p.patient_name,
    d.consultation_fee
FROM doctors d
INNER JOIN patients p
ON d.doctor_id = p.doctor_id
ORDER BY d.consultation_fee DESC;

-- 19.	Find the doctor who has the highest-paid consultation among all patient appointments.
SELECT
    d.doctor_name,
    p.patient_name,
    d.consultation_fee
FROM doctors d
INNER JOIN patients p
ON d.doctor_id = p.doctor_id
ORDER BY d.consultation_fee DESC
LIMIT 1;

-- 20.	Generate a complete hospital report displaying patient name, doctor name, specialization, test name, consultation fee, and test cost by joining the required tables.
SELECT
    p.patient_name,
    d.doctor_name,
    d.specialization,
    m.test_name,
    d.consultation_fee,
    m.test_cost
FROM patients p
LEFT JOIN doctors d
ON p.doctor_id = d.doctor_id
LEFT JOIN medical_tests m
ON p.patient_id = m.patient_id;



