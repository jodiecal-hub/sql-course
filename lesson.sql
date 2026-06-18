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
	,DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
	,ps.Tariff
FROM
	PatientStay ps
WHERE ps.Hospital IN ('kingston', 'pruh')
--	AND ps.Ward LIKE '%surgery'
--	AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-02-29'
ORDER BY ps.Tariff DESC, ps.PatientId DESC
--SELECT
	--DATEADD(WEEK, -2, '2026-06-18')

SELECT 
    ps.Hospital
	 , ps.Ward
     , COUNT (*) as NumberOfPatients
	 , SUM(ps.Tariff) AS TotalTariff
	 , AVG(ps.Tariff) AS AverageTariff
FROM 
     PatientStay ps
GROUP BY ps.Hospital
, ps.Ward
ORDER BY TotalTariff DESC

select * from PatientStay ps

select * from DimHospital

SELECT
    ps.PatientId
	, ps.Hospital
    , h.Hospital
    , h.HospitalType
FROM
    PatientStay ps
LEFT JOIN
    DimHospitalBad h
ON ps.Hospital = h.Hospital

--AI Query

SELECT
    ps.PatientId
    ,ps.Hospital
    ,ps.Ward
    ,ps.AdmittedDate
    ,ps.DischargeDate
    ,ps.Tariff
    ,DATEADD(MONTH, 3, ps.DischargeDate) AS AppointmentDate
	,DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
	,ps.Tariff
	-- CREATE A COLUMN Budget 50% higher than the Tariff
	,ps.Tariff * 1.5 AS Budget
FROM
    PatientStay ps
WHERE
    ps.Ward LIKE '%ophthalm%'  -- or '%opthom%' if the spelling is inconsistent
ORDER BY
    ps.AdmittedDate;

--Airports in the UK

	SELECT
    id,
    ident,
    name,
    iata_code,
    type,
    municipality,
    elevation_ft
FROM
    airports
WHERE
    iso_country = 'GB'
ORDER BY
    name;
