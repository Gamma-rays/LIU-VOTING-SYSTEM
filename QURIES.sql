CREATE TABLE Branch(BranchId varchar(25) not null, 
                    Branch_Name varchar(255), 
					Region varchar(25), 
					District varchar(25), 
					primary key(BranchId));
					
INSERT INTO `fulla`.`branch` (
`BranchId` ,
`Branch_Name` ,
`Region` ,
`District`
)
VALUES (
'FS/KB001', 'KAMPALA BRANCH', 'CENTRAL UGANDA', 'KAMPALA'
), (
'FS/AB/001', 'ADJUMANI', 'WEST NILE REGION', 'ADJUMANI'
);

create table Employees(EmployeeId varchar(25) NOT NULL,
                       FirstName varchar(25), 
					   LastName varchar(25), 
					   Gender varchar(1), 
					   Email varchar(25), 
					   Region varchar(25), 
					   District varchar(25), 
					   BranchId varchar(25) NOT NULL, 
					   Employee_Type ENUM('Manager', 'Support Staff') NOT NULL,
					   PRIMARY KEY(EmployeeId),
					   FOREIGN KEY(BranchId) REFERENCES Branch(branchId));
					   
INSERT INTO employees(EmployeeId,
                      FirstName,
                      LastName,
                      Gender,
                      Email,
					  Region,
					  District,
                      BranchId,
                      Employee_Type)
                        VALUES ('EM001',
        						'GAMA', 
								'RICHARD', 
								'M', 
								'angel@gmail.com',
								'CENTRAL', 
								'KAMPALA', 
								'FS/NB001', 
								'Manager'),
								
								('ES001', 
								'LEMIYA', 
								'EUNICE', 
								'F', 
								'tom@gmail.com', 
								'CENTRAL', 
								'KAMPALA', 
								'FS/NB001', 
								'S_Staff');

create table Manager(EmployeeId varchar(25) NOT NULL,
                     Allowance int NOT NULL,
                     primary key(employeeId),
                     FOREIGN KEY (employeeId) REFERENCES Employees(employeeId));
					 
create table Support_Staff(EmployeeId varchar(25) not null,
                           Job_title varchar(25), 
						   primary key(employeeId), 
						   FOREIGN KEY(employeeId) REFERENCES Employees(employeeId));

create table customer(CustomerId varchar(25) NOT NULL, 
                      Telephone varchar(25) NOT NULL, 
					  Region varchar(25), 
					  District varchar(25),
                      Customer_Type ENUM('Individual','Organisation') NOT NULL DEFAULT 'individual',					  
					  primary key(customerId)); 
					   

create table individual(CustomerId varchar(25) not null, 
                        First_Name varchar(25) not null, 
						Last_Name varchar(25) not null, 
						Gender varchar(1) not null, 
						Birth_Date DATE, 
						primary key(CustomerId), 
						FOREIGN KEY(CustomerId) REFERENCES customer(customerId));
						
						
INSERT INTO `fulla`.`individual` (
`CustomerId` ,
`First_Name` ,
`Last_Name` ,
`Gender` ,
`Birth_Date`
)
VALUES (
'CU-2018-I-0001', 'KYARUHAGA', 'JOSHUA', 'M', '1994-10-11'
), (
'CU-2018-I-0002', 'YATA', 'MIKE', 'M', '1997-10-08'
);

create table organization(customerId varchar(25) not null, 
                          TIN varchar(25) not null, 
                          Name varchar(255) not null, 
						  Org_Type varchar(25), 
					      primary key(customerId), 
						  FOREIGN KEY(customerId) REFERENCES customer(customerId));
INSERT INTO `fulla`.`loan` (
`LoanId` ,
`Principal` ,
`Duration` ,
`Interest` ,
`Loan_Date` ,
`CustomerId` ,
`BranchId`
)
VALUES (
'LKB-2018-0001', '1000000', '12 MONTHS', '5 %', '2015-10-30', 'CU-2018-I-0001', 'FS/KB001'
), (
'LMB-2018-0001', '20000000', '21 MONTHS', '5 %', '2016-10-06', 'CU-2018-O-0006', 'FS/MB001'
);

