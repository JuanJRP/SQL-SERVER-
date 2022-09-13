-- 1.1) Seleccione todos los productos de la tabla PRODUCT ordenados por precio en forma descendente.

SELECT P_DESCRIPT, P_PRICE FROM PRODUCT ORDER BY P_PRICE DESC

-- 1.2) Elabore una consulta que indique el número de códigos de área que hay en la tabla CUSTOMER.

SELECT COUNT(DISTINCT CUS_AREACODE) AS CANTIDAD_CODEAREA FROM CUSTOMER 

-- 1.3) En una sola consulta seleccione de la tabla PRODUCT el producto de mayor y menor precio. 

SELECT * FROM PRODUCT WHERE P_PRICE = (SELECT MAX(P_PRICE) FROM PRODUCT) OR P_PRICE = (SELECT MIN(P_PRICE) FROM PRODUCT)

-- 1.4) Elabore una consulta que indique la cantidad de códigos de área diferentes y cuántos registros hay por código de área.

------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @CAN INT SET @CAN=(SELECT COUNT(DISTINCT CUS_AREACODE) AS CANTIDAD_CODEAREA FROM CUSTOMER) 

DECLARE @DATO1 INT SET @DATO1=(SELECT TOP 1 COUNT(CUS_AREACODE) AS CUS FROM CUSTOMER GROUP BY CUS_AREACODE) 
DECLARE @NUM1 INT SET @NUM1=(SELECT TOP 1 CUS_AREACODE AS Numero_De_Codigos FROM CUSTOMER GROUP BY CUS_AREACODE)

PRINT 'La cantidad de diferentes CUS_AREACODE es:' + STR(@CAN)

PRINT 'La cantidad de CUS_ARECODE del' + STR(@NUM1) + '  es:' + STR(@DATO1)



(SELECT TOP 1 CUS_AREACODE AS Numero_De_Codigos FROM CUSTOMER GROUP BY CUS_AREACODE)

(SELECT TOP 2 COUNT(CUS_AREACODE) AS CUS FROM CUSTOMER GROUP BY CUS_AREACODE)

------------------------------------------------------------------------------------------------------------------------------------------

-- 1.5) Seleccione de la tabla PRODUCT los cinco primeros productos de mayor precio ordenados en forma ascendente.

SELECT TOP 5 * FROM PRODUCT ORDER BY P_PRICE desc

SELECT * FROM PRODUCT  
SELECT * FROM CUSTOMER