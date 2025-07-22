--total_patients
SELECT COUNT(DISTINCT patient_nbr) AS total_patients from patients;
--total hospital_visits
SELECT COUNT(*) AS total_visits FROM hospital_visitsnew;

-- Readmission rate (<30 days)
SELECT 
    COUNT(*)*1.0/(SELECT COUNT(*) FROM hospital_visitsnew) AS readmission_rate
FROM hospital_visitsnew
WHERE readmitted ='<30';

SELECT
    p.age,
    COUNT(*) AS toatal_visits,
    SUM(CASE WHEN h.readmitted ='<30' THEN 1 ELSE 0 END) AS readmissions,
    ROUND(100.0*SUM(CASE WHEN h.readmitted ='<30' THEN 1 ELSE 0 END)/COUNT(*),2) AS readmission_pct
FROM hospital_visitsnew h
JOIN patients p ON h.patient_nbr = p.patient_nbr
GROUP BY p.age
ORDER BY readmission_pct DESC;

--C. Top 5 Diagnoses Among Readmitted Patients
SELECT diag_1, COUNT(*) AS readmit_count
FROM hospital_visitsnew
WHERE readmitted = '<30'
GROUP BY diag_1
ORDER BY readmit_count DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
--D. Average Length of Stay by Admission Type

SELECT admission_type_id, AVG(time_in_hospital) AS avg_stay
FROM hospital_visitsnew
GROUP BY admission_type_id
ORDER BY avg_stay DESC;

--E. Medications vs. Readmission Correlation
SELECT 
    diabetesmed,
    COUNT(*) AS total,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS readmitted,
    ROUND(100.0 * SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) / COUNT(*), 2) AS readmit_pct
FROM hospital_visitsnew
GROUP BY diabetesmed;