INSERT INTO `fulla`.`payment` (
`Receipt_No` ,
`Amount` ,
`Payment_Date` ,
`Description` ,
`LoanId`
)
VALUES (
'RE-2018-0001', '700000', '2018-04-02', 'FIRST INSTALMENT', 'LKB-2018-0001'
), (
'RE-2018-0002', '800000', '2018-08-06', 'SECOND INSTALMENT', 'LKB-2018-0001'
)					  
						  
INSERT INTO `fulla`.`organization` (
`customerId` ,
`TIN` ,
`Name` ,
`Org_Type`
)
VALUES (
'CU-2018-O-0005', 'URA-20001', 'WINDLETRUST UGANDA', NULL
), (
'CU-2018-O-0006', 'URA-30002', 'KING''S COLLEDGE BUDO', NULL
);

create table Loan(LoanId varchar(25) not null, 
                  Principal int, 
				  Duration varchar(25), 
				  Interest varchar(25), 
				  Loan_Date DATE, 
				  CustomerId varchar(25), 
				  BranchId varchar(25), 
				  primary key(loanId), 
				  foreign key(CustomerId) references customer(customerId), 
				  FOREIGN KEY(BranchId) references Branch(branchId));


create table Payment(Receipt_No varchar(25) not null, 
                     Amount int not null,
					 Payment_Date DATE, 
					 Description varchar(100), 
					 LoanId varchar(25), 
					 primary key(Receipt_No), 
					 foreign key(loanId) references Loan(loanId));
					 
INSERT INTO `payment` (`Receipt_No`, `Amount`, `Payment_Date`, `Description`, `LoanId`) 
VALUES ('R-2018-001', '700000', '2017-05-08', 'FIRST INSTALMENT', 'L-AB005-2018-0001'),
 ('RE-2017-0002', '500000', '2017-10-10', 'SECOND INSTALMENT', 'L-AB005-2018-0001'), 
 ('RE-2018-003', '1500000', '2018-05-09', 'FIRST INTALMENT', 'L-AB006-2018-0002'), 
 ('RE-2017-0004', '10000000', '2017-01-06', 'FIRST INSTALMENT', 'L-B007-2016-0009'), 
 ('RE-2017-0005', '25000000', '2017-11-14', 'SECOND INSTALMENT', 'L-B007-2016-0009'), 
 ('RE-2018-0006', '25000000', '2018-11-07', 'FIRST INSTALMET', 'L-MB004-2018-0007'), 
 ('RE-2018-0007', '8000000', '2017-03-15', 'FIRST INSTALMET', 'L-MB003-2015-0006'), 
 ('RE-2017-0008', '8000000', '2017-11-06', 'SECOND INSTALMENT', 'L-MB003-2015-0006'), 
 ('RE-2018-0009', '26000000', '2018-11-05', 'FULL PAYMENT', 'L-HB001-2018-0005'), 
 ('RE-2018-0010', '7000000', '2018-11-05', 'FIRST INSTALMENT', 'L-MB004-2018-0007');
					 
INSERT INTO `fulla`.`employees` (
`EmployeeId` ,
`FirstName` ,
`LastName` ,
`Gender` ,
`Email` ,
`Region` ,
`District` ,
`BranchId` ,
`Employee_Type`
)
VALUES (
'EM001', 'GAMA', 'RICHARD', 'M', 'gamarays@gmail.com', 'CENTRAL UGANDA', 'KAMPALA', 'FS/KB001', 'Manager'
), (
'ES001', 'LEMIYA', 'EUNICE', 'F', 'lemiya@gmail.com', 'CENTRAL UGANDA', 'KAMPALA', 'FS/KB001', 'Support Staff'
);
					 
INSERT INTO `fulla`.`support_staff` (
`EmployeeId` ,
`Job_title`
)
VALUES (
'ES001', 'ACCOUNTANT'
);					 
					 
insert into customer(CustomerId, 
                     Telephone,
					 Region, 
					 District) 
			values('CU-2018-I-0003', 
			       '+211923107180', 
				   'NORTHERN UGANDA', 
				   'ADJUMANI'),
				   
				   ('CU-2018-I-0004', 
			       '+211923134180', 
				   'WESTERN UGANDA', 
				   'MBARARA'), 
				   
				   ('CU-2018-O-0005', 
			       '+211923107180', 
				   'WESTERN UGANDA', 
				   'KASESE'),
				   
				   ('CU-2018-O-0006', 
			       '+211923107145', 
				   'WESTERN UGANDA', 
				   'KABALE'),
				   
				   ('CU-2018-O-0007', 
			       '+211923107145', 
				   'WESTERN UGANDA', 
				   'SOROTI'),
				   
				   ('CU-2018-O-0008', 
			       '+211923107145', 
				   'WESTERN UGANDA', 
				   'JINJA'),

				  ('CU-2018-O-0009', 
				   '+256778843413', 
				   'EASTERN UGANDA', 
				   'MBALE');

