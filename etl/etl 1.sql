create table source_EMP (EMP_ID int,First_Name varchar(50),Last_Name varchar(50),Designation varchar(50))

insert into source_EMP values (101,'Aman','Patil','Software Test engg')
insert into source_EMP values (102,'Sara','Rathod','Trainee engg')
insert into source_EMP values (103,'Rohit','Joshi','Project Manager')
insert into source_EMP values (104,'Pooja','Smith','Software engg');

Create table Target_EMP (EMP_ID Int,First_Name varchar(50),Last_Name varchar(50),Designation varchar(50),Start_Date datetime,End_Date Datetime )

select * from source_EMP;
select * from Target_EMP;

--First_Name: Historical attribute
--Last_Name: Changing attribute
--Designation: Historical attribute

update source_EMP set designation ='Senior Software Test engg' where emp_id= 101;
update source_EMP set designation ='Junior Software Test engg' where emp_id= 101;
update source_EMP set First_Name ='Kiran' where emp_id= 102;
update source_EMP set Last_Name='Deshmukh' where EMP_ID=102;
update source_EMP set First_Name ='Sunny' where emp_id= 103;
update source_EMP set Last_Name='Bunny' where EMP_ID=104;
update source_EMP set First_Name='Amol' where EMP_ID=104;

--First_Name: Changing attribute
--Last_Name: Historical attribute
--Designation: fixed attribute

select * from source_EMP;
select * from Target_EMP;