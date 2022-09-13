GO
DECLARE @CANT INT
SELECT @CANT = COUNT(*)
FROM CUSTOMER WHERE CUS_BALANCE = 0
IF @CANT <= 4 PRINT 'No hay mas de cuatro clientes con balance en ceros'
ELSE PRINT 'Hay mas de cuatro clientes con balance en ceros'
PRINT 'Hay' + STR(@CANT)

------------------------------------------------------------------------------------------------------------------

GO
DECLARE @NOMBRE VARCHAR(50)
SELECT @NOMBRE = CUS_FNAME FROM CUSTOMER WHERE CUS_FNAME LIKE'%ROBERT%'
IF @NOMBRE = 'ROBERT' PRINT 'Hay personas con el nombre robert'
ELSE PRINT 'NO HAY NADIE CON EL NOMBRE ROBERT'

------------------------------------------------------------------------------------------------------------------

DECLARE @PROMEDIO REAL
SET @PROMEDIO = (SELECT AVG(P_PRICE) FROM PRODUCT)
IF (SELECT COUNT(P_PRICE) FROM PRODUCT WHERE P_PRICE > @PROMEDIO) > 10 PRINT 'Si encuentra mas de 10'
ELSE PRINT 'No hay mas de 10'

------------------------------------------------------------------------------------------------------------------