insert into loan() values('NL/2018/I/002', 
                          '2500000', 
						  '18 MONTHS', 
						  '5%', 
						  '2016-12-08', 
						  'CU/2018/0002', 
						  'FS/NB02'),
						 ('NL/2018/I/003', 
						  '1000000', 
						  '6 MONTHS', 
						  '5%', 
						  '2017-12-08', 
						  'CU/2018/0001', 'FS/NB01'),
						 ('NL/2018/I/004', 
						  '500000', 
						  '3 MONTHS', 
						  '5%', 
						  '2018-07-08', 
						  'CU/2018/0002', 
						  'FS/NB02'),
						 ('NL/2018/I/005', 
						  '2000000', 
						  '18 MONTHS', 
						  '5%', 
						  '2018-02-08', 
						  'CU/2018/0001', 
						  'FS/NB01'),
						 ('NL/2018/I/007', 
						  '2000000', 
						  '18 MONTHS', 
						  '5%', 
						  '2014-12-08', 
						  'CU/2018/0001', 
						  'FS/NB01');
						  
SUB QURIES REFERS TO QURIES WITH QURIES;
mysql> select principal, duration, loan_date from loan where loanid not IN  (select loanid from payment);
+-----------+-----------+------------+
| principal | duration  | loan_date  |
+-----------+-----------+------------+
|   1000000 | 12 MONTHS | 2015-10-30 |
|  20000000 | 21 MONTHS | 2016-10-06 |
+-----------+-----------+------------+
2 rows in set (0.00 sec)

mysql> select principal, duration, loan_date from loan where loanid  IN(select loanid from payment);
+-----------+-----------+------------+
| principal | duration  | loan_date  |
+-----------+-----------+------------+
|   1000000 | 12 MONTHS | 2015-10-30 |
|  20000000 | 21 MONTHS | 2016-10-06 |
+-----------+-----------+------------+
2 rows in set (0.00 sec)

mysql> select principal, duration, loan_date from loan where loanid  IN(select loanid from payment);
+-----------+-----------+------------+
| principal | duration  | loan_date  |
+-----------+-----------+------------+
|   1000000 | 12 MONTHS | 2015-10-30 |
|  20000000 | 21 MONTHS | 2016-10-06 |
+-----------+-----------+------------+
2 rows in set (0.00 sec)


Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| fullasaco          |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
6 rows in set (0.00 sec)

MariaDB [(none)]> use fullasaco;
Database changed
MariaDB [fullasaco]> show tables;
+---------------------+
| Tables_in_fullasaco |
+---------------------+
| branch              |
| customer            |
| employees           |
| individual          |
| loan                |
| manager             |
| organization        |
| payment             |
| support_staff       |
+---------------------+
9 rows in set (0.00 sec)

MariaDB [fullasaco]> select * from branch;
+----------+-----------------+----------+----------+
| BranchId | Branch_Name     | Region   | District |
+----------+-----------------+----------+----------+
| FS-AB005 | ARUA BRANCH     | NORTHERN | ARUA     |
| FS-AB006 | ADJUMANI BRANCH | NORTHERN | ADJUMANI |
| FS-GB001 | GULU BRANCH     | NORTHERN | GULU     |
| FS-HB001 | HOIMA           | WESTERN  | HOIMA    |
| FS-MB003 | MBALA           | EASTERN  | MBALA    |
| FS-MB004 | MBARARA BRANCH  | EASTERN  | MBARARA  |
| FS-MB008 | KABALE          | SOUTHERN | KABALE   |
| FS-NB001 | NIMULE BRANCH   | CENTRAL  | KAMPALA  |
| FS-NB002 | MALAKIA BRANCH  | CENTRAL  | KAMPALA  |
| FS-SB007 | SOROTI BRANCH   | EASTERN  | SOROTI   |
+----------+-----------------+----------+----------+
10 rows in set (0.35 sec)

