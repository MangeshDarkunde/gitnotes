use demo1
go
--Topics:
--Views
--SP(store procedure)
--trigger
--Index
--Cursors
--Pivot and Unpivot

--Views
--it is virtual table.
--It is copy of original table
--We can perform DDL and DML operation

--Except drop statement every statement in view would be change both view and table data and viceversa.

--Syntax
--CREATE View vVIEW_NAME
--AS
--SQL Statements


create table viewtest (VID int,Firstname varchar(20), LastName varchar(20), Loc varchar(20))

insert into viewtest values (1,'A','B','AB')
insert into viewtest values (2,'C','D','CD')
insert into viewtest values (3,'E','F','EF')
insert into viewtest values (4,'G','H','GH')
insert into viewtest values (5,'I','J','IJ')

create table viewtest1 (VID1 int,Firstname varchar(20), LastName varchar(20), Loc varchar(20), VID int)

insert into viewtest1 values (1,'Amit','Verna','Pune',1)
insert into viewtest1 values (2,'Sumit','Sharma','delhi',2)
insert into viewtest1 values (3,'Rohit','Patil','Sangali',3)
insert into viewtest1 values (4,'Mihit','Thakur','Jaipur',6)
insert into viewtest1 values (5,'Sohan','Pawar','Indor',7)

--Q. How to create view?
create view vJoinDetails
as
select a.VID,b.Firstname,b.LastName from viewtest a join viewtest1 b on a.VID =b.VID;

--Q,How to extract or select views?
select * from vJoinDetails

--How to see the script inside in a view?
sp_helptext vjoinDetails

--Q.how to drop a view?
drop view vJoinDetails

create view vViewDetails
as
select VID1,FirstName,Loc from viewtest1

--view
select * from vViewDetails
select * from viewtest1

-- insert into view 
insert into vViewDetails values (16,'Kumar','Nasik','bhosari')

--insert into table
insert into viewtest1 values (19,'Ram','Ayodhya','kashmir',9)

--delete from table
delete viewtest1 where vid1=19

--delete from view
delete vviewdetails where vid1=16

--update in table
update viewtest1 set Loc='kolhapur' where vid1=5

--update in view
update vViewDetails set Loc='kailash' where vid1=4


--Table
--Table insertion
insert into viewtest1 values (17,'Ajit','Pawar','Wai',5)
insert into viewtest1 values (18,'Ajay','Singh','Nigdi',9)

--Alter view
Alter view vViewDetails
as
select VID1,FirstName,lastname,Loc from viewtest1

--Update view 
update vViewDetails set firstName ='Klinton' where VID1=5

select * from vViewDetails
select * from viewtest1

--inside a view we can have only one SELECT statament.
--if we use two SELECT statement then it will through an exception.
--Exception: Incorrect syntax near the keyword 'select'.

create view vTwoSelect
AS
select * from viewtest
select * from info
-------------------------------------------------------------------------------

--Store Procedure(SP)
--It is block of code to perform certain action , whenever it is needed.
--It works like function

--SP_HELP - this is used to identify structure of table.

--We can create two types of store procedure 
--1.Without parameter
--2.With parameter

--Syntax:
--CREATE PROCEDURE /PROC sp_STORE_PROCEDURE_NAME
--[(@parametrs) <data type>  <size>]  --optional
--As
--BEGIN

--		SQL Script


--END

--1.Without Parameter


create table student (S_ID int,FirstName varchar(20),LastName varchar(20),Loc varchar(20))

insert into student values (11,'Amit','Verma','Pune')
insert into student values (12,'Sumit','Sharma','Delhi')
insert into student values (13,'Rohit','Patil','Sangali')
insert into student values (14,'Mohit','Thakur','Jaipur')
insert into student values (15,'Sohan','Pawar','Indor')


--SP creation
create procedure spStudentDetails
As
begin

   select * from student

END

--Q.How to execute SP?
--1.
spStudentDetails
--2
exec spStudentDetails
--3.
execute spStudentDetails


