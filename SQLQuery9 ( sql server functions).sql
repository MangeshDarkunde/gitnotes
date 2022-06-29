--SQL server function
--1.  upper
--2.  lower
--3.  len
--4.  reverse
--5.  replace
--6.  replicate
--7.  substring,left,right
--8.  concat
--10. ltrim
--11. rtrim
--12  round
--13  str



--1. upper

select * from info;
select upper ('class');

select *, upper (name) as capital from info;

--2. lower
select LOWER ('CLASS');
select *, lower (name) as lower_1 from info;

--initcap (capatilize each starting word but only work in oracle)

--3. len (calculate string length)
select *, LEN(name) as lenght from info;
select LEN('class');

--4. Reverse
select *, REVERSE(name) as new from info;
select reverse ('class');

--5. Replace

select replace ('class','s','a');
select replace('class','ss','sa');
select *, replace (name, 'amit','kaushal') as new_name from info;
select *, replace (name, 'amit','kaushal') from info

--6.Replicate
select REPLICATE ('class',3);
select *, REPLICATE(name,5) as replica_1 from info;

--7. substring
--substring(name,x,y)
--ex. name is ABCDERFGH and requirement is CDE then
--x-starting position of substring
--y-lenght of substring

select *, substring (name,2,3) as sub from info;
select *,left (name,3) from info;
select *,right(name,3) from info;
select 


--8.concat

--method1
select id,name + '           '+ city as join1 from info;
select id,name + ' '+ city as join1 from info;

--method2
select id,concat(name,'_',city) as join2 from info;
select *,concat(name,'_',city) as join2 from info;


--9. ltrim (removing space from left side), rtrim(removing space from right side)

select('class');
--'class'
select('     class  ');
--'     class  '

select ltrim('     class  ')
--'class  '
select rtrim('     class     ')
 '    class'

 select ltrim(rtrim(name)) from info;
 'class'

 select * from info

 update info set name='  amit' where name='amit'
 update info set name='mangesh   'where name='mangesh'
 update info set name='   john    ' where name='john'

 select rTRIM(ltrim(name)) from info
 select name from info

 -----------------------
-- 10. round

select ROUND (933.9363,2);
SELECT str(933.936,10,2);

--11.CAST()
--The CAST() function converts a value (of any type) into a specified datatype.
--Syntax :CAST(expression AS datatype [(length)])
select convert(varchar,GETDATE())

select cast(getdate() as varchar)
select * from DOJ
select *,CAST(DOJ as varchar) as DOJConverted from DOJ

--12.CHARINDEX()
--The charindex() function searches for a substring in a string and returns position.
--if the substring is not found, this function returns 0.
--syntax : CHARINDEX(Substring,string,start)

--Q.How will you findout the place of charecter 'E' in 'SCODEEN'?
select CHARINDEX('E','SCODEEN') 
select CHARINDEX('sc','scodeen') as matching


--Q.How find domain or server from email column ?VVVIMP****

use [Q&A]
go

select * from emp

select email,SUBSTRING([email],CHARINDEX('@',[email])+1,len([email])) as domain from EMP 

select distinct SUBSTRING(email, CHARINDEX('@',[email])+1,len([email])) as domain from emp --using substing func
select distinct email,right(email,len(email)-charindex('@',email))as domain from emp--using right func

select distinct right(email,len(email)-charindex('@',email))as domain from emp order by domain desc --null value at last

select substring ('Praveen123@gmail.com',12,20)

select CHARINDEX('@',[email]) from emp --11+1 =12
select len(email) from emp -- 20


--Q.How to find the number of occurance of 'e' charetcer in string? L&T
SELECT DATALENGTH('lleelleelleel') ---12
select len(REPLACE('lleelleelleel','e','')) --6

SELECT (DATALENGTH('lleelleelleel')-len(REPLACE('lleelleelleel','e',''))) ---6

