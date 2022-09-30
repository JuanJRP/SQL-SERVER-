/*Elabore una consulta que me regrese en orden alfabético ascendente por nombre, los
nombres y apellidos de los tres primeros clientes (CUSTOMER) cuyos nombres o apellidos
NO empiecen por un caractér entrado por pantalla. Por ejemplo, para la letra A la
consulta arrojaría:*/

CREATE FUNCTION DBO.ORDEN_ALFABETICO(@LETRA NVARCHAR(1)) RETURNS @TABLE TABLE(
NOMBRE VARCHAR(50),
APELLIDO VARCHAR(50))
AS
BEGIN
DECLARE @LIKE VARCHAR(10)
SET @LIKE = @LETRA + '%'
INSERT INTO @TABLE (NOMBRE,APELLIDO) SELECT TOP 3 CUS_FNAME,CUS_LNAME FROM CUSTOMER WHERE CUS_FNAME NOT LIKE @LIKE AND CUS_LNAME NOT LIKE @LIKE ORDER BY CUS_FNAME,CUS_LNAME ASC
RETURN
END
GO

SELECT * FROM DBO.ORDEN_ALFABETICO('A')

/*Elabore una consulta que permita actualizar la tabla clientes (CUSTOMER) ingresando el
código del cliente por pantalla. La consulta deberá realizar:*/

/*Si el código del cliente existe se incrementará su balance (CUS_BALANCE) en un 15%.*/

/*Si no existe se inserta el cliente con la siguiente información.
VALUES(@CONTA+1,'Felipe','Aguilar','F','621','2547474',365.25)
siendo @CONTA el código (CUS_CODE) del último registro existente. La salida será similar
a la siguiente:*/

DECLARE @CODE INT

----AGREGAR CODIGO DE VENDEDOR----
SET @CODE = 10020
----------------------------------

DECLARE @CONTA INT
SET @CONTA = (SELECT TOP 1 CUS_CODE FROM CUSTOMER ORDER BY CUS_CODE DESC)

IF EXISTS(SELECT * FROM CUSTOMER WHERE CUS_CODE = @CODE)
   BEGIN 
     UPDATE CUSTOMER SET CUS_BALANCE = ((SELECT CUS_BALANCE FROM CUSTOMER WHERE CUS_CODE = @CODE)*1.15) WHERE CUS_CODE = @CODE
   END
ELSE 
   BEGIN 
    INSERT INTO CUSTOMER(CUS_CODE,CUS_LNAME,CUS_FNAME,CUS_INITIAL,CUS_AREACODE,CUS_PHONE,CUS_BALANCE) VALUES (@CONTA+1,'Felipe','Aguilar','F','621','2547474',365.25)
   END 
GO
SELECT * FROM CUSTOMER

/*De la tabla product, seleccione los cinco productos que poseen los mayores descuentos
ordenados en forma descendente.*/

SELECT TOP 5 * FROM PRODUCT ORDER BY P_DISCOUNT DESC