--Q.How to view script from SP?
SP_helptext spstudentDetails


--We can use multiple SELECT statemnets inside SP.
create proc spTwoTableDetails
As
begin

	select * from student
	select * from viewtest
END


spTwoTableDetails


--2.With Parameter
create procedure spAddition(@x int,@y int)
as 
begin

declare @add int
set @add = @x + @y

print 'Addition of two numbers = ' +  cast(@add as varchar)

END 
--================================
Execute spAddition 50,70

--Subtraction sp

create procedure spsubtraction(@x int,@y int)
as 
begin

declare @subtract int
set @subtract = @x - @y


print (@subtract)

END 
--================================
Execute spsubtraction 60,50


--Simple Calculator
create proc spCalculator(@a int ,@b int)
as
begin

declare @add int
declare @Sub int
declare @Mul int
declare @Div int

set @add = @a + @b
set @Sub = @a - @b
set @Mul = @a * @b
set @Div = @a / @b

print 'Sum of two numbers = ' + ;
print 'Substraction of two numbers = ' + cast (@sub as varchar)
print 'multiplication of two numbers = ' + cast (@mul as varchar)
print 'Division of two numbers = ' + cast (@div as varchar)

END

ALTER proc [dbo].[spCalculator](@a int ,@b int)
as
begin

declare @add int
declare @Sub int
declare @Mul int
declare @Div int

set @add = @a + @b
set @Sub = @a - @b
set @Mul = @a * @b
set @Div = @a / @b

print 'Sum of two numbers = ' + cast (@add as varchar)
print 'Substraction of two numbers = ' + cast (@sub as varchar)
print 'multiplication of two numbers = ' + cast (@mul as varchar)
print 'Division of two numbers = ' + cast (@div as varchar)

END

spCalculator 50,5

--Diffrence between views and SP
--Views														Store Procedure(SP)
--1.Views does not accepts parameters.						1.SP accepts parameters.
--2.Views can contain only one SELECT staments.				2.SP can contains several SELECT statements.
--3.Not requied any storage space							3.SP required storage
--4.Views acts as virtual table								4.SP acts as function.
--5.By using views we can't perform modification			5.By using SP we can modify one or more tables at a time.
--  on multiple tables at once

------------------------------------------------------------------------------------------------------------------------------------
--Triggers
--Triggers fired automatically , once you perform any DML(INSERT,DELETE & UPDATE) opertion on table.
--Triggers are also known as special kind of store procedure.

--Syntax
--create trigger tr_Trigger_Name
--on TABLE_NAME
--for INSERT/DELETE/UPDATE
--as
--begin

--	SQL script/statements.

--END


create table emp(EID int,E_Name varchar(20),salary int , gender varchar(10))

insert into emp values (1,'anil',2000,'M')
insert into emp values (2,'Sunil',3000,'M')
insert into emp values (3,'Amit',4000,'M')
insert into emp values (4,'Sumit',5000,'M')
insert into emp values (5,'Rohit',6000,'M')

select * from emp

--trigger for insert
create trigger tr_Test_Insert
on emp
for insert
as
begin 
 
	select * from inserted

end

--Note:
--Inserted is special kind of table used by trigger and it is available only within the context of trigger.
select * from inserted
--1.Execution of trigger returns the copy of rows inserted into the table.
--2.Structure of INSERTED table is excat or identical or same on which we are creating trigger.

insert into emp values (7,'sheena',8000,'F')
delete emp where eid in (6,7)

select * from emp

--trigger for delete
create trigger tr_Test_delete
on emp
for delete
as
begin
	select * from deleted
end

select * from emp
delete emp where eid =5

--update trigger
create trigger tr_test_update
on emp
for update
as
begin
	select * from deleted
	select * from inserted

end

--update = delete + insert 

select * from emp

update emp set E_name='Rohan' , salary =5300 where eid =3

--Q.how to drop trigger from table?
drop trigger [tr_TEST_UPDATE]

--Q. How to save historical records for changes in table due to DML statements only.

