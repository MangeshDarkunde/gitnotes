 use [Q&A]

 --question and answer
--Q1). How to display employees whose salary between 15000 and 25000 without using between operators?
create table employees (id int primary key identity(1,1), name varchar(20),city varchar(20) default 'pune',salary int);
INSERT into employees values ('abhinandan',default,10000);
INSERT into employees values ('sudhir',default,15000);
INSERT into employees values ('sourabh',default,20000);
INSERT into employees values ('shubham',default,25000);
INSERT into employees values ('rakesh',default,30000);
INSERT into employees values ('rohan',default,35000);
INSERT into employees values ('suraj',default,40000);
SELECT * from employees

--ans
SELECT * from employees where salary >= 15000 and salary <=25000;

-----------------
--Q2) Display employees whose COMMISION_PCT is other than 0.10.

CREATE table employees_1 (id int primary key identity(1,1), name varchar(20),city varchar(20) default 'pune',salary int,commision_pct float,department varchar(20));
INSERT into employees_1 values ('abhinandan',default,10000,0.5,'production');
INSERT into employees_1 values ('sudhir',default,15000,0.10,'purchase');
INSERT into employees_1 values ('sourabh',default,20000,0.15,'maintances');
INSERT into employees_1 values ('shubham',default,25000,0.20,'design');
INSERT into employees_1 values ('rakesh',default,30000,0.25,'purchase');
INSERT into employees_1 values ('rohan',default,35000,0.30,'scm');
INSERT into employees_1 values ('suraj',default,40000,0.35,'quality');
INSERT into employees_1 values ('raj',default,40000,0.35,'purchase');

SELECT *  from employees_1;

--answer
SELECT * from employees_1 where commision_pct!=0.10;
SELECT * from employees_1 where commision_pct<>0.10;
select * from employees_1 where commision_pct not in (0.10);

------------
--Q3)Delete employees from department Purchasing and salary less than 25000.

DELETE employees_1 where department= 'purchase' and salary <25000 
SELECT * from employees_1 

---------
--Q4) Display the list of employees having first name ‘David’ or ‘Diana’ without using 'LIKE'.
CREATE table employees_2 (id int,name varchar(10))
INSERT into employees_2 values (101,'abhijeet');
INSERT into employees_2 values (101,'david');
INSERT into employees_2 values (101,'raju');
INSERT into employees_2 values (101,'diana');
INSERT into employees_2 values (101,'somnath');
SELECT * from employees_2;

--answer
SELECT * from employees_2 where name='david' or name= 'diana' 
select * from employees_2 where name in('david','diana')

--Q5)Get all employee details whose "FirstName" contains 'd'
SELECT * from employees_2 where name like '%d%'

--------
--Q6)Get all employee details whose "FirstName" starts with any single character between 'a-p'
SELECT * from employees_2 where name  between 'a' and 'p'
select * from employees_2 where name like'[a-p]%'

-----
--Q7)Get employee details whose joining date between "2013-01-01" and "2016-09-08"

Create table Account_details ( ACCT_NUMBER int primary key identity(11112881,1),
ACCT_NAME varchar(20), ACCT_OPEN_DATE date, BRANCH Varchar(20))
INSERT into Account_details values ('Shubham','2015/12/09','MUMBAI')
INSERT into Account_details values ('Sourabh','2013/04/09','MUMBAI')
INSERT into Account_details values ('Tukaram','2014/12/09','MUMBAI')
INSERT into Account_details values ('Jagadish','2015/12/09','MUMBAI')
INSERT into Account_details values ('Summant','2013/01/01','MUMBAI')
INSERT into Account_details values ('Aniket','2016/09/08','MUMBAI')
INSERT into Account_details values ('Rihan','2016/01/12','Jaipur')
INSERT into Account_details values ('Sheetal','2017/08/11','GOA') 
INSERT into Account_details values ('Priyanka','2017/01/01','Chennai') 
INSERT into Account_details values ('Manik','2015/01/08','Agra') 
INSERT into Account_details values ('Veena','2021/01/01','Patna') 
INSERT into Account_details values ('Rohan','2019/07/01','Pune')
INSERT into Account_details values ('Laxmi',GETDATE(),'rohatak')
INSERT into Account_details values ('Man','2016/10/30','Pune')
delete Account_details where ACCT_NAME='man'

SELECT * from Account_details
--ans 1:
SELECT * from Account_details where acct_open_date between '2013-01-01' and '2016-09-08'
--ans 2
--Get employee details whose joining date between "2013-01-01" and "2016-09-08" by using datepart function

select *, datepart(yy,acct_open_date)as new_date from Account_details where datepart(yy,ACCT_OPEN_DATE) between 2013 and 2015 and 
(datepart(mm,ACCT_OPEN_DATE) between 1 and 12) and (datepart(D,ACCT_OPEN_DATE) between 1 and 31) or 
datepart(yy,ACCT_OPEN_DATE) in (2016) and (datepart(mm,ACCT_OPEN_DATE) between 1 and 9) and (datepart(D,ACCT_OPEN_DATE) between 1 and 31)
------
--Q8) Get dept wise avg salary and order by salary asc
SELECT * from employees_1;
SELECT department,avg(salary) from employees_1 group by department order by  avg(salary) asc

-----
--Q9)Find out 2nd max salary using subquery,top and dense_rank
--subquery
select max(salary) from employees_1 where salary < (select max(salary) from employees_1)
--Top
select min (salary) from (select top 2 salary  from employees_1 group by salary order by salary desc) as sal;

