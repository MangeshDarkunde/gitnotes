use demo1
go

--Join:

--left join records  =  inner join records + unique records of left table
--right join records =  inner join records + unique records of right table
--full join records  =  inner join records + unique records of left table + unique records of right table
--cross join records =  left table records * right table records

 --1) inner join  
 create table Q1 (Aid int, name varchar(10))
 create table Q2 (Bid int, name varchar(10),Aid int)
 insert into Q1 values (1,'A');
 insert into Q1 values (2,'B');
 insert into Q1 values (3,'C');
 insert into Q1 values (4,'D');
 insert into Q1 values (5,'E');
 insert into Q2 values (10,'C',3);
 insert into Q2 values (12,'D',4);
 insert into Q2 values (13,'E',5);
 insert into Q2 values (14,'R',6);
 insert into Q2 values (5,'T',7);

 select * from Q1
 select * from Q2

select * from Q2 join Q1 on Q1.name=Q2.name;
select * from Q2 inner join Q1 on Q1.Aid=Q2.Aid
select * from q1 inner join q2 on q1.Aid=q2.Bid 
select * from q1 inner join q2 on bid=10 --worked as a cross join

 create table Q9 (cid int, name varchar(10));
 insert into Q9 values (10,'A');
 insert into Q9 values (12,'B');
 insert into Q9 values (3,'C');
 insert into Q9 values (4,'D');
 insert into Q9 values (25,'E');

 select * from Q2 inner join Q1 on Q1.Aid=Q2.Aid join q9 on q2.aid=q9.cid
 select * from Q2 inner join Q1 on Q1.Aid=Q2.Aid join q9 on q1.aid=q9.cid

 select * from Q2 inner join Q1 on Q1.Aid=Q2.Aid join q9 on q1.aid=q2.aid--first join result will do cross join with table3


 --2) Left,right and full join

 select * from Q1 left join Q2 on Q1.Aid=Q2.Aid;
 select * from Q1 right join Q2 on Q1.Aid=Q2.Aid;
 select * from Q1 full join Q2 on Q1.Aid=Q2.Aid;

 create table Q3(cid int,name varchar(10),bid int);
 insert into Q3 values(21,'m',3)
 insert into Q3 values(22,'D',14)
 insert into Q3 values(23,'E',5)
 insert into Q3 values(24,'R',13)
 insert into Q3 values(25,'T',7)
 select * from Q3

 select * from Q1 inner join Q2 on Q1.aid=Q2.aid join Q3 on Q2.bid=Q3.bid; 
 ----------------------------------------------------------------------------

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

 ------------------------------------------------------------------------------------------------

create table com1(id int, name varchar(10),city varchar(10))
create table com2(emp_id int, name varchar(10),id int)
insert into com1 values (1,'abhi','pune')
insert into com1 values (2,'sudhir','kohapur')
insert into com1 values (3,'shubham','mumbai')
insert into com1 values (4,'sourabh','sangli')
insert into com1 values (5,'sunil','nagar')
insert into com1 values (6,'sai','shirdi')


insert into com2 values (10,'suraj',3)
insert into com2 values (11,'paras',4)
insert into com2 values (12,'purva',5)
insert into com2 values (13,'rakesh',6)
insert into com2 values (14,'rohan',7)

delete from com1 where id=6;


select * from com1
select * from com2

select * from com1 inner join com2 on com1.id= com2.id ;
select * from com1 left join com2 on com1.id= com2.id ;
select * from com1 right join com2 on com1.id= com2.id ;
select * from com1 full join com2 on com1.id= com2.id ;

--Que. Write the query for peoples using cell and only cell?
--Ans:
create table cell(C_id int,Name varchar(10));

insert into cell values (3,'Rahul');
insert into cell values (1,'John');
insert into cell values (5,'Swami');
insert into cell values (2,'Black');
insert into cell values (4,'Dark');

select * from cell;

create table landline (L_id int, Name varchar(10));

insert into landline values (1,'John');
insert into landline values (3,'Sundar');
insert into landline values (5,'Swami');
insert into landline values (9,'Mahadev');
insert into landline values (6,'Deva');
insert into landline values (4,'Dark');
insert into landline values (7,'Anant');

select * from landline;


--Below all 5 queries are same.
select * from cell as c inner join landline as l on c.C_id=l.L_id;
select * from cell c inner join landline l on c.C_id=l.L_id;
select * from cell c inner join landline l on C_id=L_id;
select * from cell inner join landline on C_id=L_id;
select * from cell join landline on C_id=L_id;


select * from cell;
select * from landline;

--Que: People use both cell and landline
select * from cell inner join landline on C_id=L_id 

--Que:People use cell?
select * from cell;

--Que: People using only cell?
select * from cell left join landline on C_id=L_id where L_id is null;

--Que: People using landline?
select * from landline;

--Que:People using only landline?
select * from cell right join landline on l_id=c_id where C_id is null;
select * from landline left join cell on l_id=c_id where C_id is null;


--Equi join : (function is same as of inner join)
--join keyword does not used 
--where clause is used

 --Q. What is the diff. between equi join and inner join
 --Ans: 1. In inner join we use 'join' keyword and in equi join we use ','.
   --   2. In inner join we use 'on' keyword and in equi join we use 'where' keyword.

