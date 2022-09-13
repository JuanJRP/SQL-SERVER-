SELECT FacSSN AS Seguridad, FacFirstName AS Nombre, FacLastName AS Apellido, FacCity AS Ciudad, FacState AS Estado
FROM Faculty
UNION
SELECT StdSSN AS seguridad, StdFirstName AS nombre, StdLastName AS apellido, StdCity AS ciudad, StdState AS estado
FROM student

select FacFirstName as Nombre, FacLastName as apellido,FacCity as ciudad
from Faculty 
intersect
select StdFirstName as nombre, StdLastName as apellido,StdCity as ciudad
from student

SELECT StdSSN AS SSN, StdFirstName AS FirstName, StdLastName AS LastName, StdCity AS City, StdState AS State
FROM Student
EXCEPT
SELECT StdSSN AS SSN, StdFirstName AS FirstName, StdLastName AS LastName, StdCity AS City, StdState AS State
FROM Student
WHERE StdCity = 'REDMOND'