select top 1 salary from (select distinct top 2 salary from employees_1 order by salary desc) result order by salary asc;

--dense_rank
with new as
(select *,DENSE_RANK() over (order by salary desc) DenseRank from employees_1)
select salary from new where DenseRank=2

-------
--Q10) Write down query to fetch project name and assign to more than one employee

CREATE table project (id int identity (1,1),name varchar (20),project_name varchar(20))
INSERT into project values('abhijeet','axis bank')
INSERT into project values('vindo','make my trip')
INSERT into project values('rakesh','croptom')
INSERT into project values('abhijeet','hdfc bank')
INSERT into project values('rakesh','phone pay')
INSERT into project values('pintu','axis bank')
INSERT into project values('vijay','paytm')
INSERT into project values('raj','lenscart')
SELECT * from project

--ans
select project_name from project group by project_name having COUNT(project_name)>1

--project_name with name(employee)
select name,project_name from project where project_name=(select project_name from project group by project_name having COUNT(project_name)>1)

----------
--Q11)Find out 3rd min salary using subquery and top

--ans using subquery
SELECT min(salary) from employees_1 where salary >(select min(salary) from employees_1 where salary > (select min(salary) from employees_1))

--ans using top

select max(salary) from (select distinct top 3 salary from employees_1 order by salary asc) as salary

