create database biblioteca

use biblioteca

 create table libros(
  codigo varchar(40)not null,
  titulo varchar(40)not null,
  autor varchar(40)not null,
  Genero varchar(40)not null,
  Tipo varchar(40)not null,
  primary key (codigo)
 );

 create table socios(
  documento varchar(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key (documento)
 );

  create table Empleados(
  documento varchar(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key (documento)
 );

 create table prestamos(
  documento varchar(8) not null,
  codigo varchar(40)not null,
  fechaprestamo date not null,
  fechadevolucion date,
  primary key (codigo)
 );

 create table Computadores(
  documentos varchar(8) not null,
  nombres varchar(40),
  hora_de_inicio varchar(40),
  Hora_de_finalizacion varchar(40),
  primary key (documentos)
 );
 
 insert into socios(documento,nombre,domicilio) values('22333441','Juan Perez','Colon 345');
 insert into socios(documento,nombre,domicilio) values('23232442','Luis Lopez','Caseros 940');
 insert into socios(documento,nombre,domicilio) values('25123443','Ana Herrero','Sucre 120');
 insert into socios(documento,nombre,domicilio) values('19283012','mathias perez','poblado 940');
 insert into socios(documento,nombre,domicilio) values('27892312','juliana paez','ayura 120');

 insert into Empleados(documento,nombre,domicilio) values('10004107','Yurany Velasquez','Castilla');
 insert into Empleados(documento,nombre,domicilio) values('11345612','Andres Felipe','San Javier');
 insert into Empleados(documento,nombre,domicilio) values('10014701','Juan Jose Restrepo','Itagui');
 insert into Empleados(documento,nombre,domicilio) values('12983901','kevin ramirez','industriales');
 insert into Empleados(documento,nombre,domicilio) values('22612371','santiago petran','hospital');

 insert into libros(codigo,titulo,autor,Genero,Tipo) values('1','Algebra de Baldor','Aurelio Baldor','Educativo','Matematicas');
 insert into libros(codigo,titulo,autor,Genero,Tipo) values('45','100 años de soledad','Gabriel Garcia Marquez','Novela','Literatura Colombiana');
 insert into libros(codigo,titulo,autor,Genero,Tipo) values('89','Viaje al centro de la tierra','Julio Verne','Novela','ciencia Ficcion');
 insert into libros(codigo,titulo,autor,Genero,Tipo) values('80','satanas','Mario Mendoza','ciencia ficcion','ficcion');
 insert into libros(codigo,titulo,autor,Genero,Tipo) values('37','viaje a la luna','Julio Verne','Novela','ciencia Ficcion');

 insert into prestamos(documento,codigo,fechaprestamo,fechadevolucion) values('11345612','45','2016-08-10','2016-08-12');
 insert into prestamos(documento,codigo,fechaprestamo,fechadevolucion) values('10014701','1','2016-08-15','2016-09-12');
 insert into prestamos(documento,codigo,fechaprestamo,fechadevolucion) values('10004107','89','2016-08-10','2016-08-13');
 insert into prestamos(documento,codigo,fechaprestamo,fechadevolucion) values('23232442','80','2016-08-10','2016-08-19');
 insert into prestamos(documento,codigo,fechaprestamo,fechadevolucion) values('10004107','45','2016-08-15','2016-08-28');
 insert into prestamos(documento,codigo,fechaprestamo,fechadevolucion) values('25123443','37','2016-08-02','2016-08-05');
 insert into prestamos(documento,codigo,fechaprestamo,fechadevolucion) values('10014701','1','2016-08-02','2016-08-05');

 insert into Computadores(documentos,nombres,hora_de_inicio,Hora_de_finalizacion) values('10014701','Juan Jose Restrepo','2018-08-02-22:40','2018-08-02-24:00');
 insert into Computadores(documentos,nombres,hora_de_inicio,Hora_de_finalizacion) values('11345612','Andres Felipe','2020-08-02-13:10','2020-08-02-15:10');
 insert into Computadores(documentos,nombres,hora_de_inicio,Hora_de_finalizacion) values('25123443','Ana Herrero','2019-08-02-8:30','2019-08-02-10:30');
 insert into Computadores(documentos,nombres,hora_de_inicio,Hora_de_finalizacion) values('10410201','joan herrera','2020-08-03-7:28','2021-08-02-15:10');
 insert into Computadores(documentos,nombres,hora_de_inicio,Hora_de_finalizacion) values('68293812','ana mendoza','2019-08-04-9:19','2021-08-01-10:30');

 select * from prestamos;

 select nombre,titulo,fechaprestamo
  from prestamos as p
  join socios as s
  on s.documento=p.documento
  join libros as l
  on codigolibro=codigo;

 select nombre,titulo,fechaprestamo,Genero
  from prestamos as p
  join socios as s
  on p.documento=s.documento
  join libros as l
  on l.codigo=p.codigolibro;

  select nombre,titulo,fechaprestamo,Genero
  from prestamos as p
  join Empleados as e
  on p.documento=e.documento
  join libros as l
  on l.codigo=p.codigolibro;


 select autor,titulo,fechaprestamo,Genero
  from prestamos as p
  left join socios as s
  on p.documento=s.documento
  join libros as l
  on p.codigolibro=l.codigo;

  select documentos,nombres,Hora_de_inicio,Hora_de_finalizacion
  from computadores as c
  left join socios as s
  on s.nombre=c.nombres
  left join Empleados as e
  on c.documentos=e.documento;
 