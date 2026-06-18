/*
My First Sequel Lesson
Name: Jodie Callaghan
Date: 18-06-2026
*/

--Looking at surgical activity--

SELECT
	ps.PatientId
	
	,ps.Hospital
	
	,ps.Ward
	
	,DATEADD(WEEK, -2, ps.AdmittedDate) AS ReminderDate
	
	,ps.AdmittedDate
	
	,ps.DischargeDate
	
	,ps.Tariff
FROM
	PatientStay ps
WHERE ps.Hospital IN ('kingston', 'pruh')
	AND ps.Ward LIKE '%surgery'
	AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-02-29'

SELECT
	DATEADD(WEEK, -2, '2026-06-18')