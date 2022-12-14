GO
CREATE DATABASE VideoClub
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE VideoClub
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE MEMBERSHIP(
MEM_NUM INT,
MEM_FNAME VARCHAR(40)  NOT NULL,
MEM_LNAME VARCHAR (40) NOT NULL,
MEM_STREET VARCHAR (40) NOT NULL,
MEM_CITY VARCHAR (40) NOT NULL,
MEM_STATE VARCHAR (40) NOT NULL,
MEM_ZIP INT NOT NULL,
MEM_BALANCE INT NOT NULL, 
PRIMARY KEY (MEM_NUM) 
);
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE RENTAL(
RENT_NUM INT NOT NULL,
RENT_DATE DATETIME NOT NULL,
MEM_NUM INT NOT NULL,
PRIMARY KEY (RENT_NUM),
FOREIGN KEY (MEM_NUM) REFERENCES MEMBERSHIP(MEM_NUM)
);
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRICE(
PRICE_CODE INT NOT NULL,
PRICE_DESCRIPTION VARCHAR (40) NOT NULL,
PRICE_RENTFEE REAL NOT NULL,
PRICE_DAILYLATEFEE REAL NOT NULL,
PRIMARY KEY (PRICE_CODE)
);
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE MOVIE(
MOVIE_NUM INT NOT NULL,
MOVIE_NAME VARCHAR(80) NOT NULL,
MOVIE_YEAR DATETIME NOT NULL,
MOVIE_COST REAL NOT NULL,
MOVIE_GENRE VARCHAR (40) NOT NULL,
PRICE_CODE INT NOT NULL,
PRIMARY KEY (MOVIE_NUM),
FOREIGN KEY (PRICE_CODE) REFERENCES PRICE(PRICE_CODE)
);
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE VIDEO(
VID_NUM INT NOT NULL,
VID_INDATE DATETIME NOT NULL,
MOVIE_NUM INT NOT NULL,
PRIMARY KEY (VID_NUM),
FOREIGN KEY (MOVIE_NUM) REFERENCES MOVIE(MOVIE_NUM)
);
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE DETAILRENTAL(
RENT_NUM INT NOT NULL,
VID_NUM INT NOT NULL,
DETAIL_FEE REAL NOT NULL,
DETAIL_DUEDATE DATETIME NOT NULL,
DETAIL_RETURNDATE DATETIME NULL,
DETAIL_DAILYLATEFEE INT NOT NULL,
FOREIGN KEY (RENT_NUM) REFERENCES RENTAL(RENT_NUM),
FOREIGN KEY (VID_NUM) REFERENCES VIDEO(VID_NUM)
);
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (102,'Tami','Dawson','2632 Takli Circle','Norene','TN',37136,11);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (103,'Curt','Knight','4025 Cornell Court','Flatgap','KY',41219,6);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (104,'Jamal','Melendez','788 East 145th Avenue','Quebeck','TN',38579,0);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (105,'Iva','Mcclain','6045 Musket Ball Circle','Summit','KY',42783,15);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (106,'Miranda','Parks','4469 Maxwell Place','Germantown','TN',38183,0);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (107,'Rosario','Elliott','7578 Danner Avenue','Columbia','TN',38402,5);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (108,'Mattie','Guy','4390 Evergreen Street','Lily','KY',40740,0);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (109,'Clint','Ochoa','1711 Elm Street','Greeneville','TN',37745,10);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (110,'Lewis','Rosales','4524 Southwind Circle','Counce','TN',38326,0);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (111,'Stacy','Mann','2789 East Cook Avenue','Murfreesboro','TN',37132,8);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (112,'Luis','Trujillo','7267 Melvin Avenue','Heiskell','TN',37754,3);
INSERT INTO MEMBERSHIP (MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_STATE,MEM_ZIP,MEM_BALANCE) VALUES (113,'Minnie','Gonzales','6430 Vasili Drive','Williston','TN',38076,0);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RENTAL (RENT_NUM,RENT_DATE,MEM_NUM) VALUES (1001,'01-MAR-09',103);
INSERT INTO RENTAL (RENT_NUM,RENT_DATE,MEM_NUM) VALUES (1002,'01-MAR-09',105);
INSERT INTO RENTAL (RENT_NUM,RENT_DATE,MEM_NUM) VALUES (1003,'02-MAR-09',102);
INSERT INTO RENTAL (RENT_NUM,RENT_DATE,MEM_NUM) VALUES (1004,'02-MAR-09',110);
INSERT INTO RENTAL (RENT_NUM,RENT_DATE,MEM_NUM) VALUES (1005,'02-MAR-09',111);
INSERT INTO RENTAL (RENT_NUM,RENT_DATE,MEM_NUM) VALUES (1006,'02-MAR-09',107);
INSERT INTO RENTAL (RENT_NUM,RENT_DATE,MEM_NUM) VALUES (1007,'02-MAR-09',104);
INSERT INTO RENTAL (RENT_NUM,RENT_DATE,MEM_NUM) VALUES (1008,'03-MAR-09',105);
INSERT INTO RENTAL (RENT_NUM,RENT_DATE,MEM_NUM) VALUES (1009,'03-MAR-09',111);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO PRICE(PRICE_CODE,PRICE_DESCRIPTION,PRICE_RENTFEE,PRICE_DAILYLATEFEE)VALUES(1,'Standard',2,1);
INSERT INTO PRICE(PRICE_CODE,PRICE_DESCRIPTION,PRICE_RENTFEE,PRICE_DAILYLATEFEE)VALUES(2,'New Release',3.5,3);
INSERT INTO PRICE(PRICE_CODE,PRICE_DESCRIPTION,PRICE_RENTFEE,PRICE_DAILYLATEFEE)VALUES(3,'Discount',1.5,1);
INSERT INTO PRICE(PRICE_CODE,PRICE_DESCRIPTION,PRICE_RENTFEE,PRICE_DAILYLATEFEE)VALUES(4,'Weekly Special',1,0.5);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MOVIE(MOVIE_NUM,MOVIE_NAME,MOVIE_YEAR,MOVIE_COST,MOVIE_GENRE,PRICE_CODE)VALUES(1234,'the cesar family christmas','01-01-07',39.95,'FAMILY',2);
INSERT INTO MOVIE(MOVIE_NUM,MOVIE_NAME,MOVIE_YEAR,MOVIE_COST,MOVIE_GENRE,PRICE_CODE)VALUES(1235,'Smokey Mountain Wildllife','01-01-04',59.95,'ACTION',1);
INSERT INTO MOVIE(MOVIE_NUM,MOVIE_NAME,MOVIE_YEAR,MOVIE_COST,MOVIE_GENRE,PRICE_CODE)VALUES(1236,'Richard Goodhope','01-01-08',59.95,'DRAMA',2);
INSERT INTO MOVIE(MOVIE_NUM,MOVIE_NAME,MOVIE_YEAR,MOVIE_COST,MOVIE_GENRE,PRICE_CODE)VALUES(1237,'Beatnik Fever','01-01-07',29.95,'COMEDY',2);
INSERT INTO MOVIE(MOVIE_NUM,MOVIE_NAME,MOVIE_YEAR,MOVIE_COST,MOVIE_GENRE,PRICE_CODE)VALUES(1238,'Constant Companion','01-01-08',89.95,'DRAMA',2);
INSERT INTO MOVIE(MOVIE_NUM,MOVIE_NAME,MOVIE_YEAR,MOVIE_COST,MOVIE_GENRE,PRICE_CODE)VALUES(1239,'Where Hope Dies','01-01-1998',25.49,'DRAMA',3);
INSERT INTO MOVIE(MOVIE_NUM,MOVIE_NAME,MOVIE_YEAR,MOVIE_COST,MOVIE_GENRE,PRICE_CODE)VALUES(1245,'Time to Burn','01-01-05',45.49,'ACTION',1);
INSERT INTO MOVIE(MOVIE_NUM,MOVIE_NAME,MOVIE_YEAR,MOVIE_COST,MOVIE_GENRE,PRICE_CODE)VALUES(1246,'What He Doesn?t Know','01-01-06',58.29,'COMEDY',1);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(54321,'18-JUN-08',1234);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(54324,'18-JUN-08',1234);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(54325,'18-JUN-08',1234);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(34341,'22-JAN-07',1235);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(34342,'22-JAN-07',1235);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(34366,'02-MAR-09',1236);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(34367,'02-MAR-09',1236);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(34368,'02-MAR-09',1236);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(34369,'02-MAR-09',1236);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(44392,'21-OCT-08',1237);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(44397,'21-OCT-08',1237);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(59237,'14-FEB-09',1237);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(61388,'25-JAN-07',1239);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(61353,'28-JAN-06',1245);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(61354,'28-JAN-06',1245);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(61367,'30-JUL-08',1246);
INSERT INTO VIDEO(VID_NUM,VID_INDATE,MOVIE_NUM)VALUES(61369,'30-JUL-08',1246);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1001,34342,2,'04-MAR-09','02-MAR-09',1);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1001,61353,2,'04-MAR-09','03-MAR-09',1);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1002,59237,3.5,'04-MAR-09','04-MAR-09',3);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1003,54325,3.5,'04-MAR-09','09-MAR-09',3);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1003,61369,2,'06-MAR-09','09-MAR-09',1);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1003,61388,0,'06-MAR-09','09-MAR-09',1);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1004,44392,3.5,'05-MAR-09','07-MAR-09',3);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1004,34367,3.5,'05-MAR-09','07-MAR-09',3);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1004,34341,2,'07-MAR-09','07-MAR-09',1);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1005,34342,2,'07-MAR-09','05-MAR-09',1);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1005,44397,3.5,'05-MAR-09','05-MAR-09',3);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1006,34366,3.5,'05-MAR-09','04-MAR-09',3);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1006,61367,2,'07-MAR-09','',1);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1007,34368,3.5,'05-MAR-09','',3);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1008,34369,3.5,'05-MAR-09','05-MAR-09',3);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1009,54324,3.5,'05-MAR-09','',3);
INSERT INTO DETAILRENTAL (RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE) VALUES (1001,34366,3.5,'04-MAR-09','02-MAR-09',3);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM DETAILRENTAL
SELECT * FROM MEMBERSHIP
SELECT * FROM MOVIE
SELECT * FROM PRICE
SELECT * FROM RENTAL
SELECT * FROM VIDEO