--------------------------------------------------------------------------------------------------------------

 create table EMP
 (EMPLOYEE_ID int primary key,
  FIRST_NAME varchar(30),
  LOCATION_ID int,
  EMAIL varchar(30), 
  PHONE_NUMBER varchar(30),
  HIRE_DATE date, 
  JOB_ID varchar(20), 
  SALARY float,
  COMMISSION int,
  MANAGER_ID int,
  DEPARTMENT_ID int)

 insert into emp values(101,'Neena',null,'NKOCHHAR@GMAIL.COM','515.123.4568','2005-09-21','FINANCE',17000.00,5,102,90)
 insert into emp values(102,'Lex',1500,'LDEHAAN@YAHOO.COM','515.123.4569','2001-01-13','FINANCE',17000.00,2,null,90)
 insert into emp values(103,'Alexander',1600,'AHUNOLD@OUTLOOK.COM','590.423.4567','2006-01-03','PROGRAMER',9000.00,3,102,60)
 insert into emp values(104,'Bruce',1700,null,'590.423.4568','2007-05-21','FINANCE',6000.00,null,103,60)
 insert into emp values(105, 'David',1800, 'DAUSTIN@SUN.COM', '590.423.4569', '2005-06-25', 'PROGRAMER', 4800.00,1,103,60 )
 insert into emp values(106,'Valli',1900,'VPATABAL@TATA.COM','590.423.4560',null, 'PROGRAMER',4800.00,4,103,60 )
 insert into emp values(107,'Diana',2300,'DLORENTZ@OUTLOOK.COM',null,'2007-02-07','PROGRAMER',4200.00,6,103,80)
 insert into emp values(108,'Nancy',2400,'NGREENBE@YAHOO.COM','515.124.4569','2002-08-17','MANAGER',12008.00,null,null,100 )
 insert into emp values(109,'Daniel',2500,null,'515.124.4169','2002-08-16','ACCOUNT',9000.00,1,108,100)
 insert into emp values(110,'John',2700,'JCHEN@SUN.COM','515.124.4269','2005-09-28','ACCOUNT',null,2,108,100)
 insert into emp values(111,'Ismael',1400,'ISCIARRA@TATA.COM','515.124.4369','2005-09-30','ACCOUNT',7700.00,9,108,null)
 insert into emp values(112,'Jose Manuel',1400,'JMURMAN@OUTLOOK.COM','515.124.4469','2006-03-07','ACCOUNT',7800.00,8,108,70)
 insert into emp values(113,'Luis',1500,'De Haan@YAHOO.COM','515.124.4567','2007-12-07','FINANCE',6900.00,8,110,70)
 insert into emp values(114,null,1500,'Hunold@SUN.COM','515.127.4561','2002-12-07','MANAGER',11000.00,7,110,30)
 insert into emp values(115,'Alexander',1400,'Hunold@GMAIL.COM',null,'2003-05-18','ANALYST',3100.00,7,114,30)
 insert into emp values(116,'Shelli',null,'SBAIDA@YAHOO.COM','515.127.4563','2005-12-24','TESTER',2900.00,null,114,30)
 insert into emp values(117,'Sigal',1700,'STOBIAS@TATA.COM','515.127.4564','2005-07-24','MANAGER',2800.00,4,114,20)
 insert into emp values(118,'Guy',1600,'GHIMURO','515.127.4565','2006-11-15','TESTER',2600.00,2,114,20)
 insert into emp values(119,'Karen',1700,'KCOLMENA@GMAIL.COM','515.127.4566','2007-08-10','ANALYST',2500.00,1,114,20)
 insert into emp values(120,'Matthew',1800,'MWEISS@SUN.COM','650.123.1234','2004-07-18','MANAGER',8000.00,10,115,50)
 insert into emp values(121,'Adam',1900,'AFRIPP@OUTLOOK.COM','650.123.2234','2005-04-10','ANALYST',8200.00,10,115,50)
 insert into emp values(122,'Payam',1800,'PKAUFLIN@TATA.COM','650.123.3234','2003-05-01','ANALYST',7900.00,10,120,50)
 insert into emp values(123,null,1900,'SVOLLMAN@GMAIL.COM','650.123.4234','2005-10-10','ANALYST',6500.00,1,121,10)      
 insert into emp values(124,'Kevin',2300,'KMOURGOS@TATA.COM','650.123.5234','2007-11-16','FINANCE',5800.00,2,null,10)
 insert into emp values(125,'Julia',2400,null,'650.124.1214','2005-07-16','CLERK',3200.00,3,120,40)
 insert into emp values(126,'Irene',2500,'IMIKKILI@YAHOO.COM','0.124.1224','2006-09-28','CLERK',2700.00,4,120,40)
 insert into emp values(127,'James',null,'JLANDRY@OUTLOOK.COM','650.124.1334', '2007-01-14','CLERK',2400.00,6,120,40)
 insert into emp values(128,'Steven',2700,'SMARKLE@SUN.COM',null,'2008-03-08','CLERK',2200.00,null,120,50)
 insert into emp values(129,'Laura',2500,'LBISSOT@GMAIL.COM','650.124.5234','2005-08-20','MANAGER',3300.00,8,121,50)
 insert into emp values(130,'Mozhe',2400,'MATKINSO@OUTLOOK.COM','650.124.6234','2005-10-30','CLERK',2800.00,6,121,50)
 insert into emp values(131,'Mohan',2400,'Mohan@LOOK.COM','650.125.6234','2010-10-30','salesmen',3500.00,'',130,70)
 insert into emp values(132,'Ram',2400,'Ram@LOOK.COM','650.126.6234','2010-10-30','salesmen',4550.00,6,null,70)
 insert into emp values(133,'Lalu',2400,'lalu@LOOK.COM','650.127.6234','2010-10-30',null,2250.00,null,130,40)
 insert into emp values(134,'Jain',2600,'jain@mail.COM','650.128.6234','2009-01-30','salesmen',6550.00,null,129,40)
 insert into emp values(135,'Wayne',2700,'wayne@mail.COM','650.129.6234','2009-01-30','salesmen',1550.00,null,129,70)
 insert into emp values(136,'B_Wayne',2400,'B_wayne@mail.COM','650.130.6234','2008-01-15','president',10500.00,null,129,40)
 insert into emp values(137,'A_Ali',2900,'A_Ali@mail.COM','+919145565902','2010-09-10','president',11500.00,6,null,10)
 insert into emp values(138,'P_patil',2900,'P_patil@LOOK.COM','+7263822430','2010-09-10','president',12500.00,8,129,20)
 insert into emp values(139,'s_raja',2900,'s_raja@LOOK.COM','+018805784674','2010-09-10','president',13500.00,10,129,30)
 insert into emp values(140, 'Maruti',2900,'Maruti@mail.COM','+918805784674','2003-10-25','president',14500.00,1,null,10)
 insert into emp values (141,'BLAKE', 3000, 'BLAKE@TATA.COM', '+0163569874', '2011-11-23','ANALYST', 15000.00,4,103,80)
 insert into emp values (142, 'SCOTT', 1400, 'SCOTT@mail.COM','+756321548', '2001-01-23','salesmen', 16000,5,103, 80)
 insert into emp values (143, 'KING', 1500, 'KING@TATA.COM', '+917632569845', '2001-04-25','TESTER', 17000.00,6,103, 80)
 insert into emp values (144, 'FORD', 1600, 'FORD@TATA.COM', '+918456325647', '2001-09-17', 'TESTER', 18000.00,7, 102, 80)
 insert into emp values (145, 'raj', 1500, 'raj@TATA.COM', '+918456325647', '2008-09-17', 'TESTER', 18000.00,7, 102, 80)

 select * from emp

 create table DEPT ( DEPARTMENT_ID int primary key, DEPARTMENT_NAME varchar(20), MANAGER_ID int, LOCATION_ID int, LOC VARCHAR(15)) 

 insert into DEPT values (10,'Administration',103,1700,'pune')
 insert into DEPT values (20,'Marketing',108,1800,'Mumbai')
 insert into DEPT values (30,'Purchasing',114,1600,'Hydrabad')
 insert into DEPT values (40,'Human Resources',101,1900,'Noida')       
 insert into DEPT values (50,'Shipping',121,1500,'Chennai')
 insert into DEPT values (60,'IT',110,1400,'Delhi')
 insert into DEPT values (70,'Public Relations',204,2700,'Guhatti')
 insert into DEPT values (80,'Sales',115,2500,'bangluru')
 insert into DEPT values (90,'Quality',120,2300,'Bhopal')
 insert into DEPT values (100,'Manufature',102,2400,'Gurgaon')

 select * from dept
 select * from emp

--Q1) list the department names that are having no employees at all
select department_name from dept where department_id not in (select department_id from emp)

--Q2)display all the employees whose job is same as Alexander
select first_name,job_id from emp where job_id in (select job_id from emp where first_name='Alexander')

--Q3)display laura manager's manager's department name
select Department_name from DEPT where manager_id in (select MANAGER_ID from emp where FIRST_NAME='laura')

--Q4)list employees whose job is same as Laura and their salary greater than Mozhe salary
select first_name from emp where job_id in (select job_id from emp where FIRST_NAME='laura') 
and salary > (select salary from emp where FIRST_NAME='mozhe')


--Q5) display all the employees whose job is same as kevin and julia
select first_name from emp where job_id in (select job_id from emp where first_name in('kevin','julia'))

--Q6) display all the employees who are actual managers
select distinct FIRST_NAME from EMP where EMPLOYEE_ID in (select distinct MANAGER_ID from emp)

--using join
select distinct t1.first_name from emp t1 join emp t2 on t1.EMPLOYEE_ID=t2.MANAGER_ID


