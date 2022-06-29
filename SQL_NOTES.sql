--CLASS-1
--SQL - Structured Query language
--PL/SQl - Progarmming Language SQL

--diffrent versions RDBMS
 --1.SQL server - Microsoft
--2.SQL developer - Oracle
--3.Tera data - Teradata
--4.DB2 - IBM
--5.MangoDB - Open Source
--6.MySQL - open source  etc 


--Q.What is data?
--Collection of meaniful information.
--OR
--Collection record information.

--Q. What is database(DBMS)?
--It is collection of data in file format.
--ex:Excel,word file,text file, notepad , notepad++ etc.

--It stores less amount of data 
--no relationship between two files or tables 


--Q.What is RDBMS(Relational data base management system)?
--It is collection of table related information.
--It stores huge amount of data and to extract the data we have a simple language i.e. SQL
--There is relation between two or more tables.

--Q.what is table ?
--It is collection of rows and columns.

--There are two types of databases
--1.System defined database
--2.User defined database

--There are four types of system defined data bases 
--1.Master --Default DB for SQL
--2.Model
--3.Msdb
--4.tempdb

--SQL is not a case sensitive language
--The meaning 'A' is always same 'a'
--for ex: 'AMAR' it has same meaning of 'amar'

--Q.How to create the Database testing18?

Create database Testing18

--Q.how to execute SQL statements? 4
--1.By using Execute tab form top 
--2.By pressing F5 key from key board

--Q.How to navigate to Testing18 database?
use testing18


--In SQL
--Blue color indicates system defined keywords
--for ex
create, use, insert etc
--Pink color indicates system defined functions 
--for ex
sum,min,max etc 

--CLASS-2
--Data types 
--Type of data/value of an object can hold is known as data type.
--1.Numeric data type 

--1.BIT (binary digit )
--It stores value 0 or 1
--Storage size: 8 Byte
create table shubham
(id bit,sname char(10))

insert into shubham  values (1,'#shubham')
insert into shubham  values (1,'#shubham12')

insert into shubham  values (0,'hubham')

insert into shubham  values (0,'#shubham')
insert into shubham  values (null,'#shm')
insert into shubham  values (2,'#san12')
insert into shubham  values (3,'#smnj14')
select * from shubham

declare @value bit=0;
print @value;
select @value bshubham
---set @value =2 
--2.TINYINT 
--It will store the value ranging from 0 to 255 

declare @value tinyint=255;
print @value;
select @value as tinytype
--Storage size: 1 Byte

--3.SMALLINT
--It will store value ranging -32768 to 32767
--Storage size: 2 Byte
declare @value smallint=-32768;
print @value;
select @value as smalltype


--4.Decimal
--an exact fixed point number 

--5. INT
--it stores an integer value i.e. ranging from -2147483648 to 2147483647
--Storage size: 4 Byte


--2.Approximate numeric data type 
--1.Float 
--It will store floating point number range is -1.8E to 308 to 1.8E to 308
--for Ex: 8.2345, 0.9876 etc
create table shubham1
(id decimal,sname char(10))
select * from shubham1

insert into shubham1 values (0.2,'hubham')

insert into shubham1  values (0.5,'#shubham')
insert into shubham1 values (null,'#shm')
insert into shubham1 values (1,'#san12')
insert into shubham1  values (3,'#smnj14')

insert into shubham1  values (2,'#san12')
insert into shubham1  values (3.5,'#smnj14')

-- float
DECLARE @MyFLoat float = 0.1111111111111111111111111111111111111  -- 15 digit precision output
SELECT @MyFLoat AS MyFloat


--2.Real
--It will also store an floating point numbers -3.40E to 38 to 3.40E to 38
-- real
DECLARE @MyReal real = 0.1111111111111111111111111111111111111  -- 7 digit precision output
SELECT @MyReal AS MyReal

--3.String or charecter data types 
--1.Char -A-Z,a-z and special character and numbers i.e 0-9 
--Static memory allocation and it size 8000 charecters.
--For EX: char(5) - it will block or cease 5 blocks of memory - M, F remaing 4 blocks is wastage
-- char
DECLARE @MyChar char(5)= 'abcdefgh' -- 20 bytes used
SELECT @MyChar AS MyChar

--2.varchar -- A-Z,a-z and special character and numbers i.e 0-9 
--Dynamic memory allocation and i t size 8000 charecters.
--For EX: varchar(5) - it will not block or cease 5 blocks of memory insted it will use as per column - M, F remaing 4 blocks it will release.
-- char
DECLARE @MyChar varchar(20) = 'abcdefgh' -- 8 bytes used
SELECT @MyChar AS MyChar
--Char
 declare @value char(10) ='ABC';
 print @value;
 print datalength(@value);
 print len(@value);


 --nchar
declare @nvalue nchar(10) ='ABC';
 print @nvalue;
 print datalength(@nvalue);
 print len(@nvalue);



