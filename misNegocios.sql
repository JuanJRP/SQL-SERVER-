create database Mis_Negocios
go
use Mis_Negocios
go
create schema VENTA
go
create schema COMPRA
go
create schema RRHH
GO
create table VENTA.Paises (
Idpais int primary key not null,
NombrePais Varchar (40) not null
)
GO
create table COMPRA.Categorias (
IdCategoria int primary key not null,
NombreCategoria Varchar (40) not null,
Descripción text
)
GO
create table VENTA.Clientes (
IdCliente int primary key not null,
NomCliente Varchar (40) not null,
DirCliente Varchar (80) not null,
Idpais int not null,
fonoCliente Varchar(15)not null,
foreign key (Idpais) references VENTA.Paises(Idpais) on delete cascade on update cascade
)
GO
create table COMPRA.Proveedores (
IdProveedor int primary key not null,
nomProveedor Varchar (80) not null,
dirProveedor Varchar (100) not null,
nomContacto Varchar (80) not null,
cargoContacto Varchar(50)not null,
idpais int not null,
fonoProveedor Varchar(15)not null,
faxProveedor Varchar(15)not null,
foreign key (idpais) references VENTA.Paises(Idpais) on delete cascade on update cascade
)
GO
create table COMPRA.Productos (
IdProducto int primary key not null,
nomProducto Varchar (80) not null,
idProveedor int not null,
idCategoria int not null,
cantxUnidad smallint not null,
precioUnidad decimal(10,2) not null,
UniEnExistencia smallint not null,
UniEnPedido smallint not null,
foreign key (idProveedor) references COMPRA.Proveedores(IdProveedor) on delete cascade on update cascade,
foreign key (idCategoria) references COMPRA.Categorias(IdCategoria) on delete cascade on update cascade
)
GO
create table RRHH.Cargos (
IdCargo int primary key not null,
desCargo Varchar (30) not null
)
GO
create table RRHH.Distritos (
IdDistrito int primary key not null,
nomDistrito Varchar (50) not null
)
GO
create table RRHH.Empleados (
IdEmpleado int primary key not null,
nomEmpleado Varchar (50) not null,
apeEmpleado Varchar (50) not null,
fecNac date not null,
dirEmpleado Varchar (100) not null,
idDistrito int not null,
fonoEmpleado Varchar (15),
idcargo int not null,
fecContrata date not null,
fotoEmpleado Image,
foreign key (idDistrito) references RRHH.Distritos(IdDistrito) on delete cascade on update cascade,
foreign key (idcargo) references RRHH.Cargos(IdCargo) on delete cascade on update cascade
)
GO
create table VENTA.PedidosCabe (
IdPedido int primary key not null,
idcliente int not null,
idEmpleado int not null,
fechaPedido date not null,
fechaEntrega date not null,
fechaEnvio date not null,
enviopedido Varchar (15) not null,
destinatario Varchar (50) not null,
dirdestinatario Varchar (100) not null,
foreign key (idcliente) references VENTA.Clientes(IdCliente) on delete cascade on update cascade,
foreign key (idEmpleado) references RRHH.Empleados(IdEmpleado) on delete cascade on update cascade
)
GO
create table COMPRA.PedidosDeta (
IdPedido int not null,
idProducto int not null,
precioUnidad Decimal(10,2) not null,
Cantidad smallint not null,
Descuento Decimal(10,2) not null,
foreign key (IdPedido) references VENTA.PedidosCabe(IdPedido),
foreign key (idProducto) references COMPRA.Productos(IdProducto)
)

/*REGISTROS*/

insert into VENTA.Paises values (1,'Colombia')
insert into VENTA.Paises values (2,'México')
insert into VENTA.Paises values (3,'Perú')
insert into VENTA.Paises values (4,'Ecuador')
insert into VENTA.Paises values (5,'Panamá')

insert into COMPRA.Categorias values (1,'aseo','limpido, detergente, fab etc')
insert into COMPRA.Categorias values (2,'carne','')
insert into COMPRA.Categorias values (3,'granos','arroz, frijoles, lentejas etc')
insert into COMPRA.Categorias values (4,'refrigerado','salchichas, mortadela, quesito etc')
insert into COMPRA.Categorias values (5,'dulces','')

