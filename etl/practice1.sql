use etl
go

create table input (id int,name varchar(20),Role varchar(10), salary int);

insert into input values (101, 'Sahil','Supervisor', 15000)
insert into input values (102, 'Saina','associate', 10000)
insert into input values (103, 'Sachin','Jr manager', 15000)
insert into input values (104, 'Virat','DGM', 15000)
insert into input values (105, 'rohit','Sr manager', 15000)

create table output (id int,name varchar(20),Role varchar(10), salary int,start_date datetime,end_date datetime );

select * from input;
select * from output;

update input set name='Mitali' where id=103
update input set salary=25000 where id =104
update input set role='executive' where name='virat'

sp_rename 'output.end_date', 'updation_date'