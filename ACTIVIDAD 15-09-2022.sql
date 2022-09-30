DECLARE @CONTADOR INT
SET @CONTADOR = 0
WHILE (@CONTADOR < 100)
BEGIN
SET @CONTADOR = @CONTADOR + 1
IF @CONTADOR % 2 = 0
PRINT CAST(@CONTADOR AS VARCHAR) + ' ES UN NUMERO PAR'
ELSE 
PRINT CAST(@CONTADOR AS VARCHAR) + ' ES UN NUMERO IMPAR'
END

--------------------------------------------------------------------------------------------------------------------------------------

DECLARE @COUNTER INT = 1
WHILE (@COUNTER < 6)
BEGIN 
SELECT TOP (1) P.IdProducto,P.nomProducto,P.precioUnidad FROM COMPRA.PRODUCTOS P WHERE IdProducto = @COUNTER
SET @COUNTER += 1
END

--------------------------------------------------------------------------------------------------------------------------------------

DECLARE @ID INT, @NOMBRE VARCHAR(50)
WHILE EXISTS (SELECT * FROM COMPRA.PRODUCTOS WHERE UniEnExistencia = 3500)
BEGIN
SELECT TOP 1 @ID = IdProducto, @NOMBRE = nomProducto FROM COMPRA.PRODUCTOS P WHERE UniEnExistencia = 3500
UPDATE COMPRA.PRODUCTOS SET UniEnExistencia = 5000 WHERE IdProducto = @ID 
PRINT 'PRODUCTO: ' + @NOMBRE + ' SE ACTUALIZO EL STOCK'
CONTINUE
END
