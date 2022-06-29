create table info3 (srno int, name varchar (10), age varchar (3));

insert into info3 values (10,'mangesh',21);
insert into info3 values (11,'ram',23);
insert into info3 values (12,'rahim',27);

insert into info3 values (10,'mangesh',23);
insert into info3 values (14,'ram',22);
insert into info3 values (13,'rahim',25,15555);

select * from info3;

--truncate (delete whole table at a same time)

--syntax truncate table table_name;

truncate table info3;
-------------------------------------------------------------------

--delete (can delete whole table data or delete pericular rows)

--syntax delete table_name where col_name ='values'

select * from info3;

delete info3;

delete info3 where name='mangesh';

----------------------------------------------------------------------
---drop ( use to delete table)

--syntax drop table table_name;

drop table info;

------------------------------------------------------------------------
--Alter

--add col, delete col,alter datatype,alter datalength,add constaint,drop constraint

--add
--syntax: alter table table_name add col_name datatype

alter table info3 add salary int; --add single column
select * from info3 ;

alter table info3 add pin_code int, pan_card int; --add multiple column

--delete column structure
--alter table table_name drop column col_name
alter table info3 drop column pin_code, pan_card;

--datatype
--alter table table_name alter column col_name datatype

alter table info3 alter column salary varchar (10);
alter table info3 alter column age int;

--datalength
alter table info3 alter column salary varchar (20);

select * from info3;

--add constarints
create table c1 (id int, name varchar(10));

insert into c1 values (1,'a')
insert into c1 values (2,'b')
insert into c1 values (3,'b')

alter table c1 alter column id int not null--must for next query execution

alter table c1 add constraint p_key primary key(id)--to add constraint first alter that column into not null 

sp_help c1

--drop constraint

alter table c1 drop constraint p_key
---------------------------------------------------------------------------------
--SQL Aggregate Functions

--min, max,top, count, sum, avg, distinct

update info3 set age=20 where name='rahim' and srno=13

-----------------------------------------------------------------------
--Aggregate functions:

select * from info3;
select age from info3;
select min(age) from info3;
select max(age) from info3;
select avg(age) from info3;
select sum(age) from info3;
select count (age) from info3;
select count (salary) from info3; --not counting null values
select count(*) from info3;--total records/rows
select count (name) from info3;
select distinct (name) from info3
select count (distinct (name)) as new from info3;--as new is a alias used for assigning column name to the result temporary

select * from info3;

insert into info3 values (10,'mangesh',21);
insert into info3 values (11,'ram',23);
insert into info3 values (12,'rahim',27);

select distinct (name) as new from info3;

---------------------------------------------------------------------
--Top

select distinct top 3 name from info3 order by name ;
select top 4 age from info3;
select top 4 * from info3 order by age desc; --not giving exact bottom 4
select distinct  * from info3 order by age 

--Q-find 2nd highest age using top

select min(age) from (select distinct top 2 age from info3 order by age desc) as new

select top 1 age from info3 where age in (select distinct top 2 age from info3 order by age desc) order by age asc

--Q Find second lowest age using top

select max(age) from (select distinct top 2 age from info3 order by age  asc) as new

select top 1 age from  (select distinct top 2 age from info3 order by age  asc) as new order by age desc

select top 1 age from info3 where age in  (select distinct top 2 age from info3 order by age  asc) order by age desc


























