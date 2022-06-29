--create
create table college (id int, Name varchar(10), Subject varchar(10),Marks int );

insert into college values (101,'Ram','Hindi',85);
insert into college values (102,'Rohit','English',73);
insert into college values (103,'Pavan','Marathi',33);
insert into college values (104,'Rohan','hindi',35);
insert into college values (105,'Puja','Science',73);
insert into college values (106,'john','Hindi',35);
insert into college values (107,'Sumedha','Science',70);
insert into college values (108,'Digamber','Marathi',65);
insert into college values (109,'Sunil','English',93);

select * from college;

--where by clause
--a]comparator (=,<>,!=,>,<);

select * from college where Marks>=35;
select name,Marks from college where marks>35;
select * from college where Subject!='hindi';
select * from college where Subject<>'hindi';

--b] logical operator (and, or,not)

select * from college where subject='hindi' and marks>70;
select * from college where not subject='hindi' and not marks>70;
select * from college where subject='hindi' or Marks>70;
select * from college where not subject='hindi' or Marks>70;

--c] in, not in
select * from college where marks not in (73,85);
select * from college where marks in(73,85);

--d] between
select * from college where marks between 35 and 85;
select * from college where subject between 'e' and 's';--for initial letter, data is fetching from subject name starts from 'e' upto one letter before 's'
select * from college where subject between 'e' and 'science';--for whole subject name, data is fetching from subject name starts from 'e' upto subject mentioned 'science'

--e] like --specific pattern in string
select * from college where name like 'r%';
select * from college where name like '%n';
select * from college where name like '_u%';
select * from college where name like '[^ap]%';
select * from college where name like '[ap]%'
select * from college where name like '[a-p]%';
select * from college where name like '[^a-p]%';
select * from college where subject like 'h%i' order by marks;
select * from college where subject like '[aeiou]%' order by marks;
select * from college where subject like '[^aeiou]%' order by marks;
select * from college where name like '%a_'
select * from college where name like '%[_]%'

----------------------------------------------------------------------
--insert one table record into another table

create table copied(a int, b varchar(20),c varchar(10),d int)
insert into copied values (2,'dsc','xdvzd',50)
insert into copied values (3,'dgv','kjhhgj',50)
insert into copied values (4,'fxdvd','mangesh',50)



select * from college union select * from copied

select * from copied union select * from college

insert into  college select * from copied

update college set name ='Ram_Krishna_Hari' where id =104

alter table college alter column name varchar(50)

------------------------------------------------------------------------------------

--f] arithmatic --temp column creation

select *,marks*1.1 updated_marks  from college where Marks<35
select *,new=marks+10 from college;
select *,new=marks*1.1 from college;
select *, new=marks+5 from  college where Subject ='marathi';

-----------------------------------
--order by (sort by)

select * from college order by marks;--by default sort by ascending order
select * from college order by marks asc;
select * from college order by marks desc;
select * from college order by name;
select * from college order by name desc;

--null values fetching

insert into college (marks) values (null);

select * from college where marks is null;
select * from college where marks is not null;


select count(*) from college
select count(marks) from college
--Q. How to find null count?
select count(*)-COUNT(marks) from college;


 --update
 update college set Marks= null where id=105;
 update college set marks=70; --whole marks column updated with 70 marks

 --delete---delete date row wise
 delete college where id is null;
 delete college;

 --truncate--delete whole table data at single time
 truncate table college;

 --drop --delete table data with table structure
 drop table college;

 select * from information_schema.tables;--no.of tables finding

 -----------------
 select * from college;

 --alter
 ---add column
 alter table college add city varchar(10);

 --delete column
 alter table college drop column city;

 --datatype

 alter table college alter column subject int; --error due to column contains word data

 --datalength
 alter table college alter column subject varchar(20);
  
------------------
--SQL Functions (aggregate function)
--min, max, count, top, sum, avg, distinct;

select min(marks) from college;
select MAX(marks) from college;
select COUNT(marks) from college;
select top 3 * from college;
select top 3 marks from college;
select top 3 marks from college order by marks desc;
select SUM(marks) from college;
select avg(marks) from college;
select distinct(marks) from college;
select COUNT(distinct marks) from college;

-----------------------------------------
--constraints
--1. Primary key ( unique and not null)
--2. Unique key
--3. Not null key
--4. check
--5. Auto increment (identity)
--6. Default
--7. Foreign key


--1. Primary key

create table z1 (id int primary key, name varchar(2));
insert into z1 values (101,'A');
insert into z1 values (102,'A');
insert into z1 values (101,'B');--negative testing
INSERT	into z1 values (null,'b');--negative testing


--2. unique

create table z2 (id int unique, name varchar (2) unique);
insert into z2 values (101,'a');
insert into z2 values (101,'b');--negative
insert into z2 values (102,'a');--negative
insert into z2 values (null,null);
insert into z2 values (null, 'd');--negative
select * from z2;

