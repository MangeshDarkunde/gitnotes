--rank, dense_rank, row_number

--1] row_number: 
--   Returns an increasing unique no for each row starting at 1 even if there are duplicates

--2] rank:
--   Returns an increasing unique no for each row starting at 1. When there are duplicates, same rank is assigned to all the duplicates rows,
--   but the next row after the duplicate rows will have the rank it would have been assigned if there had been no duplicates.
--   So rank function skips the ranking if there are duplicates.

--3] dense_rank:
--   Returns an increasing unique no for each row starting at 1. When there are duplicates, same rank is assigned to all the duplicates rows,
--   but the dense_rank function will not skip the any rank.This means next row after the duplicate rows will have then next rank in the sequence.


use demo1

select * from info6; --info6 table name already created and added added extra two row

insert into info6 values ('akshay',55);
insert into info6 values ('akshay',90);

select * from info6; --info6 table name already created and added added extra two row

select *, ROW_NUMBER() over (order by marks) as row_num from info6;

select *, Rank() over (order by marks) as rank from info6;

select *, Rank() over (order by name) as rank from info6;

select*, DENSE_RANK () over(order by marks) as dense_rank from info6;

select *, ROW_NUMBER() over (order by marks) as 'Row_number',DENSE_RANK () over(order by marks) as 'dense_rank',RANK () over(order by marks) as 'rank' from info6;

select *, ROW_NUMBER() over (order by  marks desc) as 'Row_number',DENSE_RANK () over(order by marks desc) as 'dense_rank',RANK () over(order by marks desc) as 'rank' from info6;
--(order by desc used to arrange data in desceneding order to get highest mark at top position)

---------------
--To fectch perticular dense_rank value

--with CTE_NAME as
--CTE_QUERY
--select * from CTE_NAME where column name= dense rank value

with new_rank as
(select *, DENSE_RANK () over (order by marks desc) as number from info6)
select * from new_rank where number=2;

---use partition by

create table over_Test(EMPID int, FirstName varchar(20),Gender varchar(2),salary int) 
insert into over_Test values(1,'Mohini','F',1000)
insert into over_Test values(2,'Rohit','M',2000)
insert into over_Test values(3,'Amit','M',4000) 
insert into over_Test values(4,'Sonal','F',5000)
insert into over_Test values(5,'Minal','F',6000)
insert into over_Test values(6,'Amar','M',3600) 
insert into over_Test values(7,'Shital','F',4500)
insert into over_Test values(8,'Sohil','M',6000)
insert into over_Test values(9,'praveen','F',9000) 
insert into over_Test values(10,'Mithali','F',9000)
insert into over_Test values(11,'seema','F',9000) 
insert into over_Test values(12,'meena','F',10000) 
insert into over_Test values (3,'amit','m',4000,'finance')
select * from over_Test

--find duplicate records
with duplicate as
(select *, row_number () over (partition by EMPID,firstname,gender,salary,department 
order by EMPID,firstname,gender,salary,department desc) as row_no from over_test) 
select * from duplicate where row_no>1;

--delete duplicate records
with duplicate as
(select *, row_number () over (partition by EMPID,firstname,gender,salary,department 
order by EMPID,firstname,gender,salary,department desc) as row_no from over_test) 
Delete from duplicate where row_no>1;