-- 1. Liste el nombre de los vendedores que realizaron ventas por encima del promedio del precio de los productos (p_price)

SELECT * FROM VENDOR;

DECLARE @PROMEDIO FLOAT
SET @PROMEDIO = (SELECT AVG(P_PRICE) FROM PRODUCT)
SELECT VENDOR.V_NAME FROM VENDOR, PRODUCT WHERE PRODUCT.P_PRICE >  @PROMEDIO AND VENDOR.V_CODE = PRODUCT.V_CODE

-- 2.Modifique el anterior programa para que imprima un mensaje indicando el número de vendedores por encima del precio promedio.  Algo así como:
-- "El número de vendedores por encima del precio promedio es:          5"

DECLARE @PROMEDIO2 FLOAT
SET @PROMEDIO2 = (SELECT AVG(P_PRICE) FROM PRODUCT)
DECLARE @CANTIDAD INT
SET @CANTIDAD = (SELECT COUNT(VENDOR.V_NAME) FROM VENDOR, PRODUCT WHERE PRODUCT.P_PRICE >  @PROMEDIO2 AND VENDOR.V_CODE = PRODUCT.V_CODE)
PRINT 'El numero de vendedores por encima del precio promedio es:' + STR(@CANTIDAD)

-- 3. Realice un incremento del cinco por ciento a todos los productos con precio menor o igual al promedio. Liste las tablas completas antes 
-- y después del ajuste. 

DECLARE @PROMEDIO3 FLOAT
SET @PROMEDIO3 = (SELECT AVG(P_PRICE) FROM PRODUCT)
DECLARE @VENDEDOR_AUMENTADO TABLE(
P_CODE NVARCHAR(100) NULL,
P_DESCRIPT NVARCHAR(100) NULL,
P_INDATE DATETIME NULL,
P_QOH SMALLINT NULL,
P_MIN SMALLINT NULL,
P_PRICE REAL NULL,
P_DISCOUNT FLOAT NULL,
V_CODE INT NULL
);
INSERT INTO @VENDEDOR_AUMENTADO (P_CODE, P_DESCRIPT, P_INDATE, P_QOH, P_MIN, P_PRICE, P_DISCOUNT, V_CODE)
SELECT P_CODE, P_DESCRIPT, P_INDATE, P_QOH, P_MIN, P_PRICE, P_DISCOUNT, V_CODE FROM PRODUCT
UPDATE @VENDEDOR_AUMENTADO SET P_PRICE = P_PRICE + (P_PRICE*0.05) WHERE P_PRICE <= @PROMEDIO3
SELECT * FROM @VENDEDOR_AUMENTADO;
SELECT * FROM PRODUCT

