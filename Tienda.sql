create database Tienda

use Tienda

create table Gorras(

id int primary key identity (1,1) not null,
Estado varchar(40) not null,
Nombre varchar(40) not null,
Identificador varchar(40) not null,
Talla varchar(40) not null,
Cantidad varchar(40) not null,
Precio varchar(40) not null,
);

insert into Gorras
(Estado,Nombre,Identificador,Talla,Cantidad,Precio)

values ('nuevo','Gorra','Ref501/521','Unica','12','170.000');