--varchar
 declare @charvalue varchar(10) ='ABC';
 print @charvalue;
 print datalength(@charvalue);
 print len(@charvalue);



 --nvarchar
 declare @ncharvalue nvarchar(10) ='ABC';
 print @ncharvalue;
 print datalength(@ncharvalue);
 print len(@ncharvalue);



 --3.nchar
 --Static memory allocation and it size 4000 charecters.
 --(fixed,4000(2 bytes)

 declare @value nchar(10) ='ABC';
 print @value;
 print datalength(@value);
 print len(@value);



--2.nvarchar
--Dynamic memory allocation and it size 4000 charecters.
--(Dynamic(variable lenght),4000(2 bytes)

 declare @charvalue nvarchar(10) ='ABC';
 print @charvalue;
 print datalength(@charvalue);
 print len(@charvalue);

 --4.Date time data type 

 --1.Date  
 --You can define or insert the date in multiple formats like YYYY/MM/DD, DD/MM/YYYY ,MM/DD/YYYY etc.
--Storage size: 3 Bytes
-- declare variable and set to Jan 1 2020

DECLARE @MyDate date = '2020-01-01'
--SELECT @MyDate
print @mydate;
print datalength (@mydate);
print len (@mydate);


 --2 Time 
 -- It will allow you to insert the time, and format is HH:MM:SS

 --Storage size: 5 Bytes

-- declare time variable and set to current time
DECLARE @MyTime time = GETDATE()
--SELECT @MyTime AS MyTime
print @mytime;
print datalength (@mytime);
print len (@mytime);

 --3.Datetime
 --It will allow you to insert the date as well time format is YYYY-MM-DD HH:MM:SS:MS
 --ex:2021-08-17 08:16:13.327
 --Storage size: 8 Bytes
-- declare datetime variable and set to current time
DECLARE @MyDateTime datetime = GETDATE()
--SELECT @MyDateTime AS MyDatetime

print @MyDateTime;
print datalength (@MyDateTime);
print len (@MyDateTime);


--Datetimeoffset Data Type
--Defines a date and time with time zone awareness
--DECLARE @VarName datetimeoffset(n) where n is a value from 1 to 7 defining precision with default of 7
--Range of values: 0001-01-01 through 9999-12-31 - 00:00:00 through 23:59:59.9999999 - -14:00 through +14:00
--Storage size: 10 Bytes
-- compare times in 2 timezones

DECLARE @Edt datetimeoffset = CAST('2020-01-01 08:00:00.000 -00:00' AS datetimeoffset)
DECLARE @Pdt datetimeoffset = CAST('2020-01-01 05:00:00.000 -03:00' AS datetimeoffset)
SELECT DATEDIFF(minute, @Edt, @Pdt) as MinutesDifference


 --4.Timestamp
 --It will combine date and time in the form  of numbers.
 DECLARE @Timestamp timestamp ='2008-01-01 23:00:01';
SELECT @Timestamp AS timestamp1

print @MyDateTime;
print datalength (@MyDateTime);
print len (@MyDateTime);

 --Q.How to create a table?
  --synatx :create table Table_name(col1_ Name datatype,col1_ Name datatype,col1_ Name datatype... etc)

 create table Student11(s_id int,
 sname varchar(50), 
 Sloc varchar(10),
 Sdept varchar(10))

--Q.How to retrive the data from tables or how fetch the records from table?

Select * from Student11

--CLASS-3

--Q.How to insert values into a table?
--By using two methods we can insert data into a table
--Method-1
--It will allow you to enter the data when number of columns are matching in table difined order.


 insert into Student11 values(1,'Praveen','Pune','ETL')
 insert into Student11 values(2,'Mohan','Nasik','HR') --[Error - Invalid column name 'HR'. if we have not specified text in 
 --                                                    single quotes ('')]

 insert into Student11 values(2,'Mohan','Nas ik','HR') 

 insert into Student11 values(3,'Rohan','Mumbai')  --[Error -Column name or number of supplied values does not match table 
 --definition.Whenever your are inserting the data into the table by using method-I, tbale column defined order is importnat.]

insert into Student11 values(4,'Sheetal','Sangali','CCD') 
insert into Student11 values (3,'Rohan')--ERROR--Column name or number of supplied values does not match table definition.

--Method-II
--It will allow you to enter the values as per your choice but condition is that you need to mention the column name of your choice.

insert into Student11 (S_id,Sname) values (3,'Rohan')

insert into Student11 (Sname,s_id,Sdept) values ('Rohan',3,'Finance')
insert into Student11 (s_id,Sname,Sloc,Sdept) values (5,'Mike','London','Account')
insert into Student11 (s_id,Sname,Sloc) values (6,'kate','sydeny')
insert into Student11 (s_id,Sname,Sloc) values (7,'rina','US')
insert into Student11 (Sname,Sloc,Sdept,s_id) values (5,'Mike','London','Account')--ERROR--Conversion failed when converting the varchar value 'Account' to data type int.

--Q.How to retrive the data from table?

select * from student11

--'*' - star symbol indicates that it will indicate all the columns from table

--Q. How to select S-id and Sname columns from student table?
select s_id,sname from Student11

select s_id from Student11


--CLASS-4
--Create - It is basically used to create database, table and many more etc.
--insert - It is basically used to insert the values into table.
--select - It is used to extract or retrive the data from table.

--SQL clauses
--Clauses are used to filter the data by using the condition.
--Clauses are used for filtering purposes

--There are various types of clauses in SQL and some of the most widely used are 
--1.where 
--2.order by
--3.group by
--4.Having

--1.where 
--where clause is used with comaprision, arithmatic and logical operators.
--varcahr A-Z,a-z,0-9 and special charecter


create table employee1(
EID int,
ENMAE varchar(10),
ELOC varchar(10),
ECONTCTNO varchar(15),
ESAL int,
EDEPT varchar(10))

select * from employee1

insert into employee1 values(1,'sohan','Pune',+919123456789,30000,'HR')
insert into  employee1 values(2,'Rohan','Miraj','+919178656789',50000,'IT')
insert into  employee1 values(3,'sheetal','nasik','+919171116789',60000,'Finance')
insert into employee1 values(4,'Mithali','sangali','+919144456789',70000,'IT')
insert into employee1 values(5,'Poonam','patna','+919178655589',80000,'HR')
insert into employee1 values(6,'Praveen','jaipur','+919178457789',90000,'Account')
insert into employee1 values(7,'Amit','indore','+919178651111',45000,'ERP')
insert into employee1 values(8,'Rohit','satara','+919178659811',55000,'Quality')
insert into employee1 values(9,'Mohit','solapur','+919178653344',58000,'ERP')
insert into employee1 values(10,'Geeta','latur','+919178656199',65000,'Finance')


--Display employee whose dept is IT?

select * from employee1 where EDEPT ='IT'

--Display employee whose salary is > 50000

select * from employee1 where ESAL > 50000 and EDEPT ='IT'

--Oprtators 

--1.Comaparision
--it is basically used to compare the condittion provided into where clause 
-- = -equals to
-- > - greater than
-- < -Less than
-- <= -less than equal to
-- >= - greater than equal to
-- != or <> - not equal to

select * from employee1 where ESAL = 50000
select * from employee1 where ESAL > 50000
select * from employee1 where ESAL < 50000
select * from employee1 where ESAL >= 50000
select * from employee1 where ESAL <= 50000


select * from employee1 where ESAL != 50000
select * from employee1 where ESAL <> 50000

select * from employee1 where EID > 3



--Logical operator
--It is basically used to compare the two inputs logically based upon the operation specified into where clause.
--1. AND 
--It will act like multiplication

--AND operation
--A		B	  O/P
--1		1	   1
--1		0	   0
--0		1	   0
--0		0	   0

--A			B		O/P
--TRUE		TRUE	TRUE
--TRUE		FAlSE	FALSE
--FALSE		TRUE	FALSE
--FALSE		FALSE	FALSE

select * from employee1 where esal =70000 and EDEPT='ERP'


--2. OR
--compare the two inputs logically based upon the operation specified into where clause.
--It will act like addition.

--OR operation
--A		B	O/P
--1		1	1
--1		0	1
--0		1	1
--0		0	0

--A			B		O/P
--TRUE		TRUE	TRUE
--TRUE		FAlSE	TRUE
--FALSE		TRUE	TRUE
--FALSE		FALSE	FALSE

select * from employee1 where esal =70000 OR EDEPT='ERP'


--3.NOT(! or <>)
--it will perform negation.
--it will perform opposite operation

--Input		output
--True		False
--False		True

select * from employee1 where eid in (1,5,9)

select * from employee1 where eid not in (1,5,9)


--CLASS-5

--2.Order by 
--This is used to sort the result in ascending order(ASC) or Descending order(DESC)
--if the column contains NULL value while performing order by , Always NULL value should be first when ASC and At last when DESC.
--Synatx order by COLUMN_NAME ASC|DESC

select * from employee1 order by ESAL 
select * from employee1 order by ESAL desc 

select * from employee1 order by ESAL desc
select * from employee1 order by ESAL ASC

insert into employee1 values(11,'Geeta','','+919178656199',65000,NULL)
insert into employee1 values(12,'Meena','','+919178656199',NULL,'HR')
insert into employee1 values(13,'sheeta','','+919178656188',72000,NULL)
insert into employee1 values(14,'amit','','+919178656100',78000,NULL)
select * from employee1 order by ELOC 
select * from employee1 order by ELOC  desc
select * from employee1 order by EID asc

select * from employee1 order by EDEPT 

--Arithmatic operator
--It will used to perform mathematical operation like  {+,-,* and / etc}
select *,esal = esal+3000 from employee1 where EDEPT = 'HR'
select *,esal = esal-3000 from employee1 where EDEPT = 'HR'

select *, Package = (esal*12) from employee1

select *, Package = (esal*12)/2 from employee1

select sname + sloc from Student11

--Alias
--Alias in SQL will you to provide a name of your choice,
-- syntax : As New_columnName
select *,(ENMAE + EDEPT) as NameDept from employee1

select *,ENMAE as EName from employee1

select ENMAE as EName from employee1


--CLASS-6
--Constraints
--To Maintain the accuracy and integrity of the data.

--1.Primary Key
--2.Foreign Key
--3.Null key
--4.Unique key
--5.Check key
--6.Default key

--1.Primary Key
--Not NULL + Unique
--Uniquely identifies each record into the table.
--primary key is used in genaral with numeric value.

Create table prime (
P_ID int primary key,
P_name varchar(10),
Pcity varchar(10))

insert into prime values(1,'Praveen','pune')solapur
insert into prime values(2,'Praveen','pune')
insert into prime values(3,'mohit','Jaipur')
insert into prime values( ' ','mohit','Jaipur')

select * from prime

--2.Foreign key
--It ensure that all values in a columns are diffrent.
--One NULL value can be applied at column level or table column.
--It means that it can accept one NULL value and it cant be NULL twice.
--A foriegn key is a column or collection of columns in one table that refers to The primary key in another table.

Create table department(
D_ID int primary key,
Dept_Name varchar(20))
insert into department values(1,'HR')
insert into department values(2,'Finance')
insert into department values(3,'Account')
insert into department values(4,NULL)
select * from department 
create table emp
(
E_ID int primary key,
E_Name varchar(10),
D_ID int foreign key references department(D_ID))
select * from emp
select * from department 

insert into emp values(11,'Amit',1)
insert into emp values(12,'rohit',2)
insert into emp values(13,'Mohit',3)
insert into emp values(14,'Mohit',NULL)
insert into emp values(15,'ronit',NULL)
insert into emp values(16,'ron',NULL)
insert into emp values(17,'ronit',null)

drop table emp
--The below statement through an exception 
insert into emp values(17,'shon',5)
--Error/Exception -The INSERT statement conflicted with the FOREIGN KEY constraint "FK__emp__D_ID__3A81B327". The conflict occurred in database "Testing18", table "dbo.department", column 'D_ID'


select * from department
select * from emp


--CLASS-7
--Q.How to check the number of tables 
select * from INFORMATION_SCHEMA.tables 

--NULL value
--A column with a NULL value is a column with No value.
--NULL value is diffrent from a '0(Zero)' value and 'Blank/Empty' space.

--Q, How to test for NULL values in column?
--There are two ways to check the NULL values present in column or not
--1.IS NULL
--2.IS NOT NULL

select * from employee1 where ELOC is null

select * from employee1 where EDEPT is null

select * from employee1 where EDEPT is not null


--3.NOT NULL Key
--NOT NULL Constraint is restricts a column from having a  'NULL' value.
--Once if you defined/Applied NOT NULL constarints on column level then you cant insert NULL values.
--

create table NOTNULL(
NID int primary key,
NNAME varchar(10) NOT NULL,
Age int NOT NULL)

select * from notnull
--Method-I

insert into NOTNULL values (1,'Kate',42)
insert into NOTNULL values (2,NULL,42)
insert into NOTNULL values (2,'Kate',42)
insert into NOTNULL values (3,'',56)

--Method-II

insert into NOTNULL (NID,NNAME) values (4,'Shon')


--The above statement through an exception
--Exception/Error-Cannot insert the value NULL into column 'Age', table 'Testing18.dbo.NOTNULL'; column does not allow nulls.
--INSERT fails.


select  * from NOTNULL

--4.Unique key
--It ensures that all the columns sould have UNIQUE values or diffrent value.
--One NULL/One Blank/empty value can be inserted at column level.
--It means that it can not accepet NULL or Blank/Empty space twice into column

create table UNIQUE_Table(
U_ID int primary key,
U_Name varchar(10) Unique,
U_LOC varchar(10) NOT NULL Unique )

select * from UNIQUE_Table
insert into UNIQUE_Table values(1,'Niraj','Pune')
insert into UNIQUE_Table values(2,'','Nasik')
insert into UNIQUE_Table values(3,NULL,'Mumbai')
insert into UNIQUE_Table values(4,'Shrikant','Patna')
insert into UNIQUE_Table values(5,'Mohan',NULL)
INSERT INTO UNIQUE_TABLE VALUES (6,'MOHAN','NAGPUR')
INSERT INTO UNIQUE_TABLE VALUES (7,'MOHAN','kolhapur')
insert into UNIQUE_Table values(8,'Niraj','Pune')

DELETE unique_table

--5.Check key
--It ensures that all values in a column statisfies a specific condition.
--Check constarints is used to restrict the value of a column.
--It is just like condition checking before inserting the data into column.

Create table CHECK_KEY(
C_ID int primary key ,
C_Name varchar(10) NOT NULL UNIQUE,
C_AGE int check(C_AGE >18))
select * from check_key
insert into CHECK_KEY values(8,'mko',null)
insert into CHECK_KEY values(1,'Sumit',19)
--The below statment through an exception while inserting the data
insert into CHECK_KEY values(2,'Ronit',17)
insert into CHECK_KEY values(5,'mohit',null)

--Exception/Error
--The INSERT statement conflicted with the CHECK constraint "CK__CHECK_KEY__C_AGE__440B1D61". 
--The conflict occurred in database "Testing18", table "dbo.CHECK_KEY", column 'C_AGE'.

--6.Default constarint
--Set a default value to column when value is not defined/inserted/specified.

Create table DEFAULT_VALUE(
D_ID int primary key,
D_name varchar(10) NOT NULL Unique,
D_City varchar(10),
D_AGE int check(D_age >=20),
D_LOC varchar(20) default 'Balaji Nagar')

select * from DEFAULT_VALUE
--METHOD-I
insert into DEFAULT_VALUE values(1,'Smita','Jaipur',20,'katraj')
insert into DEFAULT_VALUE values(2,'Amla','Chennai',28,default)
insert into DEFAULT_VALUE values(3,'Asin','Madurai',34,'')

--METHOD-II
insert into DEFAULT_VALUE (D_ID,D_name,D_City,D_AGE) values(4,'Surya','Banglore',43)

--CLASS-8
--IN and NOT IN clause
--This clause will allow to navigate or point out values specified into the list inside in it.
--NOT IN clause will perform the reverse or opposite operation as compared to IN clause.

select * from employee1 where eid in (1,2,6)

select * from employee1 where eid not in (1,2,6)

select * from employee1 where eloc in ('Latur','Indore')

select * from employee1 where eloc in ('Latur','')

select * from employee1 where EDEPT is null

select * from employee1 where EDEPT in (null)  -- No values it  is displaying when we specify NULL inside into IN clause
--Because we can test NULL values by using IS NULL and IS NOT NULL function.


--BETWEEN and NOT BETWEEN clause
--This clause will allow you to display the values or records between the renage you have specified.
--This Clause will work with AND operator.

select * from employee1 where eid between 1 and 3

select * from employee1 where ELOC between 'Latur' and 'Pune'


select * from employee1 where eid not between 1 and 3

select * from employee1 where ELOC not between 'Latur' and 'Pune' -- alphabet ranging from L-P will skip 

--LIKE cluase
--This clause is basically used for searching pattern from a given string or charecter.
--Like operator/clause mostly used with/in WHERE clause.
--Like clause is ofently used with charcter and we can also used with integer as well.

--Like clause used with two wild crads for searching pattern
--1.'%' - It represents zero,one or multiple charecters.
--2.'_' -represents one or single charecter.

--For example : Shon,Kate,Elizabeth,Moore etc 

-- 'A%' --Start with 'A' letter and it will display all the names which starts with A.
-- '%A' --END with 'A' letter and it will display all the names which ENDS with A.
-- '%A%' --Anywhere inside the record/Column/field. If 'A' letter is present in between then it will display all
--the names/patterns from that column. 

select * from employee1 where EnamE like 'a%'

select * from employee1 where EnamE like '%a'

select * from employee1 where EnamE like '%A%' 

select * from employee1 where EnamE like '[LP]%' --A,a

--Q.Display the nam e which third letter starts with 'T' from enmae column of employee table.
select * from employee1 where EnamE like '__t%'

select * from employee1 where EnamE like '__%t'

select * from employee1 where EnamE like '%h__'

select * from employee1 where EnamE like '_d%'

select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME like 'emp%'

--Q.How to display the names which start r and ends with t?

select * from employee1 where EnamE like 'r%t'

--Q.How we can display the names ranging from a to l from employee table?

 select*from employee1 where EnamE like '%[a-l]%'

--Q.Display the names which end with a and l?

 select*from employee1 where EnamE like '%[a,l,i]'

--Q.Display the names whose having '_' in between the names ? EX:AMIT_PATIL,NIKHIL_GOUD

select * from employee1 where ename like '%[_]%'

update employee1 set EnamE='amit_patil' where eid=7

--Q.Display the names which starts with a,r,g,a from employee table?

select * from employee1 where EnamE like '[arga]%' 

--Q.Display the names which ends ranging from P-U from employee table?

select * from employee1 where EnamE like '%[p-u]' 

select * from employee1 where ESAL like '4%'

--Auto-Increment
--Auto-increment allows a unique number to be generated automatically when a new record is inserted into the table.
--Often this is used with primary key columns so that we can create unique automatically.

create table AUTO_INCREMENT(
Account_ID int primary key identity(1,1), --1,2,3,4
Account_Name varchar(10),
Account_LOC varchar(10))

insert into AUTO_INCREMENT values('sheetal','Mumbai')

select * from AUTO_INCREMENT

create table AUTO_INCREMENT2(
Account_ID int primary key identity(111128870,5), ---0,5,10,15,20
Account_Name varchar(10),
Account_LOC varchar(10))


insert into AUTO_INCREMENT2 values('praveen','Pune')

select * from AUTO_INCREMENT2

--CLASS-9
--Types of SQL Statements
--1.DML(Data Manipulation Language) - (S_UID)
--select,Insert,update,delete

--2.DDL(Data Defination language) -(DR.CAT)
--Create,Alter,Drop,truncate.-----By default we need to write table

--3.DCL(Data control language)
--Grant, Revoke

--4.TCL(transcation  control language)
--TRAN,COMMITTRAN,ROLLBACK

--1.DML(Data Manipulation Language) - (S_UID)
--Select
--This DML stement is used to fetch the record from table 
--it will also help to extract/fetch the data mentioned with select statemet
select * from emp
--the below statement replace all the rows from table by '8'
select 8 from emp

--Insert
--insert statement is used to insert the data into table 
--Method-I
insert into emp values (17,'Monika',3)
--Method-II
insert into emp (E_ID,E_Name) values (18,'sheena')

--INSERT INTO SELECT 
--This statement is basically used to take temporary backup the table in real time.
--by using the combination of insert into select staement we can copy one table data and insert into another table
--While inserting the data from one table to another table it has to match the Column name or number of supplied values and match table definition.
--While using INSERT INTO SELECT statement requires the same data types in source_table and target_table.

--synatx : INSERT INTO SELECT target_Table SELECT * FROM source_table

insert into employee_Temp select * from employee1 where ESAL > 50000

select * from employee_temp

insert into emp select * from employee 

--Temporaray table of Employee
create table employee_Temp(
EID int,
ENMAE varchar(10),
ELOC varchar(10),
ECONTCTNO varchar(15),
ESAL int,
EDEPT varchar(10))

select * from employee_temp

drop table employee_Temp

--Update 
--We can update the complete column/Filed/Attribute once.
--We can update single value of column by specifying condition.
--By using this update we can paly with table data not columns.

select * from employee1

--syntax

update employee1 set eloc = 'Delhi' where EID >=11

update employee1 set eloc = 'Mumbai' where EID =13 

update employee1 set ESAL = 34000 where EID =12

update employee1 set EDEPT = 'CAG' where EDEPT is NULL

--CLASS-10

select * from INFORMATION_SCHEMA.TABLES

--Delete 
--Delete is used to delete the table records not an table structure.
--It will delete the data row by row.
--It can delete particular record by specifying an condition.
select * from emp
select * from employee1 where EID>=13

delete employee1 where EID>=13

delete employee1 where ENMAE ='Meena'

--2.DDL
--It will allow you to perform the operation based on table structure.

--Create
--It is used to create the table and database 

--create table
Create table new(
id int,
FirstName varchar(10))

--Create database
create database Test

--Drop
--It will delete the table data as well as structure of that particular table.
--By using drop command we drop or delete the database.
select * from emp

insert into emp values(1,'Praveen',2)
insert into emp values(2,'Praveen',1)


drop table emp 

drop database test

--Truncate 
--It will allow you to delete the records from a table at once.
--It wont delete the table structure.
--It will not allow you todelete the data row by row by specifying condition.

select * from emp

truncate table emp 

--Q.What is the diffrence between truncate,delete and drop?
--Q.What is the diffrence between DDL and DML statements?
--Q.How to update the data in paricualr column of employee table?
--Q.How to delete the table structure?
--Q.How will you delete the data at one time?


--Alter
--By using Alter statement we can manipulate/Play with table attributes/Columns/fields.
--We can add one or more columns 
--We can delete the columns.
--We can change the data type for a particular column
--we can increase or decrease the size of particular column.

create table ALTER_OPERATION(
AID int,
ANAME varchar(10))

insert into ALTER_OPERATION values (1,'Kate')
insert into ALTER_OPERATION values (2,'Mark')


select * from ALTER_OPERATION

--DR.CAT --These statements used with tables 

--Adding single column into table

alter table ALTER_OPERATION add ALOC varchar(10)

--Adding multiple columns into table

alter table ALTER_OPERATION add APIN int, ACITY varchar(10)

--Droping single column from table

alter table ALTER_OPERATION drop column Acity
alter table ALTER_OPERATION drop column Aloc

--Droping multiple columns into table

alter table ALTER_OPERATION drop column Aloc, apin

--Q.How to find out the structure of the table? VVIMP****
    SP_HELP alter_OPERATION

select * from ALTER_OPERATION 

--Alter the size of the column

alter table ALTER_OPERATION alter column Aname varchar(15)

--Alter the size of column(reducing the size)

alter table ALTER_OPERATION alter column Aname varchar(3)

--when ever you are trying to reduce the size of column , it will aloow you till the maximum data or charecter inserted into in it.
--If your trying reduce again from maximum stored data then it will throgh an exception
--Exception/Error - String or binary data would be truncated in table 'Testing18.dbo.ALTER_OPERATION', column 'ANAME'. Truncated value: ''.


--CLASS-11
select * from ALTER_OPERATION

alter table ALTER_OPERATION  add aloc varchar(10) default 'PUNE'

insert into ALTER_OPERATION (aid,aname) values (3,'Shon')

sp_help ALTER_OPERATION

--By using alter statement we can add constraint to the column 
--While adding primary key constraint to table column we need follow below rules
--1.To define the the PK on any column  after the table is created and if it has no records then it should defined with NOT NULL.
--2.If the records are inserted into a table and after that if you are defining PK then it should have NOT NULL and Unique values.

--If this rule 2 not satisfied then it will through an exception
--exception
--The CREATE UNIQUE INDEX statement terminated because a duplicate key was found for the object name 'dbo.alter1' and the index name 'key1'. The duplicate key value is (1).
--Could not create constraint or index. See previous errors.

alter table ALTER_OPERATION alter column aid int NOT NULL  --alter the table constraint

alter table ALTER_OPERATION add constraint Mykey primary key (aid) --adding constarint to the column in a table.

sp_help ALTER_OPERATION

create table alter1(aid int NOT Null, aname varchar(10))
drop table alter1

insert into alter1 values(1,'Praveen')
insert into alter1 values(1,'mohini')


alter table alter1 add constraint key1 primary key (aid)

--syntax: ALTER TABLE TABLE_NAME add,drop,alter Column_Name  


--Functions 
--1.MIN()
--2.MAX()
--3.Count()
--4.TOP()
--5.SUM()
--6.AVG()
--7.DISTINCT()

--1.MIN()
--It will return the minimum/Smallest value of selected column.

select * from employee1 order by EDEPT

select min(esal) as minsal from employee

select min(EDEPT) as minvalue from employee1  -- If you are applying on text value min is 'A' and Max is 'Z'

--2.MAX()
--It will return the Maximum/largest value of selected column.

select * from employee1 order by EDEPT desc

select max(esal) as maxsal from employee1

select max(EDEPT) as maxvalue from employee1

--3.COUNT()
--It will count the number of records from the table.
--It wont count NULL values if it is present into that particular column.
--It will consider NULL value w.r.to row count.
--Count will always have atleat one argument.

select * from employee1

select Count(*) as RecordCount from employee1

select count(edept) from employee1

insert into employee1 values(13,NULL,NULL,NUll,null,null)

select count(2) --- O/P=1

select count('SCODEEN')  ---O/P = 1

select count(123344788) --- O/P = 1

select count(1234) + count(9876) --O/P = 2

select count('Text') + count(1234) -- O/P =  2

select count(amit)  -- Error - Invalid column name 'amit'.

select count('amit') 

--4.TOP()
--TOP function is used to fetch/display specified number of records from a table.
--it is useful when we are dealing with huge amount of data.

with result as
(
 select esal,
 rank() over (order by esal desc) as Esalary from employee1
)
select top 5 esal from result





select top 3 * from employee1 order by esal desc

--Q.How will you display the bottom 3 records from employee table in ascending order ?


select * from employee1 where eid > (select count(eid) from employee1)-5----12-5=7


--CLASS-12
sp_help alter_Operation

alter table alter_Operation drop aloc default DF__ALTER_OPER__aloc__5AEE82B9 -- will check 

--5.sum()
--It is used to add the complete column.
--It will returns the total sum of all nueric value.
--It will ignore the null values.

select * from employee1

select sum(ESAL) as TotalSalary from employee where EDEPT ='IT'

select sum(eloc) from employee1


--6.AVG()
--This fuction is used to find the average of the column
--We can calculate avg for some specific condtion.
select * from employee1

select sum(ESAL) as TotalSalary from employee1

select AVG(esal) as Avarage from employee1 where EDEPT ='ERP'

--7.Distinct
--This is used to return only unique/distinct values from a column.
select * from employee1

select count(distinct(ESAL)) from employee1

select count(distinct(edept)) from employee1

select distinct(EnamE) from employee1

--Q.How will you find distinct/unique values from a column.
--Q.How will you avoid duplicate records from column?

--Q.How will you find out min salary from table?
select min(esal) as misal from employee1
select min(ename) as minsal, min(esal) as misal from employee1

--Q.How will you find out max salary from table?
select max(esal) as maxsal from employee

--Q.How will you find out maximum and minimum salary from table?
select max(esal) as maxsal,min(esal) as minsal from employee

--Sub query
--Query within the query is nothing but subquery.

--Q.How will you find out  2nd maximum salary from table?
--subquery

select max(esal) from employee1 where esal < --it is only applicable upto 3 max salary
(select max(esal) from employee1 )

--or

select min(esal) as secondmax from employee1 where esal in----it is for all
(select top 2(ESAL)  from employee1 order by ESAL desc)

--or
select*from employee1

select eid,esal from employee1 as e1 where 2 = (select count(distinct (esal)) from employee1 as e2 where e2.esal>=e1.esal)--it is for all & easy 

--or

select max (esal) from employee1 where esal not in (select max (esal) from employee1)--it is only apllicable for 2nd or 3rd


--Q.How will you find out 2nd minimum salary from table?

select max(esal) as secondmin from employee where esal in 
(select top 2 (ESAL) from employee order by esal ASC)

--or
select eid, esal from employee1 as e1 where 1= (select count(distinct (esal)) from employee1 e2 where e2.esal<e1.esal)
select*from employee1


--Q.How will you find out 5th minimum salary from table?

select max(esal) as fift_min from employee1 where esal in (select top 5(esal) from employee1 order by esal)

--Q.How will you find out 5th maximum salary from table?

select min(esal) as fifth_max from employee1 where esal in ( select top 5 (esal) from employee1 order by esal desc)

--Q.How to display 2nd highest and 3rd lowest salary from table?

select min(esal) as max_sal, max(esal) as min_sal from employee1 where esal in (select top 2(esal) from employee1 e1 order by esal desc ) or esal in ( select top 3(esal) from employee1 e2 order by esal)


select eid,esal from employee1 e1 where 1=(select count(esal) from employee1 e2 where e2.esal>e1.esal ) and  2=(select count(esal) from employee1 e2 where e2.esal<e1.esal )

--Q,Find out the 4th highest salary from employee table with all employee details?

select eid,esal from employee1 e1 where 3 = (select count(esal) from employee1 e2 where e2.esal>e1.esal )

select*from employee1 order by esal
--Q.How to rename the column from table 

SP_RENAME 'employee1.ENMAE','ENAME'

--Caution: Changing any part of an object name could break scripts and stored procedures.

select * from employee1



--CLASS-13
--Group by:
--It is basically used to group rows that have same values.
--It is often used with aggregate functions
--COUNT(),MAX(),MIN(),SUM() and AVG() to the group of result

select count(*) as count_ from employee1  group by Eid
select max(ename),max(esal)from employee1 group by esal

select EDEPT,count(*),ESAL as countofemployee from employee1 where edept = 'HR' group by EDEPT,ESAL

select *from employee1

--Having Clause:
--Having clause was added in SQL because we cant use where clause with aggregate function.



select * from employee1

select count(*),edept from employee1 group by EDEPT having count(*) > 1
select edept,ename from employeee1 where salar


select count(*),edept from employee1 group by edept having esal=


create table duplicate (did int , dname varchar(20),dloc varchar(20))

insert into duplicate values (1,'mohan','Mumbai')
insert into duplicate values (2,'rohan','solapur')
insert into duplicate values (1,'kiran','sangali')
insert into duplicate values (1,'aditi','miraj')
insert into duplicate values (1,'arti','pune')
insert into duplicate values (1,'mohan','Mumbai')

--Q.How to find the duplicate records from table?
--1st way 
--select <PK1>,<PK1>...<PKn> ,count(*) as duplicate group by <PK1>,<PK1>...<PKn> having count(*) > 1
--when we have multiple PK in table then we need select all the PK and group by that PK then it will display duplicate records

--2nd way
-- We need to select the number columns avialable into the table as well as we need to inculde in group by.
--select col1,col2,....coln,count(*) as duplicate from group by col1,col2,....coln,count(*) having count(*) > 1

select * from duplicate
select did,dname,dloc,count(*) as duplicate  from duplicate group by did,dname,dloc having count(*) > 1


--CLASS-14
--JOIN
--JOIN clause is used to combine rows from two or more tables.
--while Joining the two table their sholud be common column name is required.

--For ex: table1 having column  A,B,C 
--table 2 having columns D,E,F 
--we can't apply join between table1 and table 2

--For ex: table1 having column  A,B,C,D
--table 2 having columns D,E,F 
--we can apply join between table1 and table 2 because their is common column in between i.e D

--Types of Joins
--1.Inner Join / Join
--2.Outer Join
	--1.Right join/right outer join
	--2.Left join / Left outer join	
	--3.Full join/ Full outer join
--3.Self join

create table one (id int, FirstName varchar(20))
select * from one
insert into one values (1,'Amit')
insert into one values (2,'Praveen')
insert into one values (3,'Rohit')
insert into one values (4,'Aman')
insert into one values (5,'mohit')
insert into one values (9,'Sohan')

create table secnd (sid int, Lastname varchar(20),id int)
select * from secnd

insert into secnd values (11,'patil',1)
insert into secnd values (12,'sharma',2)
insert into secnd values (13,'varma',3)
insert into secnd values (14,'mehra',4)
insert into secnd values (15,'bhosale',5)
insert into secnd values (16,'Sheetal',6)
insert into secnd values (17,'Meena',7)
insert into secnd values (18,'Reena',8)

select * from one o1 join secnd s1 on o1.id =s1.id join third t1 on s1.sid=t1.sid
select * from one 
select * from secnd
select * from third

create table third (TID int, Middlename varchar(20),sid int)

insert into third values (21,'Sharma',11)
insert into third values (22,'Varma',12)
insert into third values (23,'Patil',13)
insert into third values (24,'Kumar',14)
insert into third values (25,'reddy',19)
select * from one 
select * from secnd
select * from third
select * from one o1 inner join secnd s1 on o1.id =s1.id  join  third  t1 on  s1.sid = t1.sid 

select firstname,lastname,sid from one o1 inner join secnd s1 on o1.id =s1.id 

select o1.id,o1.Firstname,t1.Middlename,s1.Lastname
from one o1 inner join secnd s1 on o1.id =s1.id  
join third t1 on s1.sid = t1.sid

select one.id,one.Firstname,secnd.Lastname 
from one  inner join secnd  on one.id =secnd.id  
join third  on secnd.sid = third.sid

select * from one o1 join secnd s1 on o1.id =s1.id 

--Equi Join
--Equi Join is nothing but joininig the two or more table without using join syntax.
select * from one o1,secnd s1 where o1.id =s1.id 

--CLASS-15
--2.Outer Join
--1.Right join/Right outer join
--It will display all the records from right table and matching records from left table.

--Suppose we have two table named as A and B and if we are applying right join 
--For example A right join B then all the records from Table B will be displayed and only matching records from table A against B will be displayed 
--and non-matching records will displyed as NULL.

select * from one 
select * from secnd
select * from third
select * from one o1 right join secnd s1 on o1.id =s1.id right join third t1 on s1.sid =t1.sid





--2.leftt join/left outer join
--It will display all the records from Left table and matching records from right table.

--Suppose we have two table named as A and B and if we are applying left join 
--For example A left join B then all the records from Table A will be displayed and only matching records from table B against  will be displayed 
--and non-matching records will displyed as NULL.

select * from one 
select * from secnd
select * from third

select * from one o1 left join secnd s1 on o1.id =s1.id --Two Tables

select * from one o1 left join secnd s1 on o1.id =s1.id left join third t1 on s1.sid = t1.sid --Three tables 

--3.Full join/Full outer join
--It will display all the records from both the tables whether it is matching or not-matching.
--If the records are not matching either of the table then it will display NULL values to either of the table side.

select * from one 
select * from secnd

select * from one o1 full join secnd s1 on o1.id =s1.id  -- Two table 

select * from one o1 full join secnd s1 on o1.id =s1.id full join third t1 on s1.sid = t1.sid -- Three tables 



--CLASS-16

--Join - Cross product + condition

--Self join
--Joining a table with itself - self join.
--Self join can be classified as 
--1.inner join
--2.Outer join(Left,right,full)
--3.cross join  --- cartesian product

create table EMP_SELF (EID int , ENAME varchar(20),ManagerID int)

insert into EMP_SELF values (1,'Kate',2)
insert into EMP_SELF values (2,'Todd',1)
insert into EMP_SELF values (3,'Mike',NULL)
insert into EMP_SELF values (4,'Mark',2)
insert into EMP_SELF values (5,'shon',3)

select * from emp_self

--Example
--A - 1,2,3,4,NULL
--B - 3,4,5,6,NULL

--Inner join -3,4
--Left join - A left join B
-- 1	Null
-- 2	NUll
-- 3	3
-- 4	4

--Right join -  A right join B
--	3		3
--	1		NULL
-- 	4		4
-- 	NULL	5
-- 	Null	6

--Full join -  A right join B
--	2		NULL
--	3		3
-- 	4		4
-- 	NULL	5
-- 	Null	6

select * from emp_self
select * from EMP_SELF A1 join EMP_SELF A2 on A1.eid =A2.ManagerID

select * from EMP_SELF A1 , EMP_SELF A2 where A1.ManagerID =A2.EID

select * from EMP_SELF A1 , EMP_SELF A2 where A2.EID = A1.ManagerID 


select a1.eid,a1.ename,a2.managerid,a2.ename from emp_self as a1 ,emp_self a2 where A1.eid =A2.ManagerID

--Inner join
select e1.EID,e1.ENAME,m1.ENAME from EMP_SELF e1, EMP_SELF m1 where  e1.ManagerID = m1.EID

select * from EMP_SELF E1 inner join EMP_SELF M1 On e1.ManagerID = m1.EID

--Outer join
select * from emp_self
select e1.EID,e1.ENAME,m1.ENAME from EMP_SELF E1 left join EMP_SELF M1 On e1.ManagerID = m1.EID

--Right join
select e1.EID,e1.ENAME,m1.ENAME from EMP_SELF E1 right join EMP_SELF M1 On e1.ManagerID = m1.EID
select * from EMP_SELF

--Cross join
select * from EMP_SELF E1 join EMP_SELF M1 on e1.ManagerID = m1.EID

select * from EMP_SELF E1 cross join EMP_SELF M1 
select * from EMP_SELF E1 cross join EMP_SELF M1 where e1.ManagerID = m1.EID

--Cross Join
--Cross join is cartesian product.
--For ex: if table A is having 4 records and table B is having 5 records then at O/p we can expect 20 records.

select count(*) from EMP_SELF

select count(*) from  Student

select count(*) from EMP_SELF E1 cross join Student S1



--example of joing 5 tables 

--a - aid aname
--b - bid bname aid 
--c - cid cname bid 
--d - did dname cid 
--e - eid ename did
--syntax 
--select * from A join b on a.aid = b.aid join c on b.bid = c.bid join d on c.cid = d.cid join e.did =d.did

select * from one 
select * from secnd


select * from one ,secnd where one.id = secnd.id -- This is other way we can write inner join query

select * from one  inner join secnd On one.id = secnd.id



create table a
(aid int,aname varchar(20))

insert into a values(1,'ram')
insert into a values(2,'sita')
insert into a values(3,'gita')
insert into a values(4,'sangit')
insert into a values(5,'shyam')


create table b
(bid int, bname varchar(20),aid int)

insert into b values(1,'vishal',3)
insert into b values(2,'ajit',4)
insert into b values(3,'gopi',5)
insert into b values(4,'sammed',1)
insert into b values(5,'rushab',6)


create table c
(cid int, cname varchar(20),bid int)

insert into c values(1,'mohan',1)
insert into c values(2,'mohani',2)
insert into c values(3,'soham',3)
insert into c values(4,'sam',5)
insert into c values(5,'rutik',4)


create table d
(did int, dname varchar(20),cid int)

insert into d values(1,'vaishali',3)
insert into d values(2,'ankita',4)
insert into d values(3,'gouri',5)
insert into d values(4,'samiksha',2)
insert into d values(5,'rohani',3)

create table e
(eid int, ename varchar(20),did int)

insert into e values(1,'vikram',1)
insert into e values(2,'ajinkya',2)
insert into e values(3,'gopal',3)
insert into e values(4,'sanju',4)
insert into e values(5,'pant',9)

select * from A
select * from b
select * from c 
select * from d
select * from e


select * from A join b on a.aid = b.aid join c on b.bid = c.bid join d on c.cid = d.cid join e on e.did = d.did


select * from A right join b on a.aid = b.aid right join c on b.bid = c.bid right join d on c.cid = d.cid right join e on e.did = d.did


select * from A left join b on a.aid = b.aid left join c on b.bid = c.bid left join d on c.cid = d.cid left join e on e.did = d.did


select * from A join b on a.aid = b.aid left join c on b.bid = c.bid right join d on c.cid = d.cid right join e on e.did = d.did


--Class-17
--Q,Find out the 4th highest salary from employee table with all employee details?

 select * from employee e1  
 where 4 = 
 (select count(esal) from employee e2 where e1.esal <= e2.ESAL)

 select * from employee1 e1  order by esal 

--Q,Find out the 4th Lowest salary from employee table with all employee details?

 select * from employee1 e1  
 where 3 = 
 (select count( esal) from employee1 e2 where e1.esal >= e2.ESAL)

 select distinct esal from employee e1 where 4= (select count(distinct esal) from employee e2 where e1.esal>=e2.esal)


 --SET Operator 
 --It is mainly used to determine the same type of data from two diffrent tables.
 --while using the set operator condition is that both tables should have equal no of columns and data types.

 --Types of SET opeartor 
 --1.Union
 --2.Union ALL
 --3.Intersection
 --4.Except/MINUS --In SQL and for other RDBMS(oracle/MySql -MINUS )


 --Example 

 --A =[1,2,3,4,5]
 --B =[2,3,4,5,6,7,8]

 --1.Uinon - a union b - O/P - [1,2,3,4,5,6,7,8]
 --2.Uinon All - a union all b - O/P - [1,2,3,4,5,2,3,4,5,6,7,8]
 --3.Intersection - a intersection b -O/P - [2,3,4,5]
 --4. except/minus  - a except/minus b  O/P - [1]
 --					- b except/minus a  O/P - [6,7,8]

 create table set0 (S_ID int, Sname varchar(20))

 insert into set0 values(1,'Praveen')
 insert into set0 values(2,'Mohan')
 insert into set0 values(3,'Sohan')
 insert into set0 values(4,'Rohan')
 insert into set0 values(5,'Manish')

 create table set01 (S_ID int, Sname varchar(20))
 insert into set01 values(3,'Sohan')
 insert into set01 values(4,'Rohan')
 insert into set01 values(5,'Manish')
 insert into set01 values(6,'Shital')
 insert into set01 values(7,'Meena')
 insert into set01 values(8,'Sheena')

 --1 Union 
 --This operator used to combine two or more tables using select statments when both tables have same no of columns.
 --Combine the two or more tables without duplicates.
 select * from set0
 Union 
 select * from set01

 --2.Union All
--This operator is used to combine two or more tables using select statement when both the tables have same no. of columns.
--Combine the two or more tables with all the values. it means that it will allow duplicate values in it.

 select * from set0
 Union all
 select * from set01

 --3.Intersection
--It will return only distinct (common records) values from two or more tables.

 select * from set0
 intersect
 select * from set01

--4.Except/minus
--It will display the difference in records.
--For ex: A = [1,2,3] and B= [3,4,5]
--then A except B - O/P =[1,2]
--then B except A - O/P =[4,5]

 select * from set0
 Except
 select * from set01

 select * from set01
 except
 select * from set0

 select Sname from set01
 Except
 select Sname from set0


  --CLASS -18
 --Null Value Replacement
 --Their are three ways by using which we can replace 'NULL' values from table.
 --1.ISNULL
 --2.COALESEC
 --3.Case Statement

 Create table NULL_REPLACE_TEST( NID Int,Nname Varchar(20),ManagerID varchar(20))

 insert into NULL_REPLACE_TEST values (1,'Shital',4)
 insert into NULL_REPLACE_TEST values (2,'Meena',NULL)
 insert into NULL_REPLACE_TEST values (3,'Sheena',1)
 insert into NULL_REPLACE_TEST values (4,'Tina',NULL)
 insert into NULL_REPLACE_TEST values (5,NULL,3)

 select * from NULL_REPLACE_TEST


 --1.ISNULL()
 --This function will help us to replace NULL value with any other user defined value.
 --synatx: ISNULL(Colname,'String')
 --It will accept Two arguments 

 --NVL - SQL DEVELOPER _ Oracle
 --IFNULL - MySql 
 Select * from NULL_REPLACE_TEST

 select *,ISNULL(ManagerID,'NO Manager') as MangerName from NULL_REPLACE_TEST 

 select * ,ISNULL(Nname,'NO Name')  from NULL_REPLACE_TEST 

 update NULL_REPLACE_TEST set ManagerID = ISNULL(ManagerID,'NO Manager') --- We can update by using ISNUll function but that change is permanent.

 --2.COALESCE()
 --It will find or try to locate first appearance of NON-NULL values from a particular Row in a table.
 --If it is not possible to locate non-Null value in defined columns inside coalesce function then it will display NULL
 --If their are any balnk space or empty space then it will not work as expected. so it will display directly blank space.
 --Syntax : COALESCE(Val1,Val2 .....Val_n) 
 --Val1,val2, ---Required. The values 
 --Val_n ---test 

 Create table COALESCE_TEST(CID int,FirstName varchar(20),MIddleName varchar(20),LastName varchar(20),Salary int)


 insert  into COALESCE_TEST values (1,'Kate',NULL,'Mark',3000)
 insert  into COALESCE_TEST values (2,NULL,'John','sina',4000)
 insert  into COALESCE_TEST values (3,Null,NULL,'Mark',5000)
 insert  into COALESCE_TEST values (4,NULL,NULL,NULL,6000)
 insert  into COALESCE_TEST values (5,'','','Sharma',7000)
 insert  into COALESCE_TEST values (6,'Monty','','Sharma',8000)
 select * from COALESCE_TEST

 select CID,coalesce(FirstName,MiddleName,Lastname),Salary from COALESCE_TEST

 select CID,coalesce(FirstName,MiddleName),Salary from COALESCE_TEST

 select coalesce(Null,NULL,Null,'SCODEEN') --SCODEEN

 select coalesce(1,NULL,Null,'SCODEEN') --1

 select coalesce(Null,2,Null,'SCODEEN') --2

 select coalesce(Null,Null,'SCODEEN','2') --3

 --CLASS-19
--3.Case Statement
--The case Statement will identify the condition and returns a values.
--When first condition is met (Like an IF-THEN-ELSE).so once condition is TRUE,it will stop otherwise it will return ELSE result.

--If there is no ELSE statement and no condition is TRUE then it returns NULL value.

--Syntax: CASE
--				WHEN condition1 THEN result1
--				WHEN condition2 THEN result2
--				ELSE result
--		  END

select * from INFORMATION_SCHEMA.tables

select * from student

update student SET S_loc = 
				Case when s_name = 'praveen'  then 'Nagpur' 
					 when s_name = 'xyz' then 'Jaipur' 
					
				Else NUll END 




Select * from NULL_REPLACE_TEST


select NID,NNAME,
		CASE 
		WHEN managerID is NULL then 'NO Manager' 
		else 'Manager ID is present' 
		END --as ManagerValidation
 from NULL_REPLACE_TEST



--CLASS-20
--Date and Time Function
use Testing18
--getdate 
select getdate() as Todays_date-- Todays date

select getdate() -1 as Yesterday_date --Yesterday date 

select getdate() +1 as Tomorrow_date --Tomorrow date 

select getdate() +2

--There are three diffrent functions in SQL to modify or perform any date related task
--1.DATEDIFF()
--2.DATEPART()
--3.DATEADD()

--1.datediff() function
--The datediff function requires 3 argument(s).
--If we provide more than 3 arguments then it will through an exception 

--(YY,MM,DD,HH,Minutes and seconds)

select DATEDIFF(DD,'1987/09/13','2021/09/13')
select DATEDIFF(YY,'1987/09/13','2021/09/13')
select DATEDIFF(HH,'1987/09/13','2021/09/13')
select DATEDIFF(YY,'1987/09/13',getdate()) as T_diff
select DATEDIFF(YY,'1997/08/07',getdate()) as BIRTH_DATE
select DATEDIFF(QQ,'1997/08/07',getdate()) as BIRTH_DATE
select DATEDIFF(DAYOFYEAR,'2021/09/15',getdate()) as BIRTH_DATE
select DATEDIFF(DAYOFYEAR,getdate(),'2021/09/15') as BIRTH_DATE


select DATEDIFF(dd,getdate(),GETDATE()+1)
--syntax : DATEDIFF(interval,date1,date2)
--interval
--Year,YYYY, YY = Year
--Quarter,QQ, Q = Quarter
--Month - MM, M = Month
--DAYOFYEAR - day of the year
--DAY,dy,y = day
--WEEK,WW,WK = weekday
--HOUR,HH = hour
--MINUTE,MI,N = Minute
--SECOND,SS,S = Second 
--MILISECOND , MS = Millisecond


select datediff(YY,'2015/01/01','2021/08/01')

--Q.HOW  to calculate your age ?
select datediff(YY,'1997/08/07',getdate())

select DATEDIFF(YEAR,'1992/08/15',getdate()) as Present_Age


select DATEDIFF(YEAR,'MONTH',getdate()) as Present_Age

Create table Account_details (
ACCT_NUMBER int primary key identity(11112881,1),
ACCT_NAME varchar(20),
ACCT_OPEN_DATE date,
BRANCH Varchar(20))

insert into Account_details values ('Shubham','2015/12/09','MUMBAI')
insert into Account_details values ('Rihan','2016/01/12','Jaipur')
insert into Account_details values ('Sheetal','2017/08/11','GOA')
insert into Account_details values ('Priyanka','2017/01/01','Chennai')
insert into Account_details values ('Manik','2015/01/08','Agra')
insert into Account_details values ('Veena','2021/01/01','Patna')
insert into Account_details values ('Rohan','2019/07/01','Pune')
insert into Account_details values ('Laxmi',GETDATE(),'rohatak')
insert into Account_details values ('Jinal',GETDATE(),'Indore')

select * from Account_details

select GETDATE()

select ACCT_NUMBER,ACCT_NAME,ACCT_OPEN_DATE , DATEDIFF(YY,ACCT_OPEN_DATE,GETDATE()) as Age_of_account from Account_details
where DATEDIFF(YY,ACCT_OPEN_DATE,GETDATE()) >1


--Q.What is the age of your bank account

select ACCT_NUMBER, ACCT_NAME, DATEDIFF(YY,ACCT_OPEN_DATE,getdate()) as ACCOUNT_AGE from Account_details

--Q.Calculate the no of accounts which is opened during the current year.
select * from Account_details

select count(*) as TOTAL_aCCt, DATEDIFF(YY,ACCT_OPEN_DATE,getdate()) as ACCOUNT_AGE  from Account_details
where DATEDIFF(YY,ACCT_OPEN_DATE,getdate()) = 0 group by ACCT_OPEN_DATE

--2.DATEPART
--This will allow you to display the date part 
--Syntax : DATEPART(interval,date/columnname)

select getdate()
select DATEPART(DD,GETDATE())
select DATEPART(HH,GETDATE())
select DATEPART(YY,GETDATE())


select * from Account_details

select count(*) from Account_details where ACCT_OPEN_DATE between '2020' and '2022'
select count(*) from Account_details where ACCT_OPEN_DATE in ('2015')
select count(*) from Account_details where ACCT_OPEN_DATE = '2015/01/08'

--If we want to validate date related column which is in terms of timestamp 
--and it is very difficult to mention each and every timestamp related column with every date
--in order to avoid that we can use date part so it will consider with mentioned interval.

select count(*) from Account_details where DATEPART(YY,ACCT_OPEN_DATE) in ('2021','2015')

select datepart(YY,getdate()) as years, datepart(MM,getdate()) as months  --- yers and months

--3.DATEADD()
--It will allow you to add the dates.
--It will accept three arguments.
--syntax : DATEADD(interval,value,date/datecolumn)

select DATEADD(DD,30,GETDATE()) as after30days
select dateadd(yy,30,'2021')
select *, dateadd(yy,10,ACCT_OPEN_DATE) as Date_add from Account_details -- After 10 years



--Class-21
--Sub-query/co-related query/joins

--Co-related query
--It is a subquery that uses values from outer query.
--Top down approach 

create table E1(eid int, name varchar(20), loc varchar(20)) 
insert into e1 values (1,'A','Pune')
insert into e1 values (2,'B','Delhi')
insert into e1 values (3,'C','Pune')
insert into e1 values (4,'D','Jaipur')
insert into e1 values (5,'E','Indore')
insert into e1 values (6,'F','Hyd')
insert into e1 values (7,'G','Mumbai')

create table d1 (did int, dname varchar(20), eid int)


insert into d1 values(11,'HR', 1)
insert into d1 values(12,'IT', 2)
insert into d1 values(13,'Account', 3)
insert into d1 values(14,'Finance', 4)
insert into d1 values(15,'Testing', 5)

select * from E1
select * from d1
select * from e1 where  exists (select * from d1 where d1.eid = E1.eid)

select * from e1 where  not exists (select * from d1 where d1.eid = E1.eid)


--Exists 
--Exists operator is used to test for the existence of record in a subquery.
--Exists returs TRUE if subquery returns one or more records.
 create table supply (S_ID int, SName varchar(20))
 insert into supply values (1,'Soap')
 insert into supply values (2,'Cloths')
 insert into supply values (3,'Paint')
 insert into supply values (4,'Bricks')

 select * from supply
 create table product(Pid int, ProductName varchar(20),price int,s_id int)

 insert into product values(11,'Santoor',20,1)
 insert into product values(12,'Asian',32,3)
 insert into product values(13,'dettol',35,1)
 insert into product values(14,'BGV',10,4)
 insert into product values(15,'Raymond',22,2)
 insert into product values(16,'Dinesh',24,2)

 select * from supply 
 select * from product
  select * from supply s1
 where exists  (select productname  from product p1 where p1.s_id = s1.S_ID and price >= 20 ) -- Co-Relation query 

 --Q. How will you display the supplier name and product name if price is greater than 20.?
 select s1.SName,p1.ProductName,p1.price from supply s1,product p1 
 where exists  (select productname from product where p1.s_id = s1.S_ID ) and price >= 20


 --Over Clause
 -- Over clause combined with a prtition by clause and is used to divide data into partitions.

 --syntax:
 --function() over (partition by col1,col2 ...etc)
 --Along with functions like Count(),AVG(),Max(),Min(),sum(),rank(),dense_rank() and rownumber etc.

 create table over_Test(EMPID int, FirstName varchar(20),Gender varchar(2),salary int)

 insert into over_Test values(1,'Mohini','F',1000)
 insert into over_Test values(2,'Rohit','M',2000)
 insert into over_Test values(3,'Amit','M',4000)
 insert into over_Test values(4,'Sonal','F',5000)
 insert into over_Test values(5,'Minal','F',6000)
 insert into over_Test values(6,'Amar','M',3600)
 insert into over_Test values(7,'Shital','F',4500)
 insert into over_Test values(8,'Sohil','M',6000)
 insert into over_Test values(9,'FAF','M',6500)
 insert into over_Test values(10,'Raina','M',7000)


 select * from over_Test

 select FirstName, gender,salary,
 count(gender) over (partition by gender ) as genedertotal
 ,max(salary) over( partition by gender) as maxsal
 ,min(salary) over( partition by gender) as minsal 
 ,sum(salary) over( partition by gender) as sumsal 
 ,Avg(salary) over( partition by gender) as avgsal 
 ,sum(salary) over( partition by gender order by empid) as RunningSalary 
 from over_Test 

 select  gender, count(gender), max(salary), min(salary), AVG(salary) from over_Test group by gender 

 --CLASS-22

--Rank() and DenseRank()
--It will return a rank starting at 1 based on oredering of rows and imposed by order by clause.
--Order by clause is required mandotory.
--PARTITION BY Clause is optional.

--Example:
--[sal] = [1000,1000,2000,3000,4000]
--Rank() -- [1,1,3,4,5]   
--dense_rank() --[1,1,2,3,4] -- school level mark inside the class

select * ,Rank() over (order by salary) as Rank1 from over_Test
select * ,Dense_Rank() over (order by salary) as DenseRank from over_Test

select *, rank() over (partition by gender order by salary) as rank1 from over_Test
select *, dense_rank() over (partition by gender order by salary) as denserank from over_Test
select * from over_Test

--Q.What is the diffrence between Rank() and Dense_Rank()
--Rank() -- Rank function skips ranking if there is same value or number.
--Dense_Rank() --It will not skips ranking if their is same value or number.

select * from INFORMATION_SCHEMA.tables 

select * from over_Test order by esal desc

select min(esal)  from employee where esal in 
(select top 2 esal from employee order by ESAL desc)

select * from employee

select min(salary) from over_Test where salary in
(select top 2 salary from over_Test order by salary desc)

--select * from over_Test order by salary desc

select min(salary) from over_Test where salary in
(select top 3 salary from over_Test order by salary desc)

--2nd highest salarey by using rank()

select * ,rank() over (order by salary desc) as rank1 from over_Test where rank() over (order by salary ) = 2
select * ,dense_rank() over (order by salary desc) as denserank from over_Test where rank() over (order by salary ) =2
select * from over_test
--the above query will through an exception in
--i.e. Windowed functions can only appear in the SELECT or ORDER BY clauses.

--In order to avoid this kind of exception or Error in SQl we have to use CTE i.e COMMON TBALE EXPRESSION 

--CTE (Common Table Expression)
--It is temporary result set.
--It will store the temporary results to make use of that in your main query.
--It can be referred within a SELECT,INSERT,UPDATE and DELETE statements that immediately follows the CTE.
--Only DML type of operation we can perform on CTE

--Syntax 
--With CTE_NAME (COL1, COL2,.....etc)
--AS
--CTE_Query
select * ,rank() over (order by salary desc) as rank1 from over_Test

--second and Third highest salary by using mmin and top function

select min(salary)  from over_Test where salary in 
(select top 2 salary from over_Test order by salary desc);

select min(salary)  from over_Test where salary in 
(select top 3 salary from over_Test order by salary desc);

--Third highest salary  by using Rank fuction
with HighestSalary as
(select * ,rank() over (order by salary desc) as  RANK1 from over_Test) 
select * from HighestSalary where RANK1 = 5;

--Third highest salary  by using dense Rank fuction


with HighestSalary as
(select * ,dense_rank() over (order by salary desc) as denserank from over_Test) 
select * from HighestSalary where DENSERANK = 4;


select * ,rank() over (order by salary desc) as rank1 from over_Test




with HighestSalary as
(select * ,dense_rank() over (order by salary desc) as denserank from over_Test) 
select * from HighestSalary where DENSERANK = 3;

--Third highest salary  by using Dense Rank fuction

with Result 
As 
(select * ,Dense_rank() over (order by esal desc)  as HighestSalary from employee )
select * from Result where HighestSalary = 3;




 --CLASS-24

select * from student
create table student 
(s_id int,sname varchar(20),s_loc varchar(20),sdept varchar(20))
insert into student values(1,'praveen','pune','ETL')
insert into student values(2,'Rohit','Mumbai','Testing')
insert into student values(3,'Akash','Jaipur','HR')
insert into student values(4,'Sada','Warangal','HR')
insert into student values(5,'Rajesh','Hyderabad','Account')
insert into student values(6,'Umesh','Kolar','CCD')

--Q.How to find Duplicate  from table?
--1. We can identify duplicate records by using PK
--Select <PK1>,<PK2>,... ,count(*) as duplicate from Table_Name group by <PK1>,<PK2>,... having count(*) > 1

--2.All the column from table need to include in select and group  by list
SP_Help student

select  * ,count(*) as duplicate from Student 
group by s_id,sname,S_loc,Sdept 
having count(*) > 1

select * from student

--ROW NUMBER
--It will return the sequential number of row starting at 1
--Order by clause is required.
--PARTITION BY clauese is optional
--When the data is partitioned, row number reset to 1 when the partition changes.

--syantx
--ROW_NUMBER() OVER(ORDER BY Col1,col2)

select *,ROW_NUMBER() over (order by s_ID) as Rownumber from student 

select *,Row_Number() over (Partition by s_id,sname,s_loc,sdept order by s_Id,sname,s_loc,sdept ) as rownumber from student

--Q.How to delete duplicate records from table?

with DELdup as
(select *,Row_Number() over (Partition by s_id,sname,s_loc,sdept order by s_Id,sname,s_loc,sdept ) as rownumber from student)
delete from DELdup where rownumber > 1
select * from student

--By using single column we are deleting the records from table 

with deleteduplicate as
(select *,Row_Number() over (Partition by sdept order by s_Id ) as rownumber from student)
delete from deleteduplicate where rownumber > 1


select * from student order by s_id


--SQL server functions
--1.UPPER()
--UPPER() Function converts the value of field/Column to upper case.
--The upper case function requires 1 argument
--syntax :upper (text/column name)

select UPPER(s_loc) from Student

--2.LOWER()
--Lower() Function converts the value of field/Column to lower case.
--The lower case function requires 1 argument
--syntax :lower (text/column name)

select LOWER(S_loc) from Student


--CLASS-25

--3.Substring
--The substring function used to extract charecter from text field 
--Synatx : select substring(Column_Name,Start,end[lenth]) from table_Name
--Ex: substring ( 'varchar',int,int)

select SUBSTRING('Scodeen Global',1,4)

select SUBSTRING('Praveen', 1, 2)

select * from student

select *,SUBSTRING(sname,3,len(sname)) as PartOFString from student
select SUBSTRING('student',1,3)
select SUBSTRING('222222','a',' ') --- Error : Argument data type int is invalid for argument 1 of substring function.

--4.DATALENGTH() and LEN()
--This function returns the number of bytes used to reprsent the expression.
--Syntax : DATALENGTH(string)

sp_help student
select DATALENGTH('Scodeen     ')
select *,DATALENGTH(SName) from student

create table length_check (Lid int, Lname char(20))

insert into length_check values(1,'Praveen')
insert into length_check values(2,'Amit')
insert into length_check values(3,'Meena')
insert into length_check values(4,'Sohan')
insert into length_check values(5,'Rajni')

select *, datalength(Lname) from length_check
select *,len(Lname) from length_check
select len(S_Name) from student

--5.CONCAT() , CONCAT with + and CONCAT_WS()
--The CONCAT() function adds two or more strings together.
--Syntax: CONCAT(string1,string2....)

--The + operator allows you to add two or more strings together.
--syntax:string1 + string2 + string_n

--The CONCAT_WS() function adds two or more strings together with a separator.
--syntax : CONCAT_WS(separator, string1, string2, ...., string_n)

select CONCAT('Praveen',' ','Patil')

select concat('SQL',' ','is',' ','DB Language')

select * from student

select CONCAT(sname,' ',SLoc) as NameLocation from student
select s_id+' '+ SLoc  from student

select CONCAT(s_id,' ' ,SLoc) as NameLocation from student
select CONCAT(sname,SLoc) as NameLocation from student

select Sloc + sname as NameLocation from student

select 'praveen'+' '+'Patil'

select S_id  + ' ' + cast (sname as int) from Student --- '1' 1 

select * from INFORMATION_SCHEMA.TABLES
select * from employee

select *, cast (EID as varchar) + ' ' + cast (ESAL as varchar) from employee

select *, concat(EID,ESAL) from employee

select CONCAT_WS('_','Scodeen Global','PUNE')
select CONCAT_WS('@','Scodeen Global','PUNE')

--6.LTRIM(), RTRIM() and TRIM()
--The LTRIM() function removes leading spaces from a string.
--The RTRIM() function removes trailing spaces from a string.
--TRIM() function removes leading as well as trailing spaces from string.
select len('       Scodeen'); --14
select datalength('       '); --7
select len('       '); -- 0
select len('Scodeen       ')  --7
select len('Scodeen')
select Ltrim('       Scodeen'); -- 13
select Rtrim('Scodeen      ');  --'Scodeen'
select ('Scodeen      ')  --'Scodeen      '

select trim('       Scodeen      ');--'Scodeen'



--7.Reverse()
--The REVERSE() function reverses a string and returns the result.
--synatx : REVERSE(string)

select REVERSE('Pune')

select REVERSE('SQL')

select *,REVERSE(ENAME) from employee
--8.Round
--The ROUND() function rounds a number to a specified number of decimal places.
--Syntax : ROUND(NUMERIC_EXPRESSION, length, [(function)])

--NUMERIC_EXPRESSION : it takes the number to be roundoff.
--Length : the number of digits that we want to round off.
--if length is +ve then rounding is applied after decimal and if  length is -ve the before decimal
--function : is used to indicate rounding or truncation operation. 0 -indicates rounding and non-zero indicates truncation,
--by default it is 0.

select ROUND('value',1) -- Exception 
select ROUND(78.56,0)
select ROUND(78.56,1)
select ROUND(78.56,-1)
select ROUND(78.56,2)
select ROUND(78.467,0)

select round(750.556,2) -- Round to 2 places after the decimal point

select round(750.556,2,1) --Truncate anything after 2 places after the decimal point.

select round(750.4456666,2,1)
select round(750.4456666,3)
select round(750.4456666,3,1)
select round(750.4454666,3)
--   previous number <o.5>= Next number

--9.REPLACE() 
--The REPLACE() function replaces all occurrences of a substring within a string, with a new substring.
--Note: The search is case-insensitive.
--Syntax - REPLACE(string, old_string, new_string)

select REPLACE('Mohan','O','T')

select REPLACE('Mohan','OHAN','ABCD')
select * from employee
select *,REPLACE(ENAME ,'o','A') as replacedColumn from employee
-- A-a , B-b meaning is same in replace function.

select replace ('scodeen','sc','SC')
select replace ('scodeen','SC','sc')
select Replace ('sCODEEN','sC','Sc')

--10.REPLICATE()
--The REPLICATE() function repeats a string a specified number of times.
--Syntax :REPLICATE(string, integer)

select REPLICATE('SCODEEN ',3) 

--CLASS-26
--11.CONVERT()
--The CONVERT() function converts a value (of any type) into a specified datatype.
--Syntax :CONVERT(data_type[(length)], expression, [(style)])


create table DOJ (id int, NAME varchar(20),DOJ datetime)

insert into DOJ values (1,'Mansa','2020-01-01 10:10:10')
insert into DOJ values (2,'Vasavi','2015-06-01 10:20:10')
insert into DOJ values (3,'Pravlika','2014-04-01 11:10:10')
insert into DOJ values (4,'Jyoti','2017-08-01 12:10:10')
insert into DOJ values (5,'Pushpa','2016-05-01 01:23:10')

select * from DOJ
select GETDATE()
select convert(varchar,getdate(),2)

select *, convert(varchar(11),DOJ) as NewCreatedDOJ from DOJ

select *, convert(varchar(11),DOJ,102) as NewCreatedDOJ from DOJ
select *, convert(varchar(11),DOJ,2) as NewCreatedDOJ from DOJ

--Style
--Converting datetime to character:
--Without		With 	  Input/Output					Standard
--century		century
--0				100		  mon dd yyyy hh:miAM/PM		Default
--1				101		  mm/dd/yyyy					US
--2				102		  yyyy.mm.dd					ANSI
--3	            103		  dd/mm/yyyy	                British/French
--4	            104		  dd.mm.yyyy	                German
--5				105	      dd-mm-yyyy					Italian
--6				106		  dd mon yyyy	                -
--7	            107	      Mon dd, yyyy	                -
--8	            108	      hh:mm:ss	                    -
--9	            109	      mon dd yyyy hh:mi:ss:mmmAM (or PM)	Default + millisec
--10	        110	      mm-dd-yyyy	                USA
--11			111		  yyyy/mm/dd					Japan
--12			112	      yyyymmdd						ISO
--13			113	      dd mon yyyy hh:mi:ss:mmm		Europe (24 hour clock)>
--14			114	      hh:mi:ss:mmm					24 hour clock
--20			120	      yyyy-mm-dd hh:mi:ss			ODBC canonical (24 hour clock)
--21			121	      yyyy-mm-dd hh:mi:ss.mmm		ODBC canonical (24 hour clock)
-- 				126	      yyyy-mm-ddThh:mi:ss.mmm		ISO8601
-- 				127	      yyyy-mm-ddThh:mi:ss.mmmZ		ISO8601 (with time zone Z)
-- 				130	      dd mon yyyy hh:mi:ss:mmmAM	Hijiri
-- 				131	      dd/mm/yy hh:mi:ss:mmmAM		Hijiri


--12.CAST()
--The CAST() function converts a value (of any type) into a specified datatype.
--Syntax :CAST(expression AS datatype [(length)])
select convert(varchar,GETDATE())

select cast(getdate() as varchar)
select * from DOJ
select *,CAST(DOJ as varchar) as DOJConverted from DOJ

--13.CHARINDEX()
--The charindex() function searches for a substring in a string and returns position.
--if the substring is not found, this function returns 0.
--syntax : CHARINDEX(Substring,string,start)

select CHARINDEX('@',@string+1,len() as matchingpostion

--Q.How will you findout the place of charecter 'E' in 'SCODEEN'?
select CHARINDEX('E','SCODEEN') 
select CHARINDEX('sc','scodeen') as matching

select * from student 

select SUBSTRING('Asdfghjkllkjhgfdsabcgfjhhhkabcfgabcngabc',CHARINDEX('abc'),len('abc') )


--Q.How find domain or server from email column ?VVVIMP****
select S_ID,SUBSTRING([email],CHARINDEX('@',[email])+1,len([email])) as domain from student 

select *,SUBSTRING(email, CHARINDEX('@',[email])+1,len([email]) from student

		select substring ('Praveen123@gmail.com',12,20)

select CHARINDEX('@',[email]) from student --11+1 =12
select len(email) from student -- 20


--Q.How to find the number of occurance of 'e' charetcer in string? L&T
SELECT DATALENGTH('lleelleellee') ---12
select len(REPLACE('lleelleellee','e','')) --6

SELECT (DATALENGTH('lleelleellee')-len(REPLACE('lleelleellee','e',''))) ---6
--or 
select len(REPLACE('lleelleellee','e',''))


--CLASS-27
--Views
--It is logical/virtual table.
--It is nothing more than SQL query 
--Syntax: 
--Create View <v_VIEWNAME>
--AS
--(SQL Query) DML statement

create table depart_ment(DID int , DeptName varchar(20))

insert into depart_ment values (1,'IT')
insert into depart_ment values (2,'Admin')
insert into depart_ment values (3,'Account')
insert into depart_ment values (4,'HR')

select * from depart_ment

create view Department_Details as select deptname from depart_ment 

select * from Department_Details

select * from [dbo].[DepartmentDetails]

select * from [dbo].[vDepartmentDetails]


create table employee_1(EID int,ENAME varchar(20),salary int,gender varchar(2), did int)

insert into employee_1 values (1,'Shon',2000,'M',2)
insert into employee_1 values(2,'john',8000,'M',3)
insert into employee_1 values(4,'Charli',4000,'M',2)
insert into employee_1 values(5,'mita',1000,'F',4)
insert into employee_1 values(6,'ben',3000,'M',1)

create view vempDept as select * from employee_1 
select * from vempDept




select * from depart_ment
select * from employee_1

create view vEmployeeDetails as
select e1.EID,e1.ename,e1.salary,d1.deptname from depart_ment d1 
join employee_1 e1 on  e1.did =d1.did

update vEmployeeDetails set ename = 'sudhir' where eid = 2

select * from employee_1
select * from depart_ment
select * from vEmployeeDetails

select * from vEmployeeDetails

drop view [dbo].[vDepartmentDetails]
sp_helptext vEmployeeDetails
sp_help vEmployeeDetails



--CLASS-28
--Store Procedure

--sp_help --to view the 

--sp_rename --to rename the column of a table 

-- Transact-SQL Syntax for sp_rename in SQL Server and Azure SQL Database

sp_rename [ @objname = ] 'object_name' , [ @newname = ] 'new_name'   
    [ , [ @objtype = ] 'object_type' ]


--sp_helptext-- It will allow you to view the script of view or Sp.

sp_help vNumberofTables

sp_rename 'vNumberOfTables ', 'new_name'

sp_helptext new_name

select *from new_name


--It is block of script/code to perform an ceratin action whenever it is needed.
--it works like function.
--If you have a situation, where you write the same query again and again, 
--instead of writing again and again will save that query as stored procedure and call it by its name 

--How to create the Store procedure
--there are two ways of creating SP
--1.Without Parameter
--2.With parameter

--Synatx:
--create proc / Procedure <STORE_PROCEDURE_NAME>
--[(Paramenter) <Data type><SIZE>]
--[Input/output]
--As
--begin
--Statements or SQL query
--END

--1.Without Parameter
create proc spEMPdetails 
as
begin
select e1.EID,e1.ename,e1.salary,d1.deptname from depart_ment d1 
join employee_1 e1 on  e1.did =d1.did
END 

create proc EMPdetails 
as
begin
select * from employee_1
END 

EMPdetails

drop proc spEMPdetails

--Three diffrent ways we can excecute SP
--1.
spEMPdetails
--2
Exec spEMPdetails
--3.
Execute spEMPdetails
--Error
select * from spEMPdetails
--Invalid object name 'spEMPdetails'

--2.With Parameter
create proc spMultiplication(@a int,@b int)
as 
begin

	declare @multiply int
	set @multiply = @a + @b 

	print(@multiply)
END
--============
--Excute the SP with parameter we need to pass the values 
exec spAddition 4,5

drop procedure 

create proc spAddition(@a int,@b int)
as 
begin

	declare @multiply int
	set @multiply = @a * @b 

	print(@multiply)
END

create proc mvAdditions(@a varchar(20),@b varchar(20))
as 
begin

	declare @mvAdditions varchar
	set  @mvAdditions  = @a 
	set  @mvAdditions  = @b

	print( @mvAdditions)
END

mvaddtions 'sur','aj'

--Trigger execute spEMPdetails

--Index
--Cursor
--Diffrence between Views and Store procedure
--		View											store Procedure
--1.Views does not accept parameters				1.SP accepts Parameters
--2.Views can contain only single SELECT query		2.SP contains several SELECT statements with condition like if-else etc.
--3.By using views we cant perform modification		3.SP perform modification to one or more tables.
--	to table
--4.Views act as virtual table						4.SP acts as function.



--CLASS-29
--Triggers
--Triggers fired autoimatically once you perform any DML (Insert update and delete) operation on table.
--Trigger is also a special kind of store procedure.

create table emp(EID int,EName varchar(20),salary int, gender varchar(2))

insert into emp values (1,'A',300,'M')
insert into emp values (2,'V',300,'F')
insert into emp values (3,'C',300,'F')
insert into emp values (4,'D',300,'M')

--syntax: create trigger trigger_Name
--on
--for insert/update/delete
--as
--begin

----trigger statements---

--END

create table audit_date(AID int identity  ,auditdate varchar(300))

drop table audit_date

CREATE trigger trEmpinserted
On  emp
for Insert
as 
begin
--select * from inserted 
		Declare    @EID  int
		select @eID = eid from inserted

	insert into audit_date values (cast(@eid as varchar(5)) +' '+ 'is added at' +' '+	cast(getdate() as varchar(20)))

END
--Note:
--Inserted Table is special kind of table used by trigger and it is available only into the the context of trigger.
--Select * from Inserted 
--1.It returns the copy of rows inserted into the table.
--2.Struture of the inserted table is identical or same , whatever the table on which we have created trigger.

select * from emp
select * from audit_date --trigger
insert into emp values (6,'H',600,'F')


alter trigger trDeleteRecord
On  emp
for Delete
as 
begin
--select * from inserted 
		Declare    @EID  int
		select @eID = eid from deleted

	insert into audit_date values (cast(@eid as varchar(5)) +' '+ 'is deleted at' +' '+	cast(getdate() as varchar(20)))

END
select * from emp
select * from audit_date
delete from emp where eid=6
