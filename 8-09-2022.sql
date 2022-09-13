/*Dada la base de datos SaleCo, elaborar una consulta haciendo uso de la estructura if else que incremente el cust_balance 
en un 5% para aquellos clientes que lo tengan por debajo del promedio.*/

IF ((SELECT MIN(CUS_BALANCE) FROM CUSTOMER) < (SELECT AVG(CUS_BALANCE) FROM CUSTOMER))
   BEGIN 
     UPDATE CUSTOMER SET CUS_BALANCE = (CUS_BALANCE*1.05) WHERE CUS_BALANCE < (SELECT AVG(CUS_BALANCE) FROM CUSTOMER)
   END
ELSE 
   BEGIN 
    PRINT 'ERROR EN LA BUSQUEDA'
   END 
GO

SELECT * FROM CUSTOMER