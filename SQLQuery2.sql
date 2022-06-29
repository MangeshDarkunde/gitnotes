create table info1 (pr_no int, name varchar(10), post varchar (10), store varchar (10));

insert into info1 values (902851,'Mangesh','Supervisor','DD2')
insert into info1 values (902852,'nitin','Supervisor','h4')
insert into info1 values (902853,'ganesh','associate','biw')
insert into info1 values (902853,null,'associate','biw')

select * from info1;
select name from info1;

--2] order by clause

select * from info1;
select * from info1 order by pr_no;      ---by default sort by ascending order
select * from info1 order by pr_no asc; ----sort by ascending order
select * from info1 order by pr_no desc; ---sort by descending order
select * from info1 order by name asc; -----name sort by ascending order a to z
select * from info1 order by name desc; ---name sort by descending order z to a

--fetch null value

select * from info1 where name=null; --null value cannot be find by = sign

select * from info1 where name is null; --use 'is' instead of '='
select * from info1 where name is not null;

--update
--1 col update
--2. row wise data update

select* from info1;

begin transaction;
rollback

--syntax update table_name set col_name='values'
 update info1 set store='h4' where name='ganesh';
 update info1 set store='xenon' where  name='ganesh';

 --syntax delete table_name where col_name='values'

 delete info1 where pr_no='902852' and store='h4';
 delete info1 where pr_no=902853;

 


































