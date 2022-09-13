SELECT (CASE TRATAMIENTO
WHEN 'Srta' THEN 'SE�ORITA'
WHEN 'Sr' THEN 'SE�OR'
WHEN 'Dr' THEN 'DOCTOR'
WHEN 'Sra' THEN 'SE�ORA'
WHEN 'Lic' THEN 'LICENCIADO'
WHEN 'Ms' THEN 'MAGISTER'
WHEN 'PhD' THEN 'DOCTOR'
ELSE 'NO TRATAMIENTO'
END),apeEmpleado,NombreEmpleado 
FROM RRHH.EMPLEADOS
ORDER BY 1;
GO

SELECT * FROM RRHH.EMPLEADOS

/*Elaborar una consulta que ingresando el IdCargo, nos retorne toda la informaci�n del empleado 
d�ndole su debido tratamiento. Imprima la informaci�n como un peque�o texto de carta.*/

/*Ejemplo: Doctor Rafael Cristancho, debido a su estado de mora ha sido reportado ante las 
centrales de riesgo. 

Dir: Cra 5 54-56 Medell�n
Tel: 6254578*/

GO
CREATE FUNCTION DBO.MES (@idCargo INT) RETURNS VARCHAR(50)
AS
BEGIN

END)
RETURN @MES 
END

PRINT DBO.MES(5)


SELECT * FROM RRHH.EMPLEADOS