-- Q7) display who are all the employees reporting to manager nancy
select first_name,MANAGER_ID from emp where manager_id in (select EMPLOYEE_ID from emp where FIRST_NAME='nancy')

-- Q8) display the 2nd maximum salary
--subquery
select max(salary) from emp where salary < (select max(salary) from emp)
--top
select min(salary) from (select distinct top 2 salary from emp order by salary desc) as sal

select top 1 salary from (select distinct top 2 salary from emp order by salary desc) result order by salary asc
--dense_rank
with new_rank as
(select distinct salary,dense_rank() over(order by  salary desc) as number from emp )
select salary from new_rank where number=2

-- nth highest salary
select distinct salary from emp e1 where (select count(distinct salary) from emp e2 where e2.salary >e1.salary)=2-1


--Q9.1 )display the 3rd maximum salary
--subquery
select distinct max(salary) from emp where salary <(select max(salary) from emp where salary  <(select max(salary) from emp))
--top
select  top 1 salary from (select distinct top 3 salary from emp order by salary desc) result order by salary asc 
--dense_rank
with new_rank as
(select distinct salary,dense_rank()over(order by salary desc) as number from emp)
select* from new_rank where number=3 
--nth highest salary
--3rd highest and 2nd lowest in a single query
select FIRST_NAME, salary from emp e1 where 3-1=(select count(distinct salary) from emp e2 where e2.salary>e1.salary) or 2-1=(select count(distinct salary) from emp e2 where e2.salary<e1.salary)

--3rd highest
select first_name, salary from emp e1 where 3= (select count(distinct salary) from emp e2 where e2.salary>=e1.SALARY)

--Q 9.1 )display the 3rd minimum salary
select salary from emp order by salary
--subquery
select min(salary) from emp where SALARY > (select min(salary) from emp where SALARY > (select min(salary) from emp))
--top
select max(salary) from  (select distinct top 3 salary from emp where SALARY is not null order by salary asc) as salary --if null in column then null always take min value
--dense_rank
with new as
(select salary,DENSE_RANK() over(order by salary asc) as number from emp where SALARY is not null) --if null in column then null always take min value
select distinct salary from new where number=3
--nth lowest number
select e1.salary from emp e1 where 3-1 =(select count (distinct salary) from emp e2 where e2.SALARY < e1.SALARY)

select e1.salary from emp e1 where 3 = (select count (distinct salary) from emp e2 where e2.SALARY <= e1.SALARY)

-- Q10) display all the employees who are earning more than all the 'Salesman' job.
select first_name,salary from emp where salary > (select max(salary) from emp where JOB_ID='salesmen')

select first_name,salary from emp where salary> all(select salary from emp where job_id='salesmen')


--Q11). display all the employees who are earning more than any of the 'programer' job.
select employee_id,first_name,salary from emp where salary > all(select salary from emp where job_id='programer')

--Q12). select empno, job and salary of all the salesman who are earning more than any of the FI_ACCOUNT (job)
select employee_id,job_id,salary from EMP  where JOB_ID='salesmen' and salary  >(select max(salary ) from emp where JOB_ID in ('account','finance'))

select employee_id,job_id,salary from emp where job_id='salesman' and salary> all(select salary from emp where job_id in ('finance','account'))

--Q13). select the department name and location id AND LOCATION of all the employees working for PU_CLERK.
select department_name,location_id,loc from dept where department_id in (select department_id from emp where job_id='clerk')

-- Q14). select all the employees working for FI_ACCOUNT
select first_name from emp where job_id='finance'

-- Q15.1). display all the employees whose salary is greater than avg sal of manager id 121
select first_name,salary from emp where salary >(select avg(salary) from emp where manager_id=121)

-- Q15.2). display all the employees whose salary is greater than avg sal of employee_id 121
select * from emp where salary > (select avg(salary) from emp where EMPLOYEE_ID = 121)

-- Q16). display all the employees who gets maximum salary.
select first_name,salary from emp where SALARY = (select max(salary) from emp)

-- Q17). display first employee record based on hiredate
select * from emp where hire_date=(select min(hire_date) from emp)

--Q18). list the employees who has salary greater than Ismael
select * from emp where salary >(select salary from emp where first_name='ismael')

-- Q19). list the emp name having department is 'Shipping'
select first_name from emp where department_id in (select department_id from dept where DEPARTMENT_NAME='shipping')

--Q20). list the emp name havind department is 'Purchasing'
select * from emp where department_id=(select department_id from dept where department_name='purchasing')

-------------------------------------------------------------------------------------------------------------------------------------------------------
--Q21)display the employees whose first_name is having at least one ‘o’ in it.
select first_name from emp where first_name like '%o%'

-- Q22). list the department names that are having at least 1 employee in it.
select department_name from dept where DEPARTMENT_ID in (select DEPARTMENT_ID from emp)

select department_name from dept where department_id in (select department_id from emp group by department_id having count(department_id)>=1)

--Q23) list the department names that are having at least 4 employees in it
select department_name from dept where DEPARTMENT_ID in (select DEPARTMENT_ID from emp group by DEPARTMENT_ID having COUNT(department_id)>=4)

-- Q24). display the EMPLOYEE names which are having at least 2 employees in it and having quality dept
select first_name from emp where department_id in
(select department_id from emp group by department_id having count(department_id)>=2 and 
department_id= (select department_id from dept where department_name='quality'))

-- Q25). query to display the employee names who is having maximum salary in dept name manufature
 select first_name,salary from emp where salary =
 (select max(salary) from emp where department_id= 
 (select department_id from dept where department_name='manufature'))

