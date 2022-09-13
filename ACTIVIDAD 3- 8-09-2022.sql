SELECT (CASE TRATAMIENTO
WHEN 'Srta' THEN 'SEÑORITA'
WHEN 'Sr' THEN 'SEÑOR'
WHEN 'Dr' THEN 'DOCTOR'
WHEN 'Sra' THEN 'SEÑORA'
WHEN 'Lic' THEN 'LICENCIADO'
WHEN 'Ms' THEN 'MAGISTER'
WHEN 'PhD' THEN 'DOCTOR'
ELSE 'NO TRATAMIENTO'
END),apeEmpleado,NombreEmpleado 
FROM RRHH.EMPLEADOS
ORDER BY 1;
GO

SELECT * FROM RRHH.EMPLEADOS

/*Elaborar una consulta que ingresando el IdCargo, nos retorne toda la información del empleado 
dándole su debido tratamiento. Imprima la información como un pequeño texto de carta.*/

/*Ejemplo: Doctor Rafael Cristancho, debido a su estado de mora ha sido reportado ante las 
centrales de riesgo. 

Dir: Cra 5 54-56 Medellín
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