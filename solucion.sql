/* 12) Liste el número y la fecha de la orden; número, nombre y apellido del cliente para las órdenes colocadas en enero
de 2007, levantadas por clientes de Colorado  (CustState) pero enviadas a residentes de Washington (OrdState).*/

SELECT OrderTbl.OrdNo, OrderTbl.OrdDate, Customer.CustNo, Customer.CustFirstName, Customer.CustLastName FROM Customer, OrderTbl
WHERE OrderTbl.CustNo = Customer.CustNo AND DATEPART(MM,OrderTbl.OrdDate) = 01 AND DATEPART(YEAR,OrderTbl.OrdDate) = 2007 
AND Customer.CustState = 'CO' AND OrderTbl.OrdState = 'WA' 

/* 13) Liste el número, nombre y apellido del cliente y saldo de los clientes de Washington que hayan colocado una o más 
órdenes en febrero de 2007. Elimine las filas duplicadas del resultado. */

SELECT Customer.CustNo, OrderTbl.OrdName, Customer.CustBal FROM Customer, OrderTbl 
WHERE OrderTbl.CustNo = Customer.CustNo AND DATEPART(mm, OrderTbl.OrdDate) = 02 
AND DATEPART(YEAR, OrderTbl.OrdDate) = 2007 AND OrdState = 'WA'
GROUP BY Customer.CustNo, OrdName, CustBal;

/* 14) Liste el número y la fecha de la orden; número, nombre y apellido del cliente; número, nombre y apellido del empleado para 
las órdenes levantadas en enero de 2007, colocadas por clientes de Colorado*/

SELECT  OrdNo,OrdDate, Customer.CustNo, OrdName, Employee.EmpNo, EmpFirstName, EmpLastName FROM OrderTbl, Customer, Employee
WHERE OrderTbl.CustNo = Customer.CustNo AND Employee.EmpNo = OrderTbl.EmpNo AND DATEPART(mm, OrderTbl.OrdDate) = 01 
AND DATEPART(YEAR, OrderTbl.OrdDate) = 2007 AND Customer.CustState = 'CO';


SELECT * FROM OrderTbl;
SELECT * FROM Customer;
SELECT * FROM OrdLine;
SELECT * FROM Product;
SELECT * FROM Employee;