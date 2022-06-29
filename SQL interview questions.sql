use joinDB
go

--Q. Find out max salary from two tbale

select * from dept1;
select * from dept2;

--maximun salary from each table
select top 1  dept1.Name, dept1.salary,dept2.name,dept2.salary from dept1,dept2
order by dept1.salary desc,dept2.salary desc

--maximum salary from both table
with new as
(select  * from dept1 union select * from dept2)
select top 1 * from new order by salary desc

--minimum salary from each table
select top 1 dept1.Name, dept1.salary,dept2.name,dept2.salary from dept1,dept2 
order by dept1.salary asc,dept2.salary asc

--manimum salary from both table
with new as
(select  dept1.Name, dept1.salary from dept1 union select dept2.name,dept2.salary from dept2)
select top 1 * from new order by salary asc


--Q. Write a query for ipl matches between 10 teams such that in every team will play one match against each team ?

select * from ipl

--One match with each team

select t1.Team_Name	as Team1,t2.Team_Name as Team2 from ipl t1 inner join ipl t2 
on t1.Team_id>t2.Team_id 

--Two matches with each team

select t1.Team_Name	as Team1,t2.Team_Name as Team2 from ipl t1 inner join ipl t2 
on t1.Team_id>t2.Team_id 

union all

select t1.Team_Name	as Team1,t2.Team_Name as Team2 from ipl t1 inner join ipl t2 
on t1.Team_id>t2.Team_id 


--Q.3 all type of join count

--table a		table b
--id			id
--1				0
--0				0
--0				2
--1				null
--null			1
--null
--2

--ans
create table table_a (id int)
insert into table_a values (1),(0),(0),(1),(null),(null),(2)

create table table_b (id int)
insert into table_b values (0),(0),(2),(null),(1)

select * from table_a;
select * from table_b;

select * from table_a a join table_b b on a.id=b.id   -- common records of both table
select * from table_a a left join table_b b on a.id=b.id--inner join records+ distinct records of left table
select * from table_a a right join table_b b on a.id=b.id--inner join records+ distinct records of right table
select * from table_a a full join table_b b on a.id=b.id--inner join records+ distinct records of left table+distinct records of right table
select * from table_a cross join table_b--records of left table x records of right table 

--q.4 all type of join count
--id     id
--1		 4
--2		 5
--3		 null
--null

create table cc(id int)
create table dd(id int)
insert into cc values(1)
insert into cc values(2)
insert into cc values(3)
insert into cc values(null)

insert into dd values(4)
insert into dd values(5)
insert into dd values(null)
select * from cc
select * from dd

select * from cc inner join dd on cc.id=dd.id
select * from cc left join dd on cc.id=dd.id
select * from cc right join dd on cc.id=dd.id
select * from cc full join dd on cc.id=dd.id
select * from cc cross join dd
select * from cc,dd


--q.5 all types of join count

--id     id
--1		 1
--1		 1
--1		 null
--null

 create table AA (id int)
 create table BB (id int)
 insert into AA values (1)
 insert into AA values (1)
 insert into AA values (1)
 insert into AA values (NULL)
 insert into BB values (1)
 insert into BB values (1)
 insert into BB values (NULL)

 select * from AA
 select * from BB

 select * from AA inner join BB on AA.id=BB.id
 select * from AA left join BB on AA.id=BB.id
 select * from AA right join BB on AA.id=BB.id
 select * from AA full join BB on AA.id=BB.id
 select * from AA cross join BB
 
--q.6 If we have one table that table have one column which name is 

--MARKS
-- 10
-- 20
-- 30
---10
---20
---30
-- We need the Sum of all positive integer in one seprate column and Sum of all negative integer  from one seprate column..

 create table EMP
(Marks INT)
INSERT INTO EMP VALUES (10)
INSERT INTO EMP VALUES (20)
INSERT INTO EMP VALUES (30)
INSERT INTO EMP VALUES (-10)
INSERT INTO EMP VALUES (-20)
INSERT INTO EMP VALUES (-30)

