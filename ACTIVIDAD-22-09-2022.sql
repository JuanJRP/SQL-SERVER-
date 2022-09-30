

/*Programar una estructura de control para determinar cuáles pedidos han sido enviados.*/

DECLARE @id INT, @DESTINO VARCHAR(50)
SET @id = 1
WHILE EXISTS (SELECT * FROM VENTA.PEDIDOSCABE WHERE IdPedido = @id)
BEGIN

SET @DESTINO = (SELECT destinatario FROM VENTA.PEDIDOSCABE WHERE IdPedido = @id)

IF ((SELECT envioPedido FROM VENTA.PEDIDOSCABE WHERE IdPedido = @id)  = 'Emviado')
	PRINT 'PEDIDO PARA ' + @DESTINO + ' ID DEL PEDIDO ' + STR(@id) + ' FUE ENVIADO'
ELSE 
	PRINT 'PEDIDO PARA ' + @DESTINO + ' ID DEL PEDIDO ' + STR(@id) + ' NO ENVIADO'

SET @id += 1
CONTINUE
END;