MariaDB [fullasaco]> select * from customer;
+----------------+---------------+-----------------+----------+---------------+
| CustomerId     | Telephone     | Region          | District | Customer_Type |
+----------------+---------------+-----------------+----------+---------------+
| CU-2018-I-0003 | +211923107180 | NORTHERN UGANDA | ADJUMANI | Individual    |
| CU-2018-I-0004 | +211923134180 | WESTERN UGANDA  | MBARARA  | Individual    |
| CU-2018-O-0005 | +211923107180 | WESTERN UGANDA  | KASESE   | Organisation  |
| CU-2018-O-0006 | +211923107145 | WESTERN UGANDA  | KABALE   | Organisation  |
| CU-2018-O-0007 | +211923107145 | WESTERN UGANDA  | SOROTI   | Organisation  |
| CU-2018-O-0008 | +211923107145 | WESTERN UGANDA  | JINJA    | Organisation  |
| CU-2018-O-0009 | +256778843413 | EASTERN UGANDA  | MBALE    | Organisation  |
+----------------+---------------+-----------------+----------+---------------+
7 rows in set (0.06 sec)

MariaDB [fullasaco]> select * from employeess
    -> ;
ERROR 1146 (42S02): Table 'fullasaco.employeess' doesn't exist
MariaDB [fullasaco]> select * from employees;
+------------+-----------+----------+--------+---------------------+----------+----------+----------+---------------+
| EmployeeId | FirstName | LastName | Gender | Email               | Region   | District | BranchId | Employee_Type |
+------------+-----------+----------+--------+---------------------+----------+----------+----------+---------------+
| EMAB-0001  | GAMA      | RICHARD  | M      | angel@gmail.com     | NORTHERN | ADJUMANI | FS-AB006 | Manager       |
| EMAB002    | LEMIYA    | EUNICE   | F      | lemiya@gmail.com    | CENTRAL  | KAMAPALA | FS-AB006 | Support Staff |
| EMAB003    | GUYA      | JOEL     | M      | guya@gmail.com      | ARUA     | ARUA     | FS-AB005 | Manager       |
| EMGB001    | YATA      | MIKE     | M      | yata@gmail.com      | GULU     | GULU     | FS-GB001 | Manager       |
| EMGB002    | LUCKY     | MONDAY   | M      | luckyboy@yahoo.com  | CENTRAL  | KABALE   | FS-GB001 | Support Staff |
| EMHB001    | KYA       | JOSH     | M      | kyajoshua@gmail.com | WESTERN  | HOIMA    | FS-HB001 | Manager       |
| EMHB002    | JUAN      | JANE     | F      | jjanae@gmail.com    | WESTERN  | HOIMA    | FS-HB001 | Support Staff |
| EMMB001    | IVAN      | SENDER   | M      | ivan@gmail.com      | EASTERN  | MBARARA  | FS-MB003 | Manager       |
| EMMB002    | JOYCE     | JOHN     | F      | jjohn@gmail.com     | EASTERN  | MBARARA  | FS-MB003 | Support Staff |
| EMMB003    | HAMANI    | MOKIRIZA | M      | mokiriza@gmail.com  | EASTERN  | MBALE    | FS-MB004 | Manager       |
| EMMB004    | ABAU      | JACKLINE | F      | jackay@yahoo.com    | EASTERN  | MBALE    | FS-MB004 | Support Staff |
+------------+-----------+----------+--------+---------------------+----------+----------+----------+---------------+
11 rows in set (0.06 sec)

MariaDB [fullasaco]> create user Acountants identified by Acount2018;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Acount20
18' at line 1
MariaDB [fullasaco]> create user Acountants identified by Acount2018;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Acount20
18' at line 1
MariaDB [fullasaco]>
MariaDB [fullasaco]> create user Acountants identified by system;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'system'
at line 1
MariaDB [fullasaco]> create user accountant identified by ssystem;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ssystem'
 at line 1
MariaDB [fullasaco]> create user accountant identified by system;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'system'
at line 1
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]> create user accountant identified BY system;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'system'
at line 1
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]> create user accountant identified BY system;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'system'
at line 1
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]> Ccreate view organisation as select * from customer where customer_type=''Organisation;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Ccreate
view organisation as select * from customer where customer_type=''Organi' at line 1
MariaDB [fullasaco]>
MariaDB [fullasaco]> create view organisation as select * from customer where customer_type=''Organisation;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Organisa
tion' at line 1
MariaDB [fullasaco]>
MariaDB [fullasaco]> create view organisation as select * from customer where customer_type='Organisation';
Query OK, 0 rows affected (0.09 sec)

