use demo1
go

create table duplicate(ID int identity, name varchar(10), Profession varchar(20),salary int);

insert into duplicate values ('Mohan','trainee',15000);
insert into duplicate values ('Vrushali','Team lead',50000);
insert into duplicate values ('Hritik','Actor',10000);
insert into duplicate values ('Harsh','Plumber',90000);
insert into duplicate values ('Harsh','Engg',90000);
insert into duplicate values ('Rahul','Engg',90000);
insert into duplicate values ('Harsh','Engg',30000);

select * from duplicate

-- How to find duplicate records?
select NAME,Profession,salary , count(*) from duplicate group by NAME,Profession,salary having count(*)>1;

--How to delete duplicate records?

--Method1: only can be used only if one of the column has identiy key
Delete from duplicate where id not in (select min(ID) from duplicate group by name,Profession,salary);

--Method2: only can be used only if one of the column has identiy key
Delete from duplicate where id not in (select max(ID) from duplicate group by name,Profession,salary);

--Method3: row_number
with DUPLICATE_RECORDS AS
(select *,ROW_NUMBER() OVER (Partition by NAME,Profession,salary order by ID)as row_no
from duplicate)
Delete from DUPLICATE_RECORDS where row_no>1

--Q-Why dense_rank and rank is not used to delete duplicate
--A: Because row number function is based on partition by and not dependant on order by 
--   But dense_rank and rank function is based on both partition by and order by.
--   If order by col name is not included in partition by then row_number,dense_rank and rank function will provide same values.
--   If order by col name is included in partition by then dense_rank and rank function will not be same of row_number value.
--   refer following examples


(select *,ROW_NUMBER() OVER (Partition by NAME,Profession,salary order by NAME,Profession,salary)as row_no,
          dense_rank() OVER (Partition by NAME,Profession,salary order by NAME,Profession,salary)as dense,
		  rank() OVER (Partition by NAME,Profession,salary order by NAME,Profession,salary)as rank
from duplicate)

(select *,ROW_NUMBER() OVER (Partition by NAME,Profession,salary order by id)as row_no,
          dense_rank() OVER (Partition by NAME,Profession,salary order by id)as dense,
		  rank() OVER (Partition by NAME,Profession,salary order by id)as rank
from duplicate)

select * from duplicate

--How to create store procedure for duplicate records?
alter proc spRemoveDuplicate
as
begin

	with DUPLICATE_RECORDS AS
	(select ID,NAME,Profession,salary,ROW_NUMBER() OVER (Partition by ID,NAME,Profession,salary order by ID,NAME,Profession,salary)as row_no
	from duplicate)
	Delete from DUPLICATE_RECORDS where row_no>1

end

spremoveduplicate