select * from emp

SELECT distinct (SELECT SUM(marks) FROM EMP WHERE MARKS > 0 ) as sum_of_positive_integer,
(SELECT SUM(marks) FROM EMP WHERE MARKS < 0) as sum_of_negative_integer
from emp

select sum(case when marks>0 then marks end) as positive,sum(case when marks<0 then marks end) as negative from emp

------------------------------------------------------------------------------------------------

--q.7
--add total marks column

--test data
create table marks (marathi int,english int, science int);

insert into marks values (90,95,93),(85,54,58),(50,60,70)

select * from marks

--ans

select *,Total_marks=marathi+english+science from marks 

alter table marks add Total_marks int

update marks set Total_marks =marathi+english+science
---------------------------------------------------------------------------
 --q-8 Write a query to convert below input to required output

 --input :
 --     |  NAME	   |  comm_type | comm_value    |
 --     |  vishrut |	phone	| 21234			|
 --     |  vishrut |	fax	    | 234			|
 --     |  vishrut |	email	| abc@gmail.com	|

 --ouput:
-- | name	 | phone |  fax | email 	   |
-- | vishrut | 21234 |  234 | abc@gmail.com|

--test data
 create table t1 (NAME varchar(10),comm_type varchar(10),comm_value varchar(20));

 insert into t1 values ('vishrut','phone',21234)
 insert into t1 values ('vishrut','fax',234)
 insert into t1 values ('vishrut','email','abc@gmail.com')

 select * from t1

 --ans
select name, phone,fax,email from t1
PIVOT
(
		max(comm_value)
		For comm_type
		IN (phone,fax,email)-

) AS pivot_Table; 
-----------------------------------------------------------------------------------------------

--q.9 how fetch 50% record

select * from dept2

--ans
select top 50 percent * from dept2
--------------------------------------------------------------------------------------------------------
--Q) select he country name which not start and end with (a,e,i,o,u) and does not containt duplicate country name)
--test data
create table country (name varchar (50))

insert into country values	('Albania')
insert into country values	('Algeria')
insert into country values	('Andorra')
insert into country values	('Angola')
							 
insert into country values	('Azerbaijan')
insert into country values	('Bahamas')
insert into country values	('Bahrain')
insert into country values	('Bangladesh')
							 
insert into country values	('Bhutan')
insert into country values	('China')
insert into country values	('Colombia')
							 
insert into country values	('Democratic Republic of the Congo')
insert into country values	('Denmark')
insert into country values	('Djibouti')
insert into country values	('Dominica')
insert into country values	('Dominican Republic')
insert into country values	('Ecuador')
					
--ans
--1]
Select name from country where name like '[^aeiou]%' and name like '%[^aeiou]' group by name having count(name)<2

--2]
Select distinct name from country where name like '[^aeiou]%[^aeiou]' 

----------------------------------------------------------------------------------------
--Q.10-3rd highest and 2nd lowest in a single query
use [Q&A]

select * from emp

--ans
--using nth highest
select FIRST_NAME, salary from emp e1 where 3-1=(select count(distinct salary) from emp e2 where e2.salary>e1.salary) or 2-1=(select count(distinct salary) from emp e2 where e2.salary<e1.salary)
 
 --using dense_rank
with cte as
(select first_name,salary , DENSE_RANK() over (order by salary desc) as highest,DENSE_RANK() over (order by salary) as lowest from emp where SALARY is not null)
select first_name,salary from cte where highest=3 or lowest=2

--q.11 find 3rd highest and 5th highest salary

--ans
--using nth highest
select FIRST_NAME, salary from emp e1 where (select count(distinct salary) from emp e2 where e2.salary>e1.salary) in (3-1,5-1) order by SALARY desc

 --using dense_rank
with cte as
(select first_name,salary , DENSE_RANK() over (order by salary desc) as highest from emp)
select first_name,salary from cte where highest in (3,5)

