use demo1
go

--subquery

create table info6 (name varchar(10), marks int);

insert into info6 values ('Mangesh', 90)
insert into info6 values ('amol', 30)
insert into info6 values ('ram', 85)
insert into info6 values ('rahim', 68)
insert into info6 values ('hari', 55)

select * from info6;

--syntax -outer query condition (inner query)
--Note-both query not dependent on each other

(select max (marks) from info6);--maximum marks

select max(marks) from info6 where marks < (select max(marks) from info6);--2nd highest marks

select max(marks) from info6 where marks < (select max(marks) from info6 where marks < (select max (marks) from info6))--3rd highest marks

select min(marks) from info6 where marks > (select min(marks) from info6 where marks > (select min (marks) from info6))--3rd minimum marks

--Display marks except 30,55 using subquery

select * from info6 where marks in (select marks from info6 where marks not in (30,55))

--without subquery
select * from info6 where marks not in(30,55);


--Corelational
--syntax : select * from table1 where exists (select * from table2 where table1.col_name=table2.col_name)
--Note--both query dependent on each other

create table customer(C_ID varchar(5) primary key ,CNAME varchar(20),Loc varchar(20)) 


insert into customer values('C1','AMIT','PUNE') 
insert into customer values('C2','Sumit','Delhi') 
insert into customer values('C3','varun','Mumbai')
insert into customer values('C4','snehal','Latur')
insert into customer values('C5','Raj','Sangli') 
insert into customer values('C6','Mohit','Satara') 

select * from customer 

create table orders (OID int primary key, CID varchar(5),groceries varchar(20)) 

insert into orders values(1,'C2','almonds') 
insert into orders values(2,'C3','deo')
insert into orders values(3,'C1','milk')
insert into orders values(4,'C2','soap') 
insert into orders values(5,'C4','dishes')
insert into orders values(6,'C2','rice')
insert into orders values(5,'C4','dishes')
insert into orders values(7,'C9','rice')

select * from orders

--in corelational query if inner query is independant then it will show only result of outer query.
select * from customer where exists (select * from orders,customer where customer.C_ID=orders.cid);
select * from customer

--using co-relational
select * from customer where exists (select CID from orders where customer.C_ID=orders.cid);
select * from customer where exists (select * from orders where customer.C_ID=orders.cid);

--using subquery
select * from customer where c_id in (select CID from orders,customer where customer.C_ID=orders.cid)

select * from customer

select * from orders

select * from orders where exists (select * from customer where customer.C_ID=orders.cid);

select * from customer inner join orders  on customer.C_ID=orders.cid

begin transaction
rollback;

select * from customer where not exists (select * from orders where customer.C_ID=orders.cid);

select * from customer as c where not exists (select * from orders as o where c.C_ID=o.cid);

--------------------------------------------------------------------------------------------------------

--rename
--syntax--SP_rename table_name

select * from info6;

exec sp_rename 'info6.marks','salary';--marks column name changed to salary

sp_rename 'info6.salary','marks';

execute sp_rename 'info6','study';--table name changed from info6 to study

select* from study;

sp_rename 'study','info6';