--Q26). query to display the dept name who is having highest commission
select department_name from DEPT where DEPARTMENT_ID in (select DEPARTMENT_ID from emp where COMMISSION in (select max(commission) from emp))

--Q)27)  query to display all the employees whose dept number is same as nancy.
select * from emp where department_id = (select department_id from emp where first_name='nancy')

--Q28) query to display all the employees in manufature dept AND employees who has salary greater than john
select * from emp where department_id in (select department_id from dept where department_name='manufature' and 
salary > (select salary from emp where first_name='john'))

--Q29) list department name having atleast 3 Salesman
select department_name from dept where department_id in (select department_id from emp where job_id ='salesmen' group by department_id having count(department_id)>=3)

--Q30)display all employess who do not have any reporter/manager.
select first_name,employee_id from emp where employee_id not in(select manager_id from emp )

--Q31) list all the employees who are reporting to ' Matthew' manager
select * from emp where manager_id in (select EMPLOYEE_ID from emp where first_name='matthew')

--Q32). list employees from 'Marketing' and 'Purchasing' having atleast 2 reporting
select first_name from emp where department_id in (select department_id from dept where department_name in('marketing' , 'purchasing')) and 
employee_id in (select manager_id from emp group by manager_id having count(manager_id) >=2)

-- Q33). display the departname of the employee whose name does not starts with s and salary between 1500 to 3000.
select department_name from dept where department_id in (select department_id from emp where first_name like 
'[^s]%' and salary between 1500 and 3000)

--Q34) display location of employee whose salary is minimum salary but salary is greater than 2000
select loc from dept where department_id in  (select department_id from emp where salary in (select min(salary) from emp where salary >2000))

-- Q35). display the location of an employee in 'Human Resources' department.
select loc from dept where department_id in (select department_id from dept where department_name='human resources')

select loc from dept where DEPARTMENT_NAME='human resources'

-- Q36). display the department location_ID, LOC that are having greater than THREE employees in it.
select LOCATION_ID,loc from DEPT where location_ID in (select location_id from emp group by LOCATION_ID having count(location_id)>3) 

--Q37). write a query to display all the employee whose job not same as Nancy and salary is greater than LUIS
select * from emp where job_id not in( select job_id from emp where first_name ='nancy') and salary> (select salary from emp where first_name='luis')


-- Q39). display the job_ID, manager of employees who is working for Diana
select job_id,first_name from emp where manager_id=(select employee_id from emp where first_name='lex')

-- 40). display the employee names, hire_date, commission of nancy manager 
select first_name,hire_date,commission from emp where employee_id in(select manager_id from emp where first_name='nancy' )

--Q41). display the number of employees who are getting salary less than the Bruce'S manager 
select count(employee_id) from emp where salary <(select salary from emp where employee_id =(select manager_id from emp where first_name='bruce'))

--Q42). list employees who located in 'PUNE' and their commission is 1.
select employee_id,first_name from emp where commission=1 and location_id in(select location_id from dept where loc='pune')

-- Q43). list employees who work for sales department and their salary greater average salary of their department.
select * from emp where department_id in (select department_id from dept where department_name='sales') and salary>any (select avg(salary) from emp group by department_id)

-- Q44). list employees who are working in research Administration and they are manager.

select first_name from emp where manager_id in( select manager_id from emp where department_id in(select department_id from dept where department_name='administration' ))

select first_name from emp where manager_id in( select manager_id from emp where department_id in(select department_id from dept where department_name='it' ))

-- Q45). display department name of the employees who earn commission.

select department_name from dept where department_id in(select  distinct department_id from emp where commission is not null)
 
 -- Q46). display department name of the employee who earn maximum salary and have reporting manager.

select department_name from dept where department_id in
( select department_id from emp where manager_id is not null and salary =(select max(salary) from emp))

-- Q47). display employee details who are reporting to Diana and have commission without using null or not null
select employee_id from emp where employee_id in (select employee_id from emp where first_name='diana' and commission is not null)
  
-- Q48). list all the deptname and loc of all the salesman manager-manager's

select department_name,loc from dept where department_id in (select department_id from emp where employee_id
in (select manager_id from emp where employee_id in (select manager_id from dept where department_name='sales' )))


-- Q49). list the employee deptname and LOC of all the employees who are IT_PROG, reporting to ALEXANDER and salary is lesser than JULIA salary
 select department_name,loc from dept where department_id in (select department_id from emp where job_id='programer' and manager_id in
( select employee_id from emp where first_name='alexander' and salary>(select salary from emp where first_name='julia')))

-- Q50). list the employees who does not directly report to IT_PROG,
--have commission and salary more than max salary of all the ST_CLERK without using null or not null

select first_name from emp where  manager_id not in (select employee_id from emp where job_id='programer') and commission is not null and salary>
all(select max(salary) from emp where job_id='clerk')

--Q51). list the employees who joined after 2 years of first employee of the company and more than blake salary
select * from emp where hire_date>any (select dateadd(yy,2,(select min(hire_date)from emp)) from emp ) 
and salary > (select salary from emp where first_name='blake' )

