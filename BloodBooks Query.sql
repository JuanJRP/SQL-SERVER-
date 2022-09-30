-----------------------------------------------------------------Crecion Base De Datos-----------------------------------------------------------------------------------------

CREATE DATABASE BloodBooks
GO

USE BloodBooks
GO

-----------------------------------------------------------------Creacion Tablas-----------------------------------------------------------------------------------------

CREATE TABLE Hospital(
Nombre VARCHAR(60) NOT NULL,
Telefono BIGINT NOT NULL,
Direccion VARCHAR(80) NOT NULL,
Correo VARCHAR(50) NULL,
Usuario VARCHAR(10) NOT NULL,
Contraseña VARCHAR(10) NOT NULL,
Hcodigo VARCHAR(6) NOT NULL,
PRIMARY KEY (Hcodigo) 
);

CREATE TABLE Administrativo(
Usuario VARCHAR(30) NOT NULL,
Contraseña BIGINT NOT NULL,
Telefono BIGINT NOT NULL,
Correo VARCHAR(50) NOT NULL,
ID INT NOT NULL IDENTITY(1,1),
PRIMARY KEY (ID)
);

CREATE TABLE Sangre(
ID INT NOT NULL IDENTITY(1,1),
RH VARCHAR(5)NOT NULL,
PRIMARY KEY (RH)
);

CREATE TABLE Sexo(
ID INT NOT NULL IDENTITY(1,1),
Sexo VARCHAR(10) NOT NULL,
PRIMARY KEY (Sexo)
);

CREATE TABLE Registro(
Nombre VARCHAR(15) NOT NULL,
Apellido VARCHAR(15) NOT NULL,
Cedula INT NOT NULL,
Telefono INT NOT NULL,
Sexo VARCHAR(10) NOT NULL,
Fecha_Nacimiento DATETIME NOT NULL,
Tipo_Sangre VARCHAR(5) NOT NULL,
Litros INT NOT NULL,
Fecha_Registro DATETIME NOT NULL,
Hcodigo VARCHAR(6) NOT NULL
FOREIGN KEY (Hcodigo) REFERENCES Hospital(Hcodigo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Tipo_Sangre) REFERENCES sangre(RH) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Sexo) REFERENCES Sexo(Sexo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PQRS(
Nombre VARCHAR(30) NOT NULL,
Hcodigo VARCHAR(6) NOT NULL,
Descripcion VARCHAR(100) NOT NULL,
Correo VARCHAR(50) NOT NULL,
Telefono INT NOT NULL,
Fecha_Registro DATETIME NOT NULL,
FOREIGN KEY (Hcodigo) REFERENCES Hospital(Hcodigo) ON DELETE CASCADE ON UPDATE CASCADE
);

GO
-----------------------------------------------------------------Insertar Datos-------------------------------------------------------------------------------------------

INSERT INTO Hospital VALUES('Instituto Gastroclínico',6044446600,'Cr46 2 Sur-45 Consult 158 Fase II Clínica Las Vegas',NULL,'GASTRO','123','DTK891');
INSERT INTO Hospital VALUES('In Care',3119495106,'Carrera 46 # 2 Sur 45 Fase Ii Consultorio 058',NULL,'CARE','234','DTK892');
INSERT INTO Hospital VALUES('Suplimed Hospitalario S.a.s',3117336033,'Calle 16A Sur # 48-29 Barrio Santa Maria de los Angeles',NULL,'SUPLIMED','345','DTK893');
INSERT INTO Hospital VALUES('I.p.s Centro De Vacunacion Integral S.a.s',3216342309,'Cl 54 46-27 Edificio Torre Fundadores Piso 10 Consult 1008',NULL,'INTEGRAL','456','DTK894');
INSERT INTO Hospital VALUES('Laboratorio Clínico Test',6045131366,'Cl 51 45-93 Consult 105',NULL,'LABO','567','DTK895');

INSERT INTO Sangre VALUES('A+');
INSERT INTO Sangre VALUES('A-');
INSERT INTO Sangre VALUES('O+');
INSERT INTO Sangre VALUES('O-');
INSERT INTO Sangre VALUES('B+');
INSERT INTO Sangre VALUES('B-');
INSERT INTO Sangre VALUES('AB+');
INSERT INTO Sangre VALUES('AB-');

INSERT INTO Sexo VALUES('Masculino');
INSERT INTO Sexo VALUES('Femenino');

INSERT INTO Administrativo VALUES('Admin',231,37123681,'pablito@gmail.com');
INSERT INTO Administrativo VALUES('Boss',721381,712316331,'boss@gmail.com');

/*
INSERT INTO Registro VALUES();

INSERT INTO PQRS VALUES();
*/
-----------------------------------------------------------------Selecciones---------------------------------------------------------------------------------------------
SELECT * FROM Hospital
SELECT * FROM Administrativo
SELECT * FROM PQRS
SELECT * FROM Registro
SELECT * FROM Sangre
SELECT * FROM Sexo


