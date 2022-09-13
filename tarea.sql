/*2.2. Elabore un programa que reciba como entrada la fecha de nacimiento y dé como 
salida la cantidad de días, años y meses que lleva viviendo.*/

SET DATEFORMAT DMY
DECLARE @fechanacimiento DATE
SET @fechanacimiento = '22-05-2003'
DECLARE @fechaactual DATE
SET @fechaactual = '20-04-2022'
DECLARE @dias INT
SET @dias = (SELECT DATEDIFF(DAY, @fechanacimiento, @fechaactual ))
DECLARE @meses INT
SET @meses = (SELECT DATEDIFF(MONTH, @fechanacimiento, @fechaactual ))
DECLARE @años INT
SET @años = (SELECT DATEDIFF(YEAR, @fechanacimiento, @fechaactual ))
PRINT 'Tengo de vida' + str(@años)+' Años' + str(@meses) + ' Meses' + str(@dias)+' Dias'


/*Elabore una consulta que arroje el nombre completo de un empleado de la tabla EMPLEADOS  indicando la longitud de la cadena.*/

DECLARE @nombre VARCHAR(30)
SET @nombre = (SELECT TOP(1)EMP_FNAME + (' ') + EMP_LNAME FROM EMPLOYEE)
DECLARE @largo INT
SET @largo =  LEN(@nombre)

PRINT 'EL NOMBRE COMPLETO ES ' + @nombre
PRINT 'LA LONGITUD ES DE ' + str(@largo) + ' CARACTERES'

