/*20. Liste el saldo promedio y el número de clientes por ciudad.  Sólo incluya a los residentes del estado de Washington (WA). 
Elimine del resultado las ciudades con menos de dos clientes.*/

DECLARE @Promedio TABLE(
CLIENTECIUDAD INT NOT NULL,
PROMEDIOCIUDAD INT NOT NULL,
CIUDAD VARCHAR(200) NOT NULL
);
INSERT INTO @Promedio(CLIENTECIUDAD, PROMEDIOCIUDAD, CIUDAD)
SELECT COUNT(CustFirstName), AVG(CustBal), CustCity FROM dbo.Customer WHERE CustState = 'WA' GROUP BY CustCity
SELECT * FROM @Promedio WHERE CLIENTECIUDAD >= 2

/*21. Liste el número de códigos postales únicos y el saldo promedio de los clientes por ciudad. Sólo incluya a los residentes
del estado de Washington (WA). Elimine del resultado las ciudades en las que el saldo promedio sea menor a 100 dólares. Este 
problema requiere de una consulta anidada en la cláusula FROM. */

DECLARE @codigos TABLE(
COD_POS_U INT NOT NULL,
SALDO_PROM DECIMAL NOT NULL,
CIUDAD VARCHAR(200) NOT NULL
);
INSERT INTO @codigos(COD_POS_U, SALDO_PROM, CIUDAD)
SELECT COUNT(DISTINCT CustNo), AVG(CustBal), CustCity FROM dbo.Customer WHERE CustState = 'WA' GROUP BY CustCity
SELECT * FROM @codigos WHERE SALDO_PROM >= 100.00

/*22. Liste el número de orden y el monto total de las órdenes colocadas el 23 de enero de 2007. El monto total de una orden es 
la suma de la cantidad por el precio del  producto de cada producto que se encuentra en la orden.*/

SELECT OrderTbl.OrdNo, SUM(Product.ProdPrice) AS MONTO_TOTAL FROM dbo.OrderTbl, dbo.Product, dbo.OrdLine
WHERE OrderTbl.OrdDate = '2007-01-23' AND (OrderTbl.OrdNo = OrdLine.OrdNo AND OrdLine.ProdNo = Product.ProdNo) GROUP BY OrderTbl.OrdNo

/*23. Liste el número de orden, fecha de la orden, nombre y apellido del cliente y monto total de las órdenes colocadas el 23 de 
enero de 2007. El monto total de una orden es la suma de la cantidad por el precio del producto para cada producto que se encuentra 
en la orden.*/

SELECT OrderTbl.OrdNo, OrderTbl.OrdDate, CONCAT(Customer.CustFirstName, ' ', Customer.CustLastName) AS NOMBRE, SUM(Product.ProdPrice) AS MONTO
FROM dbo.OrderTbl INNER JOIN dbo.Customer ON OrderTbl.CustNo = Customer.CustNo INNER JOIN dbo.OrdLine ON OrderTbl.OrdNo = OrdLine.OrdNo INNER JOIN dbo.Product ON OrdLine.ProdNo = Product.ProdNo 
WHERE OrderTbl.OrdDate = '2007-01-23' GROUP BY OrderTbl.OrdNo, OrderTbl.OrdDate, Customer.CustFirstName, Customer.CustLastName

/*24. Liste el número, nombre y apellido del cliente; la suma de la cantidad de productos ordenados y el monto total de la orden 
(suma del precio del producto por la cantidad) de las órdenes colocadas en enero de 2007. Sólo incluya los productos cuyo nombre 
contenga Ink Jet o Laser. Sólo incluya a los clientes que hayan ordenado más de dos productos Ink Jet o Laser durante enero de 2007.*/

DECLARE @TABLA TABLE(
IDCUS VARCHAR (200),
NOMBRECUS VARCHAR (200),
PRODI INT,
MONT DECIMAL
);
INSERT INTO @TABLA
SELECT Customer.CustNo, CONCAT(Customer.CustFirstName, ' ', Customer.CustLastName) AS NOMBRE, SUM(OrdLine.Qty) AS PROD_ORDENADOS, SUM(Product.ProdPrice * OrdLine.Qty) AS MONTO
FROM dbo.Customer INNER JOIN dbo.OrderTbl ON Customer.CustNo = OrderTbl.CustNo INNER JOIN dbo.OrdLine ON OrderTbl.OrdNo = OrdLine.OrdNo INNER JOIN dbo.Product ON OrdLine.ProdNo = Product.ProdNo
WHERE (OrderTbl.OrdDate BETWEEN '2007-01-01' AND '2007-01-31') AND (Product.ProdName LIKE '%Ink Jet%' OR Product.ProdName LIKE '%Laser%')
GROUP BY Customer.CustNo, Customer.CustFirstName, Customer.CustLastName
SELECT * FROM @TABLA WHERE PRODI >= 2

/*25. Liste el número y nombre del producto; suma de la cantidad de productos ordenados y monto total de la orden (suma del precio del 
producto por la cantidad) de las órdenes colocadas durante enero de 2007. Sólo incluya las órdenes que hayan pedido más de 5 productos 
durante enero de 2007. Ordene el resultado en orden descendente con respecto al monto total de la orden.*/

