create database CapturaOrdenes;

use CapturaOrdenes;

CREATE TABLE Customer
( CustNo CHAR(8),
CustFirstName VARCHAR(20)  NOT NULL,
CustLastName VARCHAR(30)  NOT NULL,
CustStreet VARCHAR(50),
CustCity VARCHAR(30),
CustState CHAR(2),
CustZip CHAR(10),
CustBal DECIMAL(12,2) DEFAULT 0,
PRIMARY KEY (CustNo) );

CREATE TABLE Employee
( EmpNo CHAR(8),
EmpFirstName VARCHAR(20)  NOT NULL,
EmpLastName VARCHAR(30)  NOT NULL,
EmpPhone CHAR(15),
EmpEMail VARCHAR(50)  NOT NULL,
SupEmpNo CHAR(8),
EmpCommRate DECIMAL(3,3),
PRIMARY KEY (EmpNo),
UNIQUE(EmpEMail),
FOREIGN KEY (SupEmpNo) REFERENCES Employee(EmpNo) );


CREATE TABLE OrderTbl
( OrdNo CHAR(8),
OrdDate DATE  NOT NULL,
CustNo CHAR(8)  NOT NULL,
EmpNo CHAR(8),
OrdName VARCHAR(50),
OrdStreet VARCHAR(50),
OrdCity VARCHAR(30),
OrdState CHAR(2),
OrdZip CHAR(10),
CONSTRAINT PKOrderTbl PRIMARY KEY (OrdNo),
FOREIGN KEY (CustNo) REFERENCES customer(CustNo),
FOREIGN KEY (EmpNo) REFERENCES Employee(EmpNo) );

CREATE TABLE Product
( ProdNo CHAR(8),
ProdName VARCHAR(50)  NOT NULL,
ProdMfg VARCHAR(20)  NOT NULL,
ProdQOH INTEGER DEFAULT 0,
ProdPrice DECIMAL(12,2) DEFAULT 0,
ProdNextShipDate DATE,
PRIMARY KEY (ProdNo) );


CREATE TABLE OrdLine
( OrdNo CHAR(8),
ProdNo CHAR(8),
Qty INTEGER DEFAULT 1,
PRIMARY KEY (OrdNo, ProdNo),
FOREIGN KEY (OrdNo) REFERENCES OrderTbl(OrdNo)
ON DELETE CASCADE,
FOREIGN KEY (ProdNo) REFERENCES Product(ProdNo) );

insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C0954327', 'Sheri', 'Gordon', '336 Hill St.', 'Littleton', 'CO', '80129-5543', 230.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C1010398', 'Jim', 'Glussman', '1432 E. Ravenna', 'Denver', 'CO', '80111-0033', 200.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C2388597', 'Beth', 'Taylor', '2396 Rafter Rd', 'Seattle', 'WA', '98103-1121', 500.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C3340959', 'Betty', 'Wise', '4334 153rd NW', 'Seattle', 'WA', '98178-3311', 200.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C3499503', 'Bob', 'Mann', '1190 Larraine Cir.', 'Monroe', 'WA', '98013-1095', 0.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C8543321', 'Ron', 'Thompson', '789 122nd St.', 'Renton', 'WA', '98666-1289', 85.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C8574932', 'Wally', 'Jones', '411 Webber Ave.', 'Seattle', 'WA', '98105-1093', 1500.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C8654390', 'Candy', 'Kendall', '456 Pine St.', 'Seattle', 'WA', '98105-3345', 50.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C9128574', 'Jerry', 'Wyatt', '16212 123rd Ct.', 'Denver', 'CO', '80222-0022', 100.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C9403348', 'Mike', 'Boren', '642 Crest Ave.', 'Englewood', 'CO', '80113-5431', 0.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C9432910', 'Larry', 'Styles', '9825 S. Crest Lane', 'Bellevue', 'WA', '98104-2211', 250.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C9543029', 'Sharon', 'Johnson', '1221 Meyer Way', 'Fife', 'WA', '98222-1123', 856.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C9549302', 'Todd', 'Hayes', '1400 NW 88th', 'Lynnwood', 'WA', '98036-2244', 0.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C9857432', 'Homer', 'Wells', '123 Main St.', 'Seattle', 'WA', '98105-4322', 500.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C9865874', 'Mary', 'Hill', '206 MacCaffrey', 'Littleton', 'CO', '80129-5543', 150.00);
insert into customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState, CustZip, CustBal) values ('C9943201', 'Harry', 'Sanders', '1280 S. Hill Rd.', 'Fife', 'WA', '98222-2258', 1000.00);