-- Q52). display location_ID, LOCTION of all the employees who reporting to john 
 select location_id,loc from dept where department_id in (select department_id from emp where manager_id = 
 (select employee_id from emp where first_name='john'))

 -- Q53). list all the employees whose job is same as David and their salary lesser than JOHN
 select * from emp where job_id in(select job_id from emp where first_name='david'
 and salary < (select salary from emp where first_name='john') )

 -- Q55). display the ALEXANDER's first year salary and his location with department
 select (e1.salary*12) as first_year_salary,d1.department_id,d1.loc from emp e1 ,dept d1 where
 e1.department_id=d1.department_id and first_name='alexander'


 --Q56). display all the employees of department 30, 20 with there anual salary and having atleast 3 employees
 select (salary*12) as annual_sal ,first_name from emp where department_id in(20,30) and 
 department_id in(select department_id from emp group by department_id having count(department_id)>=3)

 --Q57). display department name which is having second highest average salary and third highest indiviual salary
  SELECT DEPARTMENT_NAME FROM DEPT WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMP WHERE SALARY IN (SELECT MIN(SALARY)
 FROM EMP WHERE SALARY IN ( SELECT DISTINCT TOP 2 ROUND(AVG(SALARY), 2) AS AVG_SAL FROM EMP
 GROUP BY DEPARTMENT_ID ORDER BY AVG_SAL DESC ))) AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMP WHERE SALARY IN 
 ( SELECT MIN(SALARY) FROM EMP WHERE SALARY IN ( SELECT DISTINCT TOP 3 SALARY FROM EMP ORDER BY SALARY DESC )))

 -- Q58). display all the employees who are earn less than any of the Administration?
 select employee_id,first_name from emp where department_id in (select department_id from emp where salary 
 <any (select salary from emp where department_id in 
 (select department_id from dept where department_name='administration')))

 -- Q59). display all the employees who are joined before the last person?
 select employee_id,first_name from emp where hire_date not in (select max(hire_date)from emp) 

 -- Q60). display second last  employee record?
 select * from emp where hire_date =(select max(hire_date) from emp where hire_date <(select max(hire_date) from emp)) 

 -- Q61). find 3rd minimum salary in the employee table
 select min(salary) from emp where salary >(select min(salary) from emp where salary>(select min(salary) from emp ))
 select top 1 salary from emp where salary in(select distinct top 3 salary from emp order by salary) result order by salary desc )

 select  top 1 salary from (select distinct top 3 salary from emp order by salary ) result order by salary desc 

with new_rank as
(select *,dense_rank() over (order by salary) as number from emp)
select * from new_rank where number=3

-- Q62). display all the employees who are earning more than any of the FI_MGR.
select * from emp where salary >any(select salary from emp where job_id='finance')

-- Q63). list employees who joined after 4 years of 1st employee of the company and less than Valli salary.
select first_name from emp where hire_date>any (select dateadd(yy,4,(select min(hire_date) from emp)) from emp)
and salary >( select salary from emp where first_name='valil' )

-- Q64). display the department information of employee who is working for pune location 
select e1.*,d1.department_name,d1.loc from emp e1,dept d1 where e1.department_id=d1.department_id and d1.loc='pune'

-- Q66). display the salary wise employee information for deptno 20 in descending order
select * from emp where department_id=20 order by salary desc 

-- Q66). display second employee record
select * from emp where hire_date=(select min(hire_date) from emp where hire_date  > (select min(hire_date) from emp)) 

-- Q67). display location of employees, whose name doesn't start with 'a' and salary between 1000 and 3000.
select loc from dept where department_id in (select department_id from emp where first_name like '[^a]%' and salary between 1000 and 3000 )

-- Q68). display department name of all the employees who are reporting to ALEXANDER.
select department_name from dept where department_id in( select department_id from emp where manager_id 
in(select employee_id from emp where first_name='alexander'))

-- Q69). display Lex's manager's manager's department  AND loc.
 select department_name,loc from dept where manager_id in (select manager_id from emp where employee_id=
 (select manager_id from emp where first_name='lex'))

 -- Q70). display the employee name and their salary who joined 2 years before the last person hired 
 SELECT FIRST_NAME, SALARY FROM EMP WHERE DATEPART(YY,HIRE_DATE)  IN (SELECT MAX(DATEPART(YY,HIRE_DATE)) - 2 FROM EMP)

 -- Q71). display the employee name,job and department for those who HAVE AND HAVENOT commission

 select e.first_name,e.job_id,d.department_name,e.commission from emp e ,dept d where
 e.department_id=d.department_id and e.commission is not null

 -- Q72). display the employee details with their location who earn maximum commission
 select * from emp,dept where emp.department_id=dept.department_id and commission in (select max(commission) from emp )

 -- Q73). display all the employee whose department is sales and who is earning some commission 
 --    (i.e commission is not null or zero)and whose hired before the last person hired.
 select * from emp where hire_date  < (select max(hire_date) from emp ) and
 department_id in (select department_id from dept where department_name='sales') and   commission  is not null or commission=0

 -- Q74). display all the department names and manager who is GUY's manager's manager
 select d.department_name,e.manager_id from emp e,dept d where e.department_id=d.department_id and employee_id in 
 (select manager_id from emp where employee_id in (select manager_id from emp where first_name='guy'))

 -- Q75). display department names and maximum commission of employee's whose salary is greater than average salary of all the CLERK's
select department_name from dept where department_id in 
(select department_id from emp where commission in (select max(commission) from emp)
and salary >(select avg(salary) from emp where job_id='clerk'))


--Q76). display the last employee record with location.
select e.*,d.loc,d.department_name from emp e,dept d where e.department_id=d.department_id 
and  hire_date = (select max(hire_date) from emp)

-- Q77). display the department number who working in sales department and they are FINANCE AND PROGRAMER
select department_id,department_name from dept where department_id in 
( select department_id from dept where department_name='sales' and department_id in
(select department_id from emp where job_id in ( 'finance','programer')))

