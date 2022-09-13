--No.1
SELECT FacFirstName, FacLastName, FacSalary
FROM Faculty
WHERE YEAR(FacHireDate) >= 1995 AND YEAR(FacHireDate) <= 1997
AND FacSalary >= 35.00 AND FacSalary <= 40.00

--No.2
SELECT FacFirstName, FacLastName, FacCity, FacSupervisor
FROM Faculty
WHERE FacSupervisor IS NULL OR FacCity = 'SEATTLE'

--No.3
SELECT FacFirstName, FacLastName, FacCity, FacSupervisor
FROM Faculty
WHERE FacSupervisor IS NOT NULL AND FacCity != 'SEATTLE'