insert into Employee (EmpNO,EmpFirstName,EmpLastName,EmpPhone,EmpEmail,SupEmpNo,EmpCommRate)
values ('E9884325','Thomas','Johnson', '(303) 556-9987','TJohnson@bigco.com',null,0.05);
insert into Employee (EmpNO,EmpFirstName,EmpLastName,EmpPhone,EmpEmail,SupEmpNo,EmpCommRate)
values ('E8843211','Amy','Tang', '(303) 556-4321','ATang@bigco.com','E9884325',0.04);
insert into Employee (EmpNO,EmpFirstName,EmpLastName,EmpPhone,EmpEmail,SupEmpNo,EmpCommRate)
values ('E9345771','Colin','White', '(303) 221-4453','CWhite@bigco.com','E9884325',0.04);
insert into Employee (EmpNO,EmpFirstName,EmpLastName,EmpPhone,EmpEmail,SupEmpNo,EmpCommRate)
values ('E1329594','Landi','Santos', '(303) 789-1234','LSantos@bigco.com','E8843211',0.02);
insert into Employee (EmpNO,EmpFirstName,EmpLastName,EmpPhone,EmpEmail,SupEmpNo,EmpCommRate)
values ('E8544399','Joe','Jenkins', '(303) 221-9875','JJenkins@bigco.com','E8843211',0.02);
insert into Employee (EmpNO,EmpFirstName,EmpLastName,EmpPhone,EmpEmail,SupEmpNo,EmpCommRate)
values ('E9954302','Mary','Johnson', '(303) 556-9871','MJohnson@bigco.com','E8843211',0.02);
insert into Employee (EmpNO,EmpFirstName,EmpLastName,EmpPhone,EmpEmail,SupEmpNo,EmpCommRate)
values ('E9973110','Theresa','Beck', '(720) 320-2234','TBeck@bigco.com','E9884325',null);


insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O1116324', '2007-01-23', 'C0954327', 'E8544399', 'Sherl Gordon', '336 Hill St.', 'Littleton', 'CO', '80129-5543');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O1231231', '2007-01-23', 'C9432910', 'E9954302', 'Larry Styles', '9825 S. Crest Lane', 'Bellevue', 'Wa', '98104-221');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O1241518', '2007-02-10', 'C9549302', null, 'Todd Hayes', '1400 NW 88th', 'Lynnwood', 'WA', '98036-2244');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O1455122', '2007-01-09', 'C8574932', 'E9345771', 'Wally Jones', '411 Webber Ave.', 'Seattle', 'WA', '98105-1093');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O1579999', '2007-01-05', 'C9543029', 'E8544399', 'Tom Johnson', '1632 Ocean Dr.', 'Des Moines', 'WA', '98222-1123');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O1615141', '2007-01-23', 'C8654390', 'E8544399', 'Candy Kendall', '456 Pine St.', 'Seattle', 'WA', '98105-3345');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O1656777', '2007-02-11', 'C8543321', null, 'Ron Thompson', '789 122nd St.', 'Renton', 'WA', '98666-1289');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O2233457', '2007-01-12', 'C2388597', 'E9884325', 'Beth Taylor', '2396 Rafter Rd', 'Seattle', 'WA', '98103-1121');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O2334661', '2007-01-14', 'C0954327', 'E1329594', 'Mrs. Ruth Gordon', '233 S. 166th', 'Seattle', 'WA', '98011');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O3252629', '2007-01-23', 'C9403348', 'E9954302', 'Mike Boren', '642 Crest Ave.', 'Englewood', 'CO', '80113-5431');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O3331222', '2007-01-13', 'C1010398', null, 'Jim Glussman', '1432 E. Ravenna', 'Denver', 'CO', '80111-0033');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O3377543', '2007-01-15', 'C9128574', 'E8843211', 'Jerry Wyatt', '16212 123rd Ct.', 'Denver', 'CO', '80222-0022');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O4714645', '2007-01-11', 'C2388597', 'E1329594', 'Beth Taylor', '2396 Rafter Rd', 'Seattle', 'WA', '98103-1121');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O5511365', '2007-01-22', 'C3340959', 'E9884325', 'Betty White', '4334 153rd Nw', 'Seattle', 'WA', '98178-3311');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O6565656', '2007-01-20', 'C9865874', 'E8843211', 'Mr. Jack Sibley', '166 E. 344th', 'Renton', 'WA', '98006-5543');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O7847172', '2007-01-23', 'C9943201', null, 'Harry Sanders', '1280 S. Hill Rd.', 'Fife', 'WA', '98222-2258');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O7959898', '2007-01-19', 'C8543321', 'E8544399', 'Ron Thompson', '789 122nd St.', 'Renton', 'WA', '98666-1289');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O7989497', '2007-01-16', 'C3499503', 'E9345771', 'Bob Mann', '1190 Lorraine Cir.', 'Monroe', 'WA', '98013-1095');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O8979495', '2007-01-23', 'C9865874', null, 'Hellen Sibley', '206 McCaffrey', 'Renton', 'WA', '98006-5543');
insert into ordertbl (OrdNo, OrdDate, CustNo, EmpNo, OrdName, OrdStreet, OrdCity, OrdState, OrdZip) 
values ('O9919699', '2007-02-11', 'C9857432', 'E9954302', 'Homer Wells', '123 Main St.', 'Seattle', 'WA', '98105-4322');

insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P0036566','17 inch color Monitor','ColorMeg, Inc',12,169,'2007-02-20');
insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P0036577','19 inch color Monitor','ColorMeg, Inc',10,319,'2007-02-20');
insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P1114590','R3000 Color Laser Printer','Connex',5,699,'2007-01-22');
insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P1412138','10 foot Printer Cable','Ethlite',100,12,null);
insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P1445671','8-Outlet Surge Protector','Intersafe',33,14.99,null);
insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P1556678','CVP Ink Jet Color Printer','Connex',8,99,'2007-01-22');
insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P3455443','Color Ink Jet Cartridge','Connex',24,38,'2007-01-22');
insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P4200344','36-Bit Color Scanner','UV Components',16,199.99,'2007-01-29');
insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P6677900','Black Ink Jet Cartridge','Connex',44,25.69,null);
insert into Product (ProdNo,ProdName,ProdMfg,ProdQOH,ProdPrice,ProdNextShipDate)
values ('P9995676','Battery Back-up System','Cybercx',12,89,'2007-02-01');

insert into OrdLine(OrdNo, ProdNo,Qty) values('O1116324' , 'P1445671' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1231231' , 'P0036566' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1231231' , 'P1445671' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1241518' , 'P0036577' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1455122' , 'P4200344' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1579999' , 'P1556678' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1579999' , 'P6677900' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1579999' , 'P9995676' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1615141' , 'P0036566' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1615141' , 'P1445671' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1615141' , 'P4200344' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1656777' , 'P1445671' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O1656777' , 'P1556678' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O2233457' , 'P0036577' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O2233457' , 'P1445671' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O2233457' , 'P0036566' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O2233457' , 'P1412138' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O2334661' , 'P1556678' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O3252629' , 'P4200344' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O3252629' , 'P9995676' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O3331222' , 'P1412138' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O3331222' , 'P1556678' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O3331222' , 'P3455443' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O3377543' , 'P1445671' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O3377543' , 'P9995676' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O4714645' , 'P0036566' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O4714645' , 'P9995676' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O5511365' , 'P1412138' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O5511365' , 'P1445671' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O5511365' , 'P3455443' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O5511365' , 'P6677900' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O6565656' , 'P0036566' , 10);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O7847172' , 'P1556678' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O7847172' , 'P6677900' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O7959898' , 'P1412138' , 5);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O7959898' , 'P1556678' , 5);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O7959898' , 'P3455443' , 5);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O7959898' , 'P6677900' , 5);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O7989497' , 'P1114590' , 2);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O7989497' , 'P1412138' , 2);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O7989497' , 'P1445671' , 3);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O8979495' , 'P1114590' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O8979495' , 'P1412138' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O8979495' , 'P1445671' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O9919699' , 'P0036577' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O9919699' , 'P1114590' , 1);
insert into OrdLine(OrdNo, ProdNo,Qty) values('O9919699' , 'P4200344' , 1);


update ordertbl set OrdDate= '2007-01-23' where OrdNo= 'O1116324';
update ordertbl set OrdDate= '2007-01-23' where OrdNo= 'O1231231';
update ordertbl set OrdDate= '2007-02-10' where OrdNo= 'O1241518';
update ordertbl set OrdDate= '2007-01-09' where OrdNo= 'O1455122';
update ordertbl set OrdDate= '2007-01-05' where OrdNo= 'O1579999';
update ordertbl set OrdDate= '2007-01-23' where OrdNo= 'O1615141';
update ordertbl set OrdDate= '2007-02-11' where OrdNo= 'O1656777';
update ordertbl set OrdDate= '2007-01-12' where OrdNo= 'O2233457';
update ordertbl set OrdDate= '2007-01-14' where OrdNo= 'O2334661';
update ordertbl set OrdDate= '2007-01-23' where OrdNo= 'O3252629';
update ordertbl set OrdDate= '2007-01-13' where OrdNo= 'O3331222';
update ordertbl set OrdDate= '2007-01-15' where OrdNo= 'O3377543';
update ordertbl set OrdDate= '2007-01-11' where OrdNo= 'O4714645';
update ordertbl set OrdDate= '2007-01-22' where OrdNo= 'O5511365';
update ordertbl set OrdDate= '2007-01-20' where OrdNo= 'O6565656';
update ordertbl set OrdDate= '2007-01-23' where OrdNo= 'O7847172';
update ordertbl set OrdDate= '2007-02-19' where OrdNo= 'O7959898';
update ordertbl set OrdDate= '2007-01-16' where OrdNo= 'O7989497';
update ordertbl set OrdDate= '2007-01-23' where OrdNo= 'O8979495';
update ordertbl set OrdDate= '2007-02-11' where OrdNo= 'O9919699';