-- Q78). display department name of the employee who earn  GRATER THAN minmum salary and have reporting manager.
select department_name from dept where department_id in (
select department_id from emp where employee_id in 
(select manager_id from emp where salary>( select min(salary) from emp where manager_id is not null)))

-- Q79). display hiredate and dname of all the employees working for sales
select e.hire_date,d.department_name from emp e,dept d where e.department_id =d.department_id and d.department_id in
(select department_id from dept where department_name='sales')

-- Q80). display location and dname of employee who working as FINANCE
select loc,department_name from dept where department_id in 
(select department_id from emp where job_id ='finance')

-- Q81). display the dname of employees whoes salary is maximum salary but lesser than 3000
select department_name from dept where department_id in (
select department_id from emp where salary in (select max(salary) from emp where salary < 3000))

-- Q82). display the department name who are reporting to adam.
select department_name from dept where department_id in
(select department_id from emp where manager_id in ( select employee_id from emp where first_name='adam'))

-- Q83). display last employee record.
select * from emp where hire_date =(select max(hire_date) from emp )

 --Q84). display all the employee whose salary is greater than average salary of department 30.
 (select * from emp where salary >(select avg(salary) from emp where department_id =30))

 --Q85). display the number of employees who work for SALES dept and their salary is lesser than one of the salary in department in 10.
 select count(*) from emp where department_id in 
(select department_id from dept where department_name='sales' and salary  < any (select salary from emp where department_id=10))
 
 -- Q86). display the dname that are having CLERK in it.
 select department_name from dept where department_id in (select department_id from emp where job_id='clerk')

 -- Q87). display the department names that are having atleast one l in it.
 select department_name from dept where department_name like '%l%'

 -- 88. display all the employees who are joined after Diana .
 select * from emp where hire_date >(select hire_date from emp where first_name='diana')

 -- 89. list the dept name that are having at least 3 employees but not more than 5 employees in it.
select department_name from dept where department_id in 
(select department_id from emp group by department_id  having count(department_id) between 3 and 5)

-- 90. display the location of all employees whose reporting manager salary is greater than 8000.
select loc from dept where department_id in 
(select department_id from emp where manager_id in (select employee_id from emp where salary >8000))

-- 91. select the employees whose dname is having at least two 'I' in it.
select * from emp where department_id in
(select department_id,DEPARTMENT_NAME from dept where department_name like '%i%i%')

-- 92. display ename,sal of employees who are earning more than any of the manager (quest. not clear)
select FIRST_NAME,salary from emp where JOB_ID in (select JOB_ID from emp where JOB_ID!='manager') and SALARY>(select min(salary) from emp where job_id='manager')

select first_name,salary from emp where salary >any (select salary from emp where job_id ='manager')

-- 93. select all the employees who are working for Delhi
select * from emp where department_id in 
(select department_id from dept where loc='delhi')

-- 94. query to display employee names who is having minimum salary in department Human Resources
 select * from emp where salary in (select min(salary) from emp where department_id 
in( select department_id from dept where department_name='human resources' ))

-- 95. list the department names that are having tester.
select department_name from dept where department_id 
in (select department_id from emp where job_id ='tester' )

-- 96. list the department names that are having at least 3 employes in it.
select department_name from dept where department_id in
(select department_id from emp group by department_id having count(department_id)>=3)

-- 97. list employees from Purchasing and IT department having atleast two reportings
select * from emp where department_id in
(select department_id from dept where department_name in('it','purchasing')) and employee_id 
in( select manager_id from emp group by manager_id having count(manager_id)>=2 )

-- 98. write a query to display employee name, job,dname,location of all employees who are working as clerk and works at Noida.
select e.first_name,e.job_id,d.department_name,d.loc from emp e,dept d 
where e.department_id =d.department_id and
job_id='clerk' and loc='noida'

-- 99. select ename,dname of employee who earns 2nd max salary and works form location Guhatti.
select e.first_name,d.department_name from emp e, dept d where e.department_id=d.department_id and
e.salary in(select max(salary) from emp where salary <(select max(salary) from emp) and
department_id in(select department_id from dept where loc='guhatti'))

-- 100. write a query to display the employee information who taking commission 4, 9 and joined company after july 2005.
select * from emp where COMMISSION in (4,9) and HIRE_DATE > '2005-07-31'

--101. list employees from Shipping and Administration department having atleast 2 reporting employees
select * from emp where department_id in 
(select department_id from dept where department_name in ('shipping','administration'))and employee_id
 in (select manager_id from emp group by manager_id having count(manager_id)>=2)

 --102. list employees who have commission greater than maximum salary of all the salesman and who do not report to Matthew directly
select first_name from emp where commission > (select max(salary) from emp
where department_id =(select department_id from dept where department_name='sales')) and
manager_id != (select manager_id from emp where first_name='matthew')

-- 103. display the location of all the deaprtments which have employees joined in the year 2006
select loc from dept where department_id in (select department_id from emp where hire_date in
(select hire_date from emp where datepart(yy,hire_date)=2006))

-- 104. display departmentwise minimum salary which is less than average salary of employees.

select min(salary),department_id from emp where salary<(select avg(salary) from emp) group by department_id order by department_id 

--105. display all the employees who are reporting to 'ALEXANDER'.
 select first_name,manager_id from emp where manager_id 
 in (select employee_id from emp where first_name='alexander')

 --106. display all the employee information who are living in a location which is having at least 2 'U' in it.
  select * from emp where department_id =(select department_id from dept where loc like '%u%u')

  --107. display the names of employee from department number 90 with salary greater than that of all employee working in other departments.
  select * from emp where department_id=90 and salary >any (select salary from emp where department_id !=90)

  -- 108. display the names of employees who earn highest salary in their respective jobs. 
 select job_id,max(salary) from emp group by job_id 

 -- 109. display the employee number and name of employee working as ST_CLERK and earning highest salary among ST_CLERK