create table EMP_new (id int, name varchar (10),Company varchar (10),Work varchar (10));
insert into EMP_new values (1,'Amit','Info','pune')
insert into EMP_new values (2,'Puja','Tcs','Mumbai')
insert into EMP_new values (3,'Poonam','Tech','Pune')
insert into EMP_new values (4,'Abhi','Logic','Nagpur')
insert into EMP_new values (5,'Kirti','Lim','Nagar')
select * from EMP_new;

create table Job (salary int,base varchar (10),id int);
insert into job values (10000,'Pune',1)
insert into job values (20000,'Mumbai',3)
insert into job values (30000,'Nagpur',4)
insert into job values (40000,'Pune',5)
insert into job values (35000,'Nagar',2)
insert into job values (150000,'Banglore',6);
select * from Job;

select * from EMP_new inner join job on EMP_new.id=job.id--/
select * from EMP_new,job where EMP_new.id=job.id

select * from EMP_new inner join job on EMP_new.id=job.id and work='pune'--/
select * from EMP_new,job where EMP_new.id=job.id and work='pune'

select * from EMP_new inner join job on EMP_new.id=job.id and work='pune' and base ='mumbai'--/\
select * from EMP_new,job where EMP_new.id=job.id and work='pune' and base='mumbai'

select * from EMP_new,job where work='pune' and base='mumbai'
 
select EMP_new.name from EMP_new inner join job on EMP_new.id=job.id and EMP_new.work=job.base and base in ('pune')--/
select EMP_new.name from EMP_new,job where EMP_new.id=job.id and EMP_new.work=job.base and base in ('pune')

select job.salary, job.base from EMP_new join job on EMP_new.id=job.id and EMP_new.work=job.base and base in ('pune')
select job.salary, job.base from EMP_new,job where EMP_new.id=job.id and EMP_new.work=job.base and base in ('pune')

--cross join
select * from EMP_new cross join Job;

create table d (id int)
create table e (id int)
insert into d values(1)
insert into d values(2)
insert into d values(3)
insert into d values(4)
insert into d values(5)

insert into e values(1)
insert into e values(2)
insert into e values(3)
insert into e values(4)
insert into e values(5)

select * from d
select * from e
select * from d cross join e;

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
select * from cc,dd where cc.id=dd.id
select * from cc cross join dd


--self join


create table SELF_TEST_EMP(EID int, ENAME varchar(20),ManagerID varchar(20))
insert into SELF_TEST_EMP values(1,'Shivam',2)
insert into SELF_TEST_EMP values(2,'krishna',4)
insert into SELF_TEST_EMP values(3,'meera',NULL)
insert into SELF_TEST_EMP values(4,'radha',2)
insert into SELF_TEST_EMP values(5,'bali',1)

select * from SELF_TEST_EMP

select * from SELF_TEST_EMP as T1, SELF_TEST_EMP as T2 where T1.eid=T2.managerid
select T1.eid,T1.managerid from SELF_TEST_EMP as T1, SELF_TEST_EMP as T2 where T1.eid=T2.managerid
select T1.eid,T2.ename from SELF_TEST_EMP as T1, SELF_TEST_EMP as T2 where T1.eid=T2.managerid
select T1.ENAME AS MANAGER,T2.ENAME AS EMPLOYEE FROM SELF_TEST_EMP as T1,SELF_TEST_EMP AS T2 WHERE T1.eid=T2.managerid;--True 
--T1.ENAME AS MANAGER =T2.MANAGER_ID 
select T1.ENAME AS MANAGER,T2.ENAME AS EMPLOYEE FROM SELF_TEST_EMP as T1,SELF_TEST_EMP AS T2 WHERE T2.managerid=T1.eid;--True
select T1.ENAME AS MANAGER,T2.ENAME AS EMPLOYEE FROM SELF_TEST_EMP as T1,SELF_TEST_EMP AS T2 WHERE T2.eid=T1.managerid;--False
select T1.ENAME AS EMPLOYEE,T2.ENAME AS MANAGER FROM SELF_TEST_EMP as T1,SELF_TEST_EMP AS T2 WHERE T1.eid=T2.managerid;--False
select T1.ENAME AS EMPLOYEE,T2.ENAME AS MANAGER FROM SELF_TEST_EMP as T1,SELF_TEST_EMP AS T2 WHERE T2.eid=T1.managerid;--True


create table self_11 (id int,roll_no int)
insert into self_11  values(1,4)
insert into self_11  values(2,5)
insert into self_11  values(3,null)
insert into self_11 (id) values(null)
select * from self_11
select * from self_11 as T1 ,self_11 as T2 where T1.id=T2.roll_no
-----------------------------------------------------------------------------------------------------------

--we can apply join between tables having no common column name but one column should have same datatype

create table g1 (id int,name varchar(10));
insert into g1 values (1,'vitthal'),(2,'savala'),(3,'Hari');

create table g2 (srno int,city varchar(10));
insert into g2 values (2,'universe'),(3,'pandarpur'),(4,'vaikunth');

select * from g1 join g2 on id=srno



