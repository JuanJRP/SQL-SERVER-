--Segundo parcial

/*1. Elabore una consulta que arroje el siguiente mensaje:
"George Williams es el cliente que presenta el mayor balance el cual es de        769"
siendo el balance un valor retornado y no escrito directamente en el print.*/

DECLARE @CUS_BALANCE INT
SET @CUS_BALANCE = (SELECT CUS_BALANCE FROM CUSTOMER WHERE CUS_CODE = '10017')
DECLARE @NAME CHAR(50)
SET @NAME = (SELECT CUS_FNAME + ' ' + CUS_LNAME FROM CUSTOMER WHERE CUS_CODE = '10017')
PRINT  @NAME + 'ES EL CLIENTE QUE PRESENTA EL MAYOR BALANCE EL CUAL ES DE: ' + STR(@CUS_BALANCE)

/*2. Elaborar una consulta que imprima el siguiente mensaje:
"La cantidad de artículos vendidos al área con código 615 fue de         9  y su descripción se encuentra en la tabla anexa"
y arroje la siguiente tabla: 

Descripción
7.25-in. pwr. saw blade
9.00-in. pwr. saw blade
B&D jigsaw, 12-in. blade
B&D jigsaw, 8-in. blade
Claw hammer
Rat-tail file, 1/8-in. fine
Hicut chain saw, 16 in.
1.25-in. metal screw, 25
2.5-in. wd. screw, 50*/

DECLARE @VENTAS INT
SET @VENTAS =(SELECT COUNT(VENDOR.V_AREACODE) FROM PRODUCT , VENDOR WHERE VENDOR.V_AREACODE = '615' AND VENDOR.V_CODE = PRODUCT.V_CODE)
PRINT 'La cantidad de artículos vendidos al área con código 615 fue de' + STR(@VENTAS) +' y su descripción se encuentra en la tabla anexa';
SELECT PRODUCT.P_DESCRIPT FROM PRODUCT , VENDOR WHERE VENDOR.V_AREACODE = '615' AND VENDOR.V_CODE = PRODUCT.V_CODE

/*3. Modificar la anterior consulta de tal modo que arroje los siguientes mensajes:
"La cantidad de artículos vendidos al área con código 615 fue de         9"
"El vendedor del artículo de mayor precio en el área 615 fue ORDVA, Inc."*/

DECLARE @VENTAS2 INT
SET @VENTAS2 =(SELECT COUNT(VENDOR.V_AREACODE) FROM PRODUCT, VENDOR WHERE VENDOR.V_AREACODE = '615' AND VENDOR.V_CODE = PRODUCT.V_CODE)
DECLARE @VENDEDOR CHAR (50)
SET @VENDEDOR = (SELECT V_NAME FROM VENDOR WHERE V_CODE = (SELECT V_CODE FROM PRODUCT WHERE P_PRICE = (SELECT MAX(PRODUCT.P_PRICE) FROM PRODUCT , VENDOR WHERE VENDOR.V_AREACODE = '615' AND VENDOR.V_CODE = PRODUCT.V_CODE)))
PRINT 'La cantidad de artículos vendidos al área con código 615 fue de' + STR(@VENTAS2)
PRINT 'El vendedor del artículo de mayor precio en el área 615 fue ' + (@VENDEDOR)
