-- Task 22: Show the number of admissions per patient

SELECT 
    patient_id, count(*) as total_admissions
FROM admissions    
GROUP BY patient_id;


-- Task 23:Show the first name, last name, and admission date of patients who were admitted more than once.

SELECT 
    p.first_name,
    p.last_name,
    a.admission_date
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
WHERE a.patient_id IN (
    SELECT patient_id
    FROM admissions
    GROUP BY patient_id
    HAVING COUNT(*) > 1
);



-- Task 24: Show the first name, last name, and number of admissions for each patient.
SELECT 
    p.first_name,
    p.last_name,
    COUNT(a.patient_id) AS total_admissions
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
GROUP BY p.patient_id;



-- Task 25: Show the first name, last name, and last admission date for each patient.
 SELECT 
    p.first_name,
    p.last_name,
    MAX(a.admission_date) AS last_admission_date
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
GROUP BY p.patient_id;




-- Task 26: Show the number of patients admitted in each year
select 
    year(admission_date) as admission_year, 
    count(*) as total_patients
from admissions
group by year(admission_date)
order by admission_year;



-- Task 27: Show the first name, last name, and admission count for patients who were admitted in 2021
SELECT 
    p.first_name,
    p.last_name,
    COUNT(a.patient_id) AS total_admissions
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
WHERE YEAR(a.admission_date) = 2021
GROUP BY p.patient_id;