MariaDB [fullasaco]> select * from organisation;
+----------------+---------------+----------------+----------+---------------+
| CustomerId     | Telephone     | Region         | District | Customer_Type |
+----------------+---------------+----------------+----------+---------------+
| CU-2018-O-0005 | +211923107180 | WESTERN UGANDA | KASESE   | Organisation  |
| CU-2018-O-0006 | +211923107145 | WESTERN UGANDA | KABALE   | Organisation  |
| CU-2018-O-0007 | +211923107145 | WESTERN UGANDA | SOROTI   | Organisation  |
| CU-2018-O-0008 | +211923107145 | WESTERN UGANDA | JINJA    | Organisation  |
| CU-2018-O-0009 | +256778843413 | EASTERN UGANDA | MBALE    | Organisation  |
+----------------+---------------+----------------+----------+---------------+
5 rows in set (0.05 sec)

MariaDB [fullasaco]> show tables;
+---------------------+
| Tables_in_fullasaco |
+---------------------+
| branch              |
| customer            |
| employees           |
| individual          |
| loan                |
| manager             |
| organisation        |
| organization        |
| payment             |
| support_staff       |
+---------------------+
10 rows in set (0.00 sec)

MariaDB [fullasaco]> drop view organisation;
Query OK, 0 rows affected (0.00 sec)

MariaDB [fullasaco]> create view campany as customerid, telephone, region, district from customer where customer_type='organisation';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'customer
id, telephone, region, district from customer where customer_type='organ' at line 1
MariaDB [fullasaco]>
MariaDB [fullasaco]> create view campany as select customerid, telephone, region, district from customer where customer_type='organisation';
Query OK, 0 rows affected (0.11 sec)

MariaDB [fullasaco]> select * from organisation;
ERROR 1146 (42S02): Table 'fullasaco.organisation' doesn't exist
MariaDB [fullasaco]> select * from campany;
+----------------+---------------+----------------+----------+
| customerid     | telephone     | region         | district |
+----------------+---------------+----------------+----------+
| CU-2018-O-0005 | +211923107180 | WESTERN UGANDA | KASESE   |
| CU-2018-O-0006 | +211923107145 | WESTERN UGANDA | KABALE   |
| CU-2018-O-0007 | +211923107145 | WESTERN UGANDA | SOROTI   |
| CU-2018-O-0008 | +211923107145 | WESTERN UGANDA | JINJA    |
| CU-2018-O-0009 | +256778843413 | EASTERN UGANDA | MBALE    |
+----------------+---------------+----------------+----------+
5 rows in set (0.00 sec)

MariaDB [fullasaco]>
MariaDB [fullasaco]> select * from customer;
+----------------+---------------+-----------------+----------+---------------+
| CustomerId     | Telephone     | Region          | District | Customer_Type |
+----------------+---------------+-----------------+----------+---------------+
| CU-2018-I-0003 | +211923107180 | NORTHERN UGANDA | ADJUMANI | Individual    |
| CU-2018-I-0004 | +211923134180 | WESTERN UGANDA  | MBARARA  | Individual    |
| CU-2018-O-0005 | +211923107180 | WESTERN UGANDA  | KASESE   | Organisation  |
| CU-2018-O-0006 | +211923107145 | WESTERN UGANDA  | KABALE   | Organisation  |
| CU-2018-O-0007 | +211923107145 | WESTERN UGANDA  | SOROTI   | Organisation  |
| CU-2018-O-0008 | +211923107145 | WESTERN UGANDA  | JINJA    | Organisation  |
| CU-2018-O-0009 | +256778843413 | EASTERN UGANDA  | MBALE    | Organisation  |
+----------------+---------------+-----------------+----------+---------------+
7 rows in set (0.00 sec)

