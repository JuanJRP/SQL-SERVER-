--CREA UNA VARIABLE TIPO TABLA
DECLARE @PRODUCTO TABLE (
NombreProducto VARCHAR (100) NOT NULL,
PRODUCTOPRE DECIMAL,
PRODUCTOCAN INT);

-- INSERTA VALORES DENTRO DE LA VARIABLE TIPO TABLA
INSERT INTO @PRODUCTO (NombreProducto, PRODUCTOPRE, PRODUCTOCAN)
SELECT NomProducto, PrecioUnidad, cantxUnidad
FROM Compra.Productos
WHERE PrecioUnidad > 50;

--VER EL CONJUNTO DE VALORES DE LA VARIABLE TIPO TABLA
SELECT * FROM @PRODUCTO;
GO

/* EJERCICIO 1). Crear una variable tipo tabla pero con el precio aumentado en un diez por ciento. 
Los precios de la tabla productos no sufren variación. que guarde los datos de la tabla productos*/

DECLARE @AUMENTADO TABLE (
NombreProducto VARCHAR (100) NOT NULL,
PRODUCTOPRE DECIMAL,
PRODUCTOPREAU DECIMAL,
PRODUCTOCAN INT);

INSERT INTO @AUMENTADO (NombreProducto, PRODUCTOPRE, PRODUCTOPREAU, PRODUCTOCAN)
SELECT NomProducto, precioUnidad ,(precioUnidad + (PrecioUnidad * 0.10) + 1), cantxUnidad
FROM Compra.Productos

SELECT * FROM @AUMENTADO;
GO

/* Ejercicio 2). Mostrar por medio de una variable tipo tabla un enlace por idProducto entre las 
tablas PedidosDeta y Productos.*/

select * from COMPRA.PedidosDeta;
select * from COMPRA.Productos;


DECLARE @AUMENTADO TABLE (
idPedido INT,
idProducto INT,
PRODUCTOPREAU DECIMAL,
PRODUCTOCAN INT);

INSERT INTO @AUMENTADO (NombreProducto, PRODUCTOPRE, PRODUCTOPREAU, PRODUCTOCAN)
SELECT NomProducto, precioUnidad ,(precioUnidad + (PrecioUnidad * 0.10) + 1), cantxUnidad
FROM Compra.Productos

SELECT * FROM @AUMENTADO;
GO

