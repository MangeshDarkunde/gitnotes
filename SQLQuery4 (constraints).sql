use demo1
go


--Constraints:

--1. purpose: maintain integrity of data
--2. SQL constraints are used to specify rules for the data in a table.
--3. Constraints are used to limit the type of data that can go into a table. 
--4. This ensures the accuracy and reliability of the data in the table. 
--5. If there is any violation between the constraint and the data action, the action is aborted.

--1] Primary key
--Two conditions 1]Unique & 2]Not null

--The PRIMARY KEY constraint uniquely identifies each record in a table.

--Primary keys must contain UNIQUE values, and cannot contain NULL values.

--A table can have only ONE primary key and in the table, this primary key can consist of single or multiple columns (fields).


create table A1 (id int primary key, name varchar (2);--for int
insert into A1 values (1,'A');

insert into A1 values (null,'a');--false
insert into A1 values (2,null);

create table A11 (id int, name varchar(2) primary key);--for varchar
insert into A11 values (1,'A');
insert into A11 values (2,'B');
insert into A11 values (3,'B');--false
insert into A11 values (null,'d');
insert into A11 values (3,null);--false
select * from A11;

--we can apply multiple constraints to single column
create table A12 (id int, name varchar(2) unique not null);
insert into A12 values (1,'A');
insert into A12 values (2,'B');
insert into A12 values (3,'B');--false
insert into A12 values (null,'d');
insert into A12 values (3,null);--false
select * from A12;

--2] Unique
--only one condition 1]unique

create table A2 (id int unique, age int);
insert into A2 values (1,10);
insert into A2 values (null,20);

--3] Not null

create table A3 (id int, name varchar(10) not null);
insert into A3 values (1,'A');
insert into A3 values (1,'A');
insert into A3 values (1,null);--false
insert into A3 values (null,'A')
select * from A3;


--4] check
create table A4 (id int, age int check (age>=18));
insert into A4 values (1,18);
insert into A4 values (1,20);
insert into A4 values (1,20);
insert into A4 values (1,17);--false
SELECT * FROM A4;

--mobile num should accept only 10 digit :
--**note: mobile number should mention in biint as for int datatype does not hold value grater tha -2147483648 to 2147483647

create table z11 (id int, mo bigint check(len(mo)=10));
insert into z11 values (11,9922622301)--accept
insert into z11 values (11,99226223011)--not accept throwing error maximum than datalength mentioned
insert into z11 values (11,992262230)--not accept throwing error of check constraint
insert into z11 values (11,99226223)--not accept throwing error of check constraint

select *,len(mo) from z11;

--5] default
create table A5 (id int, city varchar(10) default 'Pune');
insert into A5 values (1,'Pune');
insert into A5 values (1,default);
insert into A5 values (1,'');--wrong statement for default
insert into A5 (id) values (10);
insert into A5 (id) values (20);
INSERT INTO A5 VALUES (1,'MUMBAI');

select * from A5;

--6] Foreign key
--1. To maintain referential integrity between two tables.
--2. The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
--3. A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
--4. The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.


select * from INFORMATION_SCHEMA.TABLES

create table department (DID int primary key, dept varchar(10));
insert into department values (1,'civil');
insert into department values (2, 'Mech');
insert into department values (3, 'IT');
insert into department values (4, 'entc');
select * from department

create table students (SID int, name varchar (10), DID int foreign key references department (DID));
insert into students values (10,'Amit',2);
insert into students values (20,'Mangesh',1);
insert into students values (10,'aman',4);
insert into students values (10,'ram',5);
insert into students values (10,'rahim',3);
insert into students values (10,'rahim',4);
insert into students values (30,'rahim',null);--accepted
insert into students values (30,'rahim',null);--accepted


select * from department
select * from students;

--another foregin key example

begin transaction --after execution of begin transaction query whatever changes we have done in
                  -- data if want to retrive then execute rollback it will retrive data available as before execution of begin transaction query
rollback;

create table parent (Loc_ID int primary key, Loc_Name varchar(10));

insert into parent values (1,'Pune')
insert into parent values (2,'Lonavala')
insert into parent values (3,'Banglore')

select * from parent

--1)Parent table cannot be deleted and child records can be deleted
--create table child (Emp_No int primary key,Emp_Name varchar(10),Gender varchar(10),Creation_Date Date
--		             ,Loc_ID int foreign key references parent(Loc_ID));

--2)Parent table can be deleted and deleted values from parent table takes null values in child table.
--create table child (Emp_No int primary key,Emp_Name varchar(10),Gender varchar(10),Creation_Date Date 
--                   ,Loc_ID int foreign key references parent(Loc_ID) on delete set null); 

--2)Parent table can be deleted and deleted values from parent table leads to delete records from child table.
--create table child (Emp_No int primary key,Emp_Name varchar(10),Gender varchar(10),Creation_Date Date
--                    ,Loc_ID int foreign key references parent(Loc_ID) on delete cascade);

create table child (Emp_No int primary key,Emp_Name varchar(10),Gender varchar(10),Creation_Date Date 
                   ,Loc_ID int foreign key references parent(Loc_ID)); 

insert into child values (101,'Rahul','M',Getdate(),1)
insert into child values (102,'Amar','M',Getdate(),3)
insert into child values (103,'Sunita','F',Getdate(),2)
insert into child values (105,'Latika','F',Getdate(),2)
insert into child values (104,'Ram','M',Getdate(),4)--false statement as foreign key reference data not match with parent table

select * from child
select * from parent

--drop table child;

delete child Where emp_no=101

delete parent Where Loc_ID=1
delete parent Where Loc_ID=3
delete parent

select * from parent inner join child on parent.Loc_ID=child.Loc_ID-- for knowing loc_id belongs to which Loc_name

select emp_no,Emp_name,child.loc_id,loc_name from parent join child on parent.Loc_ID=child.Loc_ID
--------------------------------------------------------------------------------------------------------------------------

--a] Auto Increment (identity is the key used for auto increment)
create table A6 (Account_no int primary key identity(10,1), name varchar (10), branch varchar (10));

insert into A6 values ('A','Pune');
insert into A6 values ('A','Pune');
insert into A6 values ('A','Pune');
insert into A6 values ('A','Pune');
insert into A6 values ('A','Pune');
insert into A6 values (18,'A','Pune');

select * from A6;
delete A6 where Account_no=18;