create table RecordInfo (ID int identity, TrackRecordInfo varchar(300))

--For insert trigger will maintion record info
create trigger tr_trackInserted
on emp
for insert
as
begin
		declare @eid int
		select @eid = eid from inserted 
		
		insert into RecordInfo values ('EID' + cast(@eid as varchar(5)) + ' '+ 'is inserted at '+' '+ cast(getdate() as varchar(20)))

END


insert into emp values (6,'meena',8500,'F')

select * from emp
select * from RecordInfo

--For delete trigger will maintion record info
create trigger tr_Deleted
on emp
for delete
as
begin
		declare @eid int
		select @eid = eid from deleted 
		
		insert into RecordInfo values ('EID'+cast(@eid as varchar(5)) + ' '+ 'is deleted at'+' '+ cast(getdate() as varchar(20)))

END

sp_helptext tr_deleted

--For update trigger will maintion record info
create trigger tr_update
on emp
for update
as
begin
		declare @eid int
		select @eid = eid from inserted 
		
		insert into RecordInfo values ('EID'+ cast(@eid as varchar(5)) + ' '+ 'is updated at'+' '+ cast(getdate() as varchar(20)))

END


select * from emp
select * from RecordInfo

delete emp where EID=4

update emp set E_Name ='pravin' where EID =2

delete RecordInfo where id=15

---------------------------------------------------------------------------------------------------------------------------------------

--INDEX
--Indexes are used to retrive the data from table more quikly or faster than anything.
--User cannot see the indexes but they are used to speed up the search.

create table INDEX_TEST(ID int primary key ,FirstName varchar(20))

insert into INDEX_TEST values (1,'A')
insert into INDEX_TEST values (2,'B')

--How to find indexs defined on a table?
sp_helpindex index_test

--Syntax
--create index IX_Index_Name
--On Table Name (col1,col2,col3....coln)

create index IX_TEST1
on INDEX_TEST(id,firstname)

--Two types of indexes
--1.Clustered Index
--2.Non-Clustered Index 

--1.Clustered Index
--Whenever you apply clustered indexing in a table, it will perform sorting in that table only. 
--You can create only one clustered index in a table like primary key. 
--Clustered index is as same as dictionary where the data is arranged by alphabetical order. 
--In clustered index, index contains pointer to block but not direct data. 

--synatx
--Create Clustered Index IX_Index_Name
--ON Table Name (Col1,col2....etc)

--2.Non_Clusterd Index
--Non-Clustered Index is similar to the index of a book. 
--The index of a book consists of a chapter name and page number, 
--if you want to read any topic or chapter then you can directly go to that page by using index of that book. 
--No need to go through each and every page of a book. 
--The data is stored in one place, and index is stored in another place. 
--Since, the data and non-clustered index is stored separately, then you can have multiple non-clustered index in a table. 

--synatx
--Create NonClustered Index IX_Index_Name
--ON Table Name (Col1,col2....etc)

--Diifrence between clustered and Non-Clusterd index
--CLUSTERED INDEX	                                              NON-CLUSTERED INDEX
--1.Clustered index is faster.							          1.Non-clustered index is slower.
--2.Clustered index requires less memory for operations.          2.Non-Clustered index requires more memory for operations.
--3.In clustered index, index is the main data.	                  3.In Non-Clustered index, index is the copy of data.
--4.A table can have only one clustered index.	                  4.A table can have multiple non-clustered index.
--5.Clustered index store pointers to block not store data.	      5.Non-Clustered index store both value and a pointer to actual row that holds data.
--6.e.g Dictionary                                                6. e.g Book index

use SSIS_CS
go

select *from customer

select * from INFORMATION_SCHEMA.TABLES

--Verifying clustered and non-clustered Index

sp_help customer--check any constraints

select * from customer where Customer_id=18000

select * from customer where firstName='Ana'

create nonclustered index IX_firstname
on customer(firstname)

create clustered index IX_customerid
on customer(customer_id)


create nonclustered index IX_customeridnonclustered
on customer(customer_id);

