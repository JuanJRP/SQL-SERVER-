Create database estudiantes

use estudiantes

Create table Student1(
StdSSN char(15) not null,
StdLastName Varchar(15) not null,
StdCity Varchar(15) not null,
StdState Varchar(15) not null,
StdMajor Varchar(15) not null,
StdClass Varchar(15) not null,
StdGPA Varchar(15) not null,
)

Create table Student2(
StdSSN char(15) not null,
StdLastName Varchar(15) not null,
StdCity Varchar(15) not null,
StdState Varchar(15) not null,
StdMajor Varchar(15) not null,
StdClass Varchar(15) not null,
StdGPA Varchar(15) not null,
)

SELECT * FROM Student1

INSERT INTO Student1 VALUES ('123-45-6789','WELLS','SEATTLE','WA','IS','FR',3.00)
INSERT INTO Student1 VALUES ('124-56-7890','NORBERT','BOTHELL','WA','FIN','JR',2.70)
INSERT INTO Student1 VALUES ('234-56-7890','KENDALL','TACOMA','WA','ACCT','JR',3.50)

SELECT * FROM Student2

INSERT INTO Student2 VALUES ('111-56-4490','WILLIAMS','SEATTLE','WA','ACCT','JR',3.40)
INSERT INTO Student2 VALUES ('123-45-6789','WELLS','SEATTLE','WA','IS','FR',3.00)
INSERT INTO Student2 VALUES ('995-56-3490','BAGGINS','AUSTIN','TX','FIN','JR',2.90)

--PUNTO 1

-- A

SELECT * FROM Student1 WHERE StdGPA > 3.00 UNION SELECT * FROM Student2 WHERE StdGPA > 3.00 

--B

SELECT * FROM Student1 UNION SELECT * FROM Student2 WHERE StdLastName=StdLastName

--C

SELECT * FROM Student1 INTERSECT SELECT * FROM Student2 

--D



--PUNTO 2

USE STUDENT
SELECT * FROM Offering

--1

SELECT * FROM STUDENT WHERE StdCity != 'SEATTLE' AND StdGPA < 3.00 OR StdCity = 'BOTHELL' AND StdGPA < 3.00

--2

SELECT * FROM Offering WHERE OffTerm = 'WINTER' AND CourseNo= 'FIN300' OR OffTerm = 'SPRING' AND CourseNo = 'FIN480'

--3

SELECT * FROM Offering WHERE OfferNo = '9876' OR SELECT * FROM Course WHERE CourseNo = '2131' OR OfferNo = '4321'
 

--4

select * from Faculty
select FacFirstName, FacLastName, FacCity, FacSalary from Faculty where year(FacHireDate) > 1996 and FacCity = 'SEATTLE'

--5
 
SELECT FacFirstName, FacLastName, FacCity, FacSalary FROM Faculty WHERE YEAR(FacHireDate) >= 1996 AND YEAR(FacHireDate) <= 2000 AND FacCity != 'SEATTLE'




