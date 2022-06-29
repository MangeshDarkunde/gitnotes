--Group by

select * from info3;

--  srno   name	     age   salary
--  10	   mangesh	 21	   10000
--  11	   ram	     23	   NULL
--  12	   rahim	 27	   NULL
--  10	   mangesh	 21	   10000
--  11	   ram	     23	   NULL
--  12	   rahim	 27	   NULL

--min,max,avg,sum
--syntax select col_name, aggregate_function from table_name group by col_name
select * from info3
select name, min (age) from info3 group by name;
select name, avg(age) from info3 group by name;
select min(age),max(age),avg(age) from info3

alter table info3 alter column age int;


--Having 

--name wise total age;
select name, sum(age) from info3  group by name having sum(age)>45 order by sum(age);

--where-> group by-> having-> order by

 --Duplicate records from table
select name, count(*) from info3 group by name having count (*)>1;

--Q. find the no of students stydying same subject in same semester?

create table info5 (id int,subject varchar(10), semester int);

insert into info5 values (101,'math',1);
insert into info5 values (102,'marathi',2);
insert into info5 values (104,'english',5);
insert into info5 values (103,'science',4);
insert into info5 values (106,'hindi',1);
insert into info5 values (105,'history',3);
insert into info5 values (107,'history',3);
insert into info5 values (108,'english',3);
insert into info5 values (109,'hindi',1);

select * from info5;

select subject, semester, count (*) as count from info5 group by subject,semester;

select subject, semester, count (*) as count from info5 group by semester,subject;
--------------------------------------------------------------------------------------

--set operator
--prerequisit:  Both column/table should have same datatype and same table structure

--union: duplicates records are eliminated from same column also
--union all
--intersect
--minus/except

begin transaction
rollback

create table set1 (id int, name varchar(2));
create table set2 (id int, name varchar(2));
insert into set1 values (1,'A');
insert into set1 values (2,'B');
insert into set1 values (3,'C');
insert into set1 values (4,'D');

insert into set2 values (5,'E');
insert into set2 values (6,'F');
insert into set2 values (3,'C');
insert into set2 values (4,'D');
insert into set2 values (7,'A');
insert into set2 values (8,'B');
insert into set2 values (9,'H');
insert into set2 values (1,'A');
insert into set2 values (2,'A');
insert into set2 values (2,'A');


select * from set1;
select * from set2;

--A-[1,2,3,4]
--B-[3,4]

--A union B-[1,2,3,4,5,6,7]
--B union all B-[1,2,3,4,5,6,7]
--A intersect B-[3,4]
--A except B-[1,2]
--B except A-[5,6,7]

select * from set1 union select * from set2;

select * from set1 union all select * from set2;

select * from set1 intersect select * from set2;
select * from set2 intersect select * from set1;

select * from set1 except select * from set2;
select * from set2 except select * from set1;

select id from set1 except select id from set2;
select id from set2 except select id from set1;


begin transaction;

alter table info3 drop column salary

select * from info3 except select * from info5;
select * from info5 except select * from info3;
select * from info3 intersect select * from info5;
select * from info3 union select * from info5;
select * from info3 union all select * from info5;

--self set

select * from info3 as t1 union all select * from info3 as t2;--self set (we can apply set operator to same table using different alaises)
select * from info3 as t1 union select * from info3 as t2;

rollback

select srno from info3 except select id from info5;
select id from info5 except select srno from info3;
select id from info5 union select srno from info3;
select id from info5 union all select srno from info3;
select id from info5 intersect select srno from info3;
---------------------------------------------------------------------------------------------------------
--Date function
--21/01/22 lecture

Create table Account_details ( ACCT_NUMBER int primary key identity(11112881,1), ACCT_NAME varchar(20), ACCT_OPEN_DATE date, BRANCH Varchar(20));
insert into Account_details values ('Shubham','2015/12/09','MUMBAI');
insert into Account_details values ('Rihan','2016/01/12','Jaipur') 
insert into Account_details values ('Sheetal','2017/08/11','GOA') 
insert into Account_details values ('Priyanka','2017/01/01','Chennai')
insert into Account_details values ('Manik','2015/01/08','Agra')
insert into Account_details values ('Veena','2021/01/01','Patna') 
insert into Account_details values ('Rohan','2019/07/01','Pune') 
insert into Account_details values ('Laxmi',GETDATE(),'rohatak')
insert into Account_details values ('Jinal',GETDATE(),'Indore') 
insert into Account_details values ('shambu','2022/10/22','Indore') 


select * from Account_details

select getdate()
select getdate() +1;
select getdate() -1;

--intervals
--year- YY
--Month -M
--Quaeter-Q
--Day-y/D
--Hour-HH
--Min-N
--Sec-S
--Milisec-MS
--Week-WW

--date functions
--1. Datediff--(difference between two dates)
--Syntax -Datediff(interval, date1, date2)

select datediff(MM,'1996/07/16','2022/01/21');
select datediff(yy,'1996/07/16',getdate());
select ACCT_NUMBER, datediff(YY,ACCT_OPEN_DATE,getdate()) as account_age from Account_details

--2. Datepart
select * from Account_details where ACCT_OPEN_DATE= ('2015');
--as date format is yyyy/mm/dd so it is unable to search directly by yyyy only
--Here we can use datepart function. How? Stay tunned :)

--syntax- select datepart (interval, date/col_name)

select * from Account_details where datepart(YY,Acct_open_date)='2015';

select *, datepart(YY,Acct_open_date) as Open_date from Account_details where datepart(YY,Acct_open_date)='2015';

--3.Dateadd
--Syntax Dateadd(interval, value, date/col_name)

select dateadd(M,30,GETDATE());--result is date greater than 30 month from today's date

select *, dateadd(D,30,ACCT_OPEN_DATE) AS NEW from Account_details;

select *, dateadd(YY,30,ACCT_OPEN_DATE) from Account_details;

select *, dateadd(YY,-30,ACCT_OPEN_DATE) from Account_details;

select *, dateadd(YY,-30,ACCT_OPEN_DATE) from Account_details where ACCT_OPEN_DATE between '2017' and '2022'
--due to getdate function, 2022 records not included in result

select *, dateadd(YY,-30,ACCT_OPEN_DATE) from Account_details where datepart(yy,ACCT_OPEN_DATE) between '2017' and '2022'


select * from Account_details




