MariaDB [fullasaco]> select * from organisation;
ERROR 1146 (42S02): Table 'fullasaco.organisation' doesn't exist
MariaDB [fullasaco]> select * from organization;
+----------------+--------------+------------------------------------+----------------------+
| customerId     | TIN          | Name                               | Org_Type             |
+----------------+--------------+------------------------------------+----------------------+
| CU-2018-O-0005 | URA-2018-002 | WINDLE TRUST UGANDA                | CHARITY ORGANISATION |
| CU-2018-O-0006 | URA-2017-001 | BUGEMA UNIVERSITY                  | UNIVERSITY           |
| CU-2018-O-0007 | URA-2018-003 | BUGEMA ADVENTIST SECONDARY SCHOOL  | SCHOOL               |
| CU-2018-O-0008 | URA-2015-002 | BUGEMA UNIVERSITY CHRISTIAN UNION  | CHURCH               |
| CU-2018-O-0009 | URA-2015-003 | BUGEMA ADVANTIST SECONADARY SCHOOL | SCHOOL               |
+----------------+--------------+------------------------------------+----------------------+
5 rows in set (0.00 sec)

MariaDB [fullasaco]> select * from individual;
+----------------+------------+-----------+--------+------------+
| CustomerId     | First_Name | Last_Name | Gender | Birth_Date |
+----------------+------------+-----------+--------+------------+
| CU-2018-I-0003 | KYARUHAGA  | JOSHUA    | M      | 2016-11-15 |
| CU-2018-I-0004 | GUYA       | JOEL      | M      | 2017-11-12 |
+----------------+------------+-----------+--------+------------+
2 rows in set (0.00 sec)

MariaDB [fullasaco]> create view Company as select customer.customerid, organization.tin,organization.name,organization.org_type customer.telephone, customer.region,
 customer.district from customer inner join organization on customer.customerid=organization.customerid where customer.customer_type='organisation';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '.telepho
ne, customer.region, customer.district from customer inner join organiza' at line 1
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]> create view Company as select customer.customerid, organization.tin,organization.name,organization.org_type customer.telephone, customer.region,
 customer.district from customer inner join organization on customer.customerid=organization.customerid where customer.customer_type='organisation';^X
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '.telepho
ne, customer.region, customer.district from customer inner join organiza' at line 1
    ->
    ->
    ->
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '↑' at li
ne 1
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]>
MariaDB [fullasaco]> create view Company as select customer.customerid, organization.tin,organization.name,organization.org_type, customer.telephone, customer.region
, customer.district from customer inner join organization on customer.customerid=organization.customerid where customer.customer_type='organisation';
Query OK, 0 rows affected (0.07 sec)

MariaDB [fullasaco]> select * from company;
+----------------+--------------+------------------------------------+----------------------+---------------+----------------+----------+
| customerid     | tin          | name                               | org_type             | telephone     | region         | district |
+----------------+--------------+------------------------------------+----------------------+---------------+----------------+----------+
| CU-2018-O-0005 | URA-2018-002 | WINDLE TRUST UGANDA                | CHARITY ORGANISATION | +211923107180 | WESTERN UGANDA | KASESE   |
| CU-2018-O-0006 | URA-2017-001 | BUGEMA UNIVERSITY                  | UNIVERSITY           | +211923107145 | WESTERN UGANDA | KABALE   |
| CU-2018-O-0007 | URA-2018-003 | BUGEMA ADVENTIST SECONDARY SCHOOL  | SCHOOL               | +211923107145 | WESTERN UGANDA | SOROTI   |
| CU-2018-O-0008 | URA-2015-002 | BUGEMA UNIVERSITY CHRISTIAN UNION  | CHURCH               | +211923107145 | WESTERN UGANDA | JINJA    |
| CU-2018-O-0009 | URA-2015-003 | BUGEMA ADVANTIST SECONADARY SCHOOL | SCHOOL               | +256778843413 | EASTERN UGANDA | MBALE    |
+----------------+--------------+------------------------------------+----------------------+---------------+----------------+----------+
5 rows in set (0.00 sec)

Dolan, J.  (2009). Accelerating  the  Development  of  Mobile  Money  Ecosystems.  Washington,  DC: IFC  and the Harvard Kennedy School.

ROLES OF DFD
NO INTERNAL ENTITY 
YOU CAN REPEAT ENTITY
NO MIRACLES OR BLACK
DATA STORES ARE NOT SINKS OR SOURCES
NO DIRECT CONNECTION BTN 2 EXTERNAL ENTITY AND DATA STORES


