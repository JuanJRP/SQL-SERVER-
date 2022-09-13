select * from Student cross join Enrollment

select * from Offering join Course on Offering.CourseNo = Course.CourseNo 

select * from Offering join course on offering.OffLocation = 'BLM302'

select * from Faculty left outer join offering on Faculty.FacSSN = Offering.FacSSN

select * from faculty where FacSalary <= 40 union select * from faculty where FacSalary > 40

SELECT * FROM Faculty EXCEPT select * from Faculty WHERE FacSalary >= 70

SELECT * FROM Faculty where FacSalary >30 intersect select * from Faculty WHERE FacSalary < 80

SELECT StdMajor, AVG(StdGPA)as promedio
FROM Student
GROUP BY StdMajor
order by promedio asc

SELECT OfferNo, AVG(EnrGrade)as promedio
FROM Enrollment
GROUP BY OfferNo
order by promedio desc

SELECT stdClass, AVG(StdGPA)as prom 
FROM Student
GROUP BY StdClass
order by prom asc

SELECT StdFirstName, StdCity, AVG(StdGPA) AS PROMCURS
FROM Student WHERE StdGPA >= 3.7
GROUP BY StdFirstName, StdCity
ORDER BY PROMCURS DESC

Select FacFirstName, FacLastName
from Faculty, student
where Faculty.FacCity != student.StdCity
and faculty.FacState = Student.StdState 

Select FacFirstName, FacLastName
from Faculty, student
where Faculty.FacCity = 'SEATTLE' 
and student.StdCity = 'SEATTLE'

select StdFirstName, StdLastName, StdGPA, offterm
from student, offering
where StdGPA < 3.0 and OffTerm = 'SUMMER'
group by StdFirstName, StdLastName, StdGPA, OffTerm