--3. Not null
create table z3 (id int, name varchar (2) not null);
insert into z3 values (101,'a');
insert into z3 values (101,'b');
insert into z3 values (102,'a');
insert into z3 values (null,null);--negative
insert into z3 values (null, 'd');
select * from z3;

--4. check

create table z4 (marks int check (marks>60), name varchar(2));
insert into z4 values (60,'A');--negative
insert into z4 values (61,'A');
insert into z4 values (59,'B');--negative
INSERT	into z4 values (null,null);
select * from z4;

--5. default

create table z5 (id int, city varchar (5) default 'Pune');
insert into z5 values (100, default);

insert into z5 (id)  values (10);
select * from z5;

--6. auto increment (identity)
create table z6 (id int identity (101,1) check (id <107), name varchar(1));
insert into z6 values ('a');
insert into z6 values (103,'a');--negative
select * from z6;

--7. foreign key

--note- 1st table column should have promary key which called in 2nd column as a foreign key
create table depart (DID int primary key, dept varchar(10));
insert into depart values (1,'civil');
insert into depart values (2, 'Mech');
insert into depart values (3, 'IT');
insert into depart values (4, 'entc');
select * from depart

create table stu (SID int, name varchar (10), DID int foreign key references depart (DID));
insert into stu values (10,'Amit',2);
insert into stu values (20,'Mangesh',1);
insert into stu values (30,'aman',4);
insert into stu values (10,'ram',5);
insert into stu values (40,'rahim',3);
insert into stu values (20,'rahim',4);
insert into stu values (20,'rahim',null);
select * from stu;
-------------------------
--Group by and having

select subject, max(marks) from college group by subject having max(marks)>50;
select subject, min(marks) from college group by subject having min(marks)>50;
select subject, count(*) from college group by subject having count(*)>1;
select subject,marks, count(*) from college group by subject, marks having count(*)>1;

--group by, having, order by

select subject, max(marks) from college group by subject having max(marks)>35 order by max(marks) desc;

------------------------
--date function

Create table Account_detail( ACCT_NUMBER int primary key identity(11112881,1), ACCT_NAME varchar(20), ACCT_OPEN_DATE date, BRANCH Varchar(20));
insert into Account_detail values ('Shubham','2015/12/09','MUMBAI');
insert into Account_detail values ('Rihan','2016/01/12','Jaipur') 
insert into Account_detail values ('Sheetal','2017/08/11','GOA') 
insert into Account_detail values ('Priyanka','2017/01/01','Chennai')
insert into Account_detail values ('Manik','2015/01/08','Agra')
insert into Account_detail values ('Veena','2021/01/01','Patna') 
insert into Account_detail values ('Rohan','2019/07/01','Pune') 
insert into Account_detail values ('Laxmi',GETDATE(),'rohatak')
insert into Account_detail values ('Jinal',GETDATE(),'Indore') 

select * from Account_detail;

--1. datediff
select datediff (YY,GETDATE(),'1996/07/16');
select datediff (YY,'1996/07/16',GETDATE());
select acct_number, DATEDIFF (yy,acct_open_date,GETDATE()) from Account_detail;

--2.datepart (where by)

select * from Account_detail where ACCT_OPEN_DATE in ('2022');
select *, datepart(YY,Acct_open_date) as Open_date from Account_detail where datepart(YY,Acct_open_date)='2022';
--From above statement no record found from 2022 as getdate() function is used for date in mention table)

--3. dateadd

select *, DATEADD(yy,100,acct_open_date) from Account_detail;
select *, DATEADD(mm,1,acct_open_date) from Account_detail;
select *, DATEADD(dd,1,acct_open_date) from Account_detail where ACCT_OPEN_DATE in('2015','2017');
select *, DATEADD(dd,1,acct_open_date) from Account_detail where ACCT_OPEN_DATE between '2015'and '2017';


create table mo (name varchar(10) , mo_no char(10));
insert into mo values ('Mangesh', '123456789');
insert into mo values ('Mangesh', 12345);
insert into mo values ('Mangesh', '1234567890');

select * from mo;

--subquery
--syntax outer query where marks < inner query
--both outer and inner query are independent on each other

select max(marks) from college;

select MAX(marks) from college where marks < (select MAX(marks) from college);

select MAX(marks) from college where marks < (select MAX(marks) from college where marks <(select max(marks) from college))

select min(marks) from college where marks > (select min(marks)from college where marks > (select min(marks) from college where marks > (select min(marks) from college)));

select * from college where marks in (select marks from college where marks not in (73,33));

--Que-display the name,subject and highest marks in each subject using subquery
select * from college  where marks=73 and subject='science' and marks in (select max(marks) from college group by subject)
order by marks desc; 

select * from college  where subject='science' and marks not in (select min(marks) from college group by subject)
order by marks desc;

update college set marks=73 where id=102;