select * from emp where job_id='clerk' and
salary=(select max(salary) from emp where job_id='clerk' )


-- 110. write a query to find PAYAM's manager's manager hiredate.
select hire_date from emp where employee_id =
(select manager_id from emp where employee_id in
(select manager_id from emp where first_name='payam'))

-- 111. list the number of employees whose job is ST_CLERK working IN LOCATION bangluru and Noida

 Select * from emp where job_id='clerk' and department_id in 
(select department_id from dept where loc in ('bangluru','noida'))

-- 112. list the department names in which the employees are hired between 1st of jan 2005 and 31st dec 2006 with salary more than 3000.
select department_name from dept where department_id in 
(select department_id from emp where hire_date between '2005-1-1' and '2006-12-31'  and salary > 3000)

-- 113. display location of the employee who earn maximum salary and have no reporting manager
select loc from dept where department_id in
(select department_id from emp where salary in (select max(salary) from emp where manager_id is null));

-- 114. list employees who works for IT_PROG department and their salary greater than average salary of their department
select * from emp where job_id='programer' and salary >(select avg(salary) from emp) 

-- 115. display location of the employee who earn commission
select loc from dept where department_id in 
(select department_id from emp where commission is not null)

--116. list the employees who does not directly report to Quality,
--      have commission and salary more than max salary of all the ST_CLERK, without using null or not null
select * from emp where department_id not in (select department_id from dept where department_name='qulaity') and 
commission >(select max(commission) from emp where job_id='clerk') and salary  >(select max(salary) from emp where job_id='clerk')

-- 117. display all the employees whose salary is greater than avg sal of department 20
(select  * from emp where salary > (select avg(salary) from emp where department_id =20) )

-- 118. list the employee deptname and loc of all the employees who are IT_PROG, reporting to Alexander and salary is lesser than John salary
select department_name,loc from dept where department_id in 
(select department_id from emp where job_id ='programer' and manager_id in 
( select employee_id from emp where first_name='alexander' and salary < (select salary from emp where first_name='john')))

-- 119. display ename, dname whose job is ST_CLERK.
select e.first_name,d.department_name from emp e,dept d where e.department_id=d.department_id and e.job_id ='clerk'

-- 120. display employees location who has some commission.
select loc from dept where department_id in (select department_id from emp where commission is not null)

-- 121. display empno, ename, job, whose job has 'e' in it and display empno in descending order.
 select employee_id,first_name ,job_id from emp where job_id like '%e%' order by employee_id desc                                 

 -- 122. display dname, loc,deptno of employees who has same reporting IT_PROG
 select e.first_name,d.department_name,d.loc,d.department_id from emp e,dept d where e.department_id =d.department_id and e.department_id in
 (select department_id from emp where job_id ='programer')

 -- 123. display avg salary of all employees whose dept name is Manufature
 select avg(salary) from emp where department_id in 
 (select department_id from dept where department_name='manufature')

 -- 124. display all employees details whose hiredate is in year 2006 (NOT SOLVED)
 select * from emp where datepart(yy,hire_date)=2006


 -- 125. dispay details of DEN including his location ID
select e.first_name,d.location_id from emp e,dept d where e.department_id=d.department_id

-- 126. display number of employees whose commission is more than AVG COMMISSION.
select * from emp where commission > (select avg(commission) from emp)

select count(*)from emp where commission > (select avg(commission) from emp)


-- 127. list the employees whose daily salary is greater than 150 and who are joined before 2006 QUESTIONS ON SUBQUERIES
 select * from emp where salary in ( select salary from emp where salary/31>150) and  hire_date 
 in( select hire_date from emp where hire_date< '2006-01-01')

 -- 128. query to display the employee names whose name as 2nd character should be 'o' 
 select * from emp where first_name like '_o%'

 -- 129. How find domain or server from email column ? VIMP *****
select SUBSTRING(email,CHARINDEX('@',email),len(email)-CHARINDEX('@',email)+1) as domain from emp 
group by SUBSTRING(email,CHARINDEX('@',email),len(email)-CHARINDEX('@',email)+1)

select right(email,len(email)-charindex('@',email)+1) as domain from emp 
group by right(email,len(email)-charindex('@',email)+1)


 -- 130. Display the dept_id which is having the maximum salary more than 8000 earned by the employee and 
 -- job description not as a clerk and sort by descending order
 select department_id from emp where salary > any(select salary from emp where salary >8000) and job_id 
 not in(select job_id from emp where job_id='clerk') order by department_id desc

select department_id ,max(salary) from emp where job_id <> 'clerk' group by department_id having 
max(salary)>8000 order by department_id desc


 -- 131. List the number of employee in each department, except 30, sorted high to low. Only include department with 3 or more employee.
select department_id,count(department_id) from emp where department_id !=30 group by department_id 
 having count(*) >=3 order by department_id desc; 

 -- 132. Display the number of employees who has annual salary more than 100000 department-wise
select department_id,count(*) from emp where salary*12>100000 group by department_id;

 -- 133. Display department which have highest number of employee.

with cte_new as
(select department_id,count(department_id) as emp_count, DENSE_RANK() over (order by count(department_id) desc) as denserank from EMP
group by DEPARTMENT_ID)
select department_name,dept.department_id,emp_count from cte_new,dept where denserank=1 and cte_new.department_id=dept.department_id