insert into VENTA.Clientes values (1,'Juan','calle 123',1,'1236547895')
insert into VENTA.Clientes values (2,'Carlos','carrera 234',2,'4569823657')
insert into VENTA.Clientes values (3,'Jerónimo','carrera 345',3,'5698725641')
insert into VENTA.Clientes values (4,'Pipe','calle 456',4,'6542897514')
insert into VENTA.Clientes values (5,'Jhon','carrera 567',5,'0231652047')

insert into COMPRA.Proveedores values (1,'Mary','calle 789','Tulio','Jefe',1,'1236895','258')
insert into COMPRA.Proveedores values (2,'Marcos','carrera 894','Pamela','Recpcionista',2,'9823657','147')
insert into COMPRA.Proveedores values (3,'Antonio','carrera 561','Ánderson','limpieza',3,'5698641','369')
insert into COMPRA.Proveedores values (4,'Jacinto','calle 452','Alberto','Gerente',4,'6542897','753')
insert into COMPRA.Proveedores values (5,'José','carrera 985','Alex','administrador',5,'0231655','159')

insert into COMPRA.Productos values (1,'arróz',1,5,20,99.5,5,3)
insert into COMPRA.Productos values (2,'papa',2,4,20,75.5,10,2)
insert into COMPRA.Productos values (3,'carne',3,3,20,85.5,15,1)
insert into COMPRA.Productos values (4,'gomitas',4,2,20,98.5,20,4)
insert into COMPRA.Productos values (5,'fríjoles',5,1,20,70.5,25,3)

insert into RRHH.Cargos values (1,'Gerente')
insert into RRHH.Cargos values (2,'Supervisor')
insert into RRHH.Cargos values (3,'Cajero')
insert into RRHH.Cargos values (4,'Vendedor')
insert into RRHH.Cargos values (5,'Servicio al cliente')

insert into RRHH.Distritos values (1,'Zona Norte')
insert into RRHH.Distritos values (2,'Centro')
insert into RRHH.Distritos values (3,'Oriental')
insert into RRHH.Distritos values (4,'Regional')
insert into RRHH.Distritos values (5,'Occidental')

insert into RRHH.Empleados values (1,'Pedro','Rodriguez','01/01/1991','calle 658',5,'6574258954',1,'05/10/2014','')
insert into RRHH.Empleados values (2,'Pablo','Sánchez','02/02/1992','carrera 458',4,'0215987652',2,'10/06/2013','')
insert into RRHH.Empleados values (3,'Martínez','Angúlo','03/03/1983','carrera 789',3,'4500216854',3,'10/05/2012','')
insert into RRHH.Empleados values (4,'Donky','Quiñones','04/04/1984','calle 254',2,'4587574252',4,'10/05/2013','')
insert into RRHH.Empleados values (5,'Roko','Otálvaro','05/05/1985','urbanizacion López',1,'2225410360',5,'03/10/2012','')

insert into VENTA.PedidosCabe values (1,5,4,'01/02/2003','01/02/2003','01/02/2003','si','casa','calle 356')
insert into VENTA.PedidosCabe values (2,4,3,'02/02/2002','02/02/2002','02/02/2002','si','empresa','carrera 587')
insert into VENTA.PedidosCabe values (3,3,5,'03/03/2003','03/03/2003','03/03/2003','no','casa','calle 240')
insert into VENTA.PedidosCabe values (4,2,1,'04/04/2004','04/04/2004','04/04/2004','si','tienda','carrera 000')
insert into VENTA.PedidosCabe values (5,1,2,'05/05/2005','05/05/2005','05/05/2005','no','empresa','calle 214')

insert into COMPRA.PedidosDeta values (1,5,99.5,20,1.5)
insert into COMPRA.PedidosDeta values (2,4,88.5,20,2.5)
insert into COMPRA.PedidosDeta values (3,3,98.5,20,0.5)
insert into COMPRA.PedidosDeta values (4,2,77.5,20,5.5)
insert into COMPRA.PedidosDeta values (5,1,50.5,20,1.5)