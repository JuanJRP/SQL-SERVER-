CREATE DATABASE Trabajo

USE Trabajo

CREATE TABLE Empleados(
Num_Emp INTEGER not null,
Num_Documen CHAR(10) not null,
Nomb_Emp CHAR(40) not null,
CONSTRAINT Num_Unico PRIMARY KEY(Num_Emp)
);

CREATE TABLE Trabajos(
Num_Emp INTEGER not null,
Num_Proyec CHAR(5) not null,
Documen_Client INTEGER not null,
Fecha_De_Inicio DATE null,

CONSTRAINT Num_Unico_Proyec UNIQUE(Num_Proyec),

CONSTRAINT Num_EMPLE FOREIGN KEY(Num_Emp)
REFERENCES Empleados(Num_Emp) ON DELETE CASCADE,

CONSTRAINT Trabaj FOREIGN KEY(Documen_Client)
REFERENCES Clientes(Documen_Client) ON UPDATE CASCADE,

);

CREATE TABLE Clientes(
Num_Client INTEGER not null,
Documen_Client INTEGER not null,
Nomb_Client CHAR(40) not null,
CONSTRAINT Num_Unico_Client UNIQUE(Num_Client),
CONSTRAINT Traba PRIMARY KEY(Documen_Client)
);

INSERT INTO Trabajos VALUES(1,'A01',1001001271,'2222-04-04')

SELECT * FROM Trabajos 

ALTER TABLE Trabajos DROP CONSTRAINT [Num_Emp]

ALTER TABLE Trabajos ADD CONSTRAINT Num_Unico_Trab UNIQUE(Num_Emp)

DELETE FROM Trabajos Where Num_Emp=1