-------------------------------------------------------------------------------------------------------------------------------

use demo1
go

--Pivot and unpivot
--Q-How will you convert column into row? --pivot
--Q-How will you convert row into column?--unpivot

--Pivot is SQL operator that can be used to extract unique values from one column and convert it into multiple columns as output.

--Syntax:
--SELECT <NON_PIVOTED COLUMNS>, First Pivoted col1,second Pivoted col2,....last Pivoted coln
--From Table_Name
--PIVOT
--(
--		<aggregate function> (columns being aggregated)
--FOR (<Columns that contains the value that will become column header>)
--IN (First Pivoted col1,second Pivoted col2,....last Pivoted coln)
--) as <alias for pivot table>

create table product(Salesagent varchar(50),country varchar(50),amount int)

insert into product values ('amit','India',200)
insert into product values ('sumit','us',100)
insert into product values ('rohit','Uk',300)
insert into product values ('amit','us',90)
insert into product values ('rohit','India',220)
insert into product values ('sumit','uk',230)
insert into product values ('sumit','India',140)
insert into product values ('rohit','us',340)
insert into product values ('amit','uk',200)
insert into product values ('sumit','India',240)
insert into product values ('rohit','us',140)
insert into product values ('amit','us',100)

select * from product

select salesagent, INDIA,US,UK from product
PIVOT
(
		sum (amount)
		For country
		IN (INDIA,US,UK)

) AS pivot_Table ;

select Salesagent, INDIA,US,UK from product
PIVOT
(
		max (amount)
		For country
		IN (INDIA,US,UK)

) AS pivot_Table; 

--salesagent	INDIA	US	UK   year city
--amit			200		190	200  2002 sydeny
--rohit			220		480	300	 2004 newyork
--sumit			380		100	230  2006 london



create table sales(salesagent varchar(50),INDIA int,US int,UK int)

insert into sales values ('amit',200,190,200)
insert into sales values ('rohit',220,480,300)
insert into sales values ('sumit',380,100,230)

select * from sales 

select salesagent ,country,amount from sales 
UNPIVOT
(
		amount
		for country
		in (INDIA,UK,US)

) AS UNPIVOT_T

--Syntax
--SELECT <NON_PIVOTED COLUMNS>, First unPivoted col1,second unPivoted col2,....last unPivoted coln
--From Table_Name
--UNPIVOT
--(
--		<columns being converted to unpivot values>
--FOR (<Columns that contains the value that will become unpivoted column values>)
--IN (First unPivoted col1,second unPivoted col2,....last unPivoted coln)
--) as <alias for unpivot table>

-------------------------------------------------------------------------------------------------------------------------------------

--Cursor
--Suppose if we want to process the rows  on ROW-by-ROW basis then cursors are good choice but if record in tables are less.
--Cursors are nothing but pointer to a row.
--Cursors can easily replaced by joins.
--Cusrors are bad for performance.

--Syntax
--declare a cusror object
DECLARE <Cursor_Name> CURSOR FOR <SQL_QUERY>
--We have to open the cusror by using OPEN keyword
OPEN <Cursor_Name>
-- we have to fetch the record bu using fetch command 
FETCH NEXT FROM <Cursor_Name> [into @variable_name[,...n]
--we need to close the cursor by using close keyword
CLOSE <Cursor_Name>
--Once we close then we need deallocate the cursor by using DEALLOCATE keyword
DEALLOCATE <Cursor_Name>



declare @id int
declare @sname varchar(50)


declare ScoddenCursor cursor for 
select Id,Sname from ScodeenDetails where Id <=1000

open ScoddenCursor

fetch next from ScoddenCursor into @id,@sname
print 'id= ' +' '+ cast(@id as varchar(10)) +' ' + 'Name= ' + @sname 

fetch next from ScoddenCursor into @id,@sname
print 'id= ' +' '+ cast(@id as varchar(10)) + 'Name= ' + @sname 

close ScoddenCursor

deallocate ScoddenCursor













