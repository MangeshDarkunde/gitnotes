use etl
go

create table SCD_Test (EID int, Ename varchar(10),DOJ varchar(10),Loc varchar(10));
insert into SCD_Test values(1,'Rahul',2018,'Pune');
insert into SCD_Test values(2,'Niket',2015,'Lonavala');
insert into SCD_Test values(3,'Om',2019,'Indore');
insert into SCD_Test values(4,'Krishna',2017,'Banglore');

create table SCD_Test1 (EID int, Ename varchar(10),DOJ varchar(10),Loc varchar(10),start_date datetime, end_date datetime);


select * from SCD_Test
select * from SCD_Test1

update SCD_Test set DOJ=2021 where eid=3
update SCD_Test set Loc='Noida' where eid=4
update SCD_Test1 set Loc='Junnar' where eid=3
update SCD_Test set Ename='Rahul' where eid=1

create table SCD_Test2 (EID int, Ename varchar(10),DOJ varchar(10),Loc varchar(10),ETL_flag varchar(10));

select * from SCD_Test
select * from SCD_Test2

drop table SCD_Test2

update SCD_Test2 set DOJ=2019 where loc='Noida'
update SCD_Test set Loc='Mumbai' where eid=4
delete SCD_Test where loc='Mumbai'


--Surrogate key
--If EID column have primary key then new record will not inserted in scd2 transformation
--e.g loc column have historical attribute and if we change loc of one record and perform etl it will not maintain historical record
--hence surrogate key (a new column is created with primary key and auto increment constraints) to assign unique and not null value to each record.
--surrogate key does not interfere in etl transformation because this column is not mapped with source column.

create table SCD_Test3 (EID int, Ename varchar(10),DOJ varchar(10),Loc varchar(10),start_date datetime, end_date datetime, SURROGATE_KEY int primary key identity (1,1));


select * from SCD_Test
select * from SCD_Test3

drop table SCD_Test3

update SCD_Test set DOJ=2020 where loc='Banglore'
update SCD_Test set Loc='kashi' where eid=2
update SCD_Test set EID=5 where EID=3
update SCD_Test3 set EID=5 where EID=3