DECLARE @MAS TABLE(
IDPROD VARCHAR (200),
NOMPROD VARCHAR (200),
PRODIO DECIMAL,
MONTOT DECIMAL
);

INSERT INTO @MAS
SELECT Product.ProdNo, Product.ProdName, SUM(OrdLine.Qty) AS PROD_ORD, SUM(Product.ProdPrice * OrdLine.Qty) AS MONTO_TOTAL
FROM dbo.Product INNER JOIN dbo.OrdLine ON Product.ProdNo = OrdLine.ProdNo INNER JOIN dbo.OrderTbl ON OrderTbl.OrdNo = OrdLine.OrdNo
WHERE OrderTbl.OrdDate BETWEEN '2007-01-01' AND '2007-01-31' GROUP BY Product.ProdNo, Product.ProdName
SELECT * FROM @MAS WHERE PRODIO > 5 ORDER BY MONTOT DESC

/*26. Liste el número y la fecha de la orden; el número, nombre y apellido del cliente; el estado del cliente y el estado al que se envía 
(OrdState) en el que el estado del cliente es distinto al estado donde se envía.*/

SELECT OrderTbl.OrdNo, OrderTbl.OrdDate, Customer.CustNo, CONCAT(Customer.CustFirstName, ' ', Customer.CustLastName) AS NOMBRE, Customer.CustState, OrderTbl.OrdState
FROM dbo.OrderTbl INNER JOIN dbo.Customer ON OrderTbl.CustNo = Customer.CustNo WHERE LOWER(OrderTbl.OrdState) != LOWER(Customer.CustState)

/*27. Liste el número, nombre y apellido del empleado; la tasa de comisión, el nombre y apellido del empleado que supervisa y la tasa de 
comisión del supervisor.*/

DECLARE @EMPLEADOS TABLE(
IDEMPLEADO VARCHAR(200),
NOMBREMPLE VARCHAR(200),
TASACOMIEM FLOAT,
IDSUPER VARCHAR (200)
);

DECLARE @SUP TABLE(
IDSUP VARCHAR(200),
NOMBRESUP VARCHAR(200),
TASACOMISUP FLOAT
);

INSERT INTO @EMPLEADOS SELECT EmpNo, CONCAT(EmpFirstName, ' ', EmpLastName) AS EMPLEADO, EmpCommRate AS TASA_COMISIONEMP, SupEmpNo FROM dbo.Employee
INSERT INTO @SUP SELECT EmpNo, CONCAT(EmpFirstName, ' ', EmpLastName) AS SUPERVISOR, EmpCommRate AS TASA_COMISIONSUP FROM dbo.Employee
SELECT * FROM @EMPLEADOS, @SUP WHERE IDSUPER = IDSUP

/*28. Liste el número, nombre y apellido del empleado; y el monto total de las comisiones de las órdenes levantadas en enero de 2007. 
El monto de la comisión es la suma del monto en dólares de los productos ordenados por la tasa de comisión del empleado.*/

SELECT Employee.EmpNo, CONCAT(Employee.EmpFirstName, ' ', Employee.EmpLastName), (SUM(Product.ProdPrice * OrdLine.Qty))* Employee.EmpCommRate AS COMISION 
FROM dbo.Employee INNER JOIN dbo.OrderTbl ON Employee.EmpNo = OrderTbl.EmpNo INNER JOIN OrdLine ON OrderTbl.OrdNo = OrdLine.OrdNo INNER JOIN dbo.Product ON OrdLine.ProdNo = Product.ProdNo
WHERE OrderTbl.OrdDate BETWEEN '2007-01-01' AND '2007-01-31' GROUP BY Employee.EmpNo, Employee.EmpFirstName, Employee.EmpLastName, Employee.EmpCommRate

/*29. Liste la unión de clientes y receptores de órdenes. Incluya en el resultado el nombre, calle, ciudad, estado y código postal. 
Necesita usar la función de concatenación para combinar el nombre y el apellido para que se puedan comparar con el nombre del receptor. 
En Access SQL, el símbolo & es la función de concatenación. En Oracle SQL el símbolo || es la función de concatenación. */

SELECT CONCAT(Customer.CustFirstName, ' ', Customer.CustLastName) AS UNION_NOMBRE, Customer.CustStreet, Customer.CustCity, Customer.CustState, Customer.CustZip
FROM dbo.Customer INNER JOIN dbo.OrderTbl ON CONCAT(Customer.CustFirstName, ' ', Customer.CustLastName) = OrderTbl.OrdName

/*30. Liste el nombre y apellido de los clientes que tengan el mismo nombre y apellido de algún empleado.*/

SELECT Customer.CustFirstName + ' '+ Customer.CustLastName AS CLIENTE,Employee.EmpFirstName+' '+Employee.EmpLastName AS EMPLEADO 
FROM Customer, Employee WHERE Customer.CustFirstName = Employee.EmpFirstName OR Customer.CustLastName = Employee.EmpLastName|