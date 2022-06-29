use demo1


--create
create table info (id int,name varchar(10),city varchar(10));
--fetch data
select * from info;
select id,city from info;


--insert values
--method 1
insert into info values (101,'amit','pune');
insert into info values (102,'mangesh','mumbai');
INSERT INTO INFO VALUES (103,'JOHN','DUBAI');
INSERT INTO INFO VALUES (111,'JOHNY','DUBAI',411039,6565);

--insert 2nd method
insert into info (id) values (109)

select * from info

--Types of clauses
--1] where by
--2] order by
--3] group by
--4] having

--1] where by clause

--operator

--a] comparator (=,!=,<>,<,<=,>,>=)
select * from info where city='dubai';
select * from info where id>102;


--b) logical  (and,or)
select * from info where city='dubai'and name= 'mangesh';
select * from info where city='dubai'or name= 'mangesh';

--c) in/not in--fetching multiple data
select * from info where id in (101,102);
select * from info where id not in (101,102);

--d)between--use for fetching data between range
select * from info where id between 102 and 103 ;

--e] like--use when exact data not known

select * from info where name like 'a%'
select * from info where name like '_a%'
select * from info where name like '%a'
select * from info where name like 'a%t'
select * from info where name like 'am%'
select * from info where name like '%i'
select * from info where name like '[mj]%'
select * from info where name like '[^mj]%'
select * from info where name like '[^a-m]%'
select * from info where name like '[a-m]%'
select * from info where name like '[a-j]%'
select * from info where name like '[^a-j]%'


--f] Arithmatic (+,-,*,/)--for adding new column

select * from info;
select id from info;
select *, new=id+10000 from info;
select *, new=id-10000 from info;
select *, new=id+10000 from info where name like 'm%';
select *, new=id+10000 from info where name like '[am]%';
select *, new=id+10000 from info where name like '[^am]%';
select *,new=(1.1*id) from info where name like 'a%'


