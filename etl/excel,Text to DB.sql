use etl
go

select * from information_schema.TABLES

select count(*) from order2_excel;

sp_help order_excel

select * from order2_excel

--count duplicate records

select WO,District,LeadTech,Service,Rush,ReqDate,WorkDate,Techs,WtyLbr,WtyParts	,LbrHrs,
PartsCost,Payment,Wait, LbrRate, LbrCost, LbrFee, PartsFee, TotalCost,TotalFee,ReqDay,
WorkDay,COUNT(*) as duplicate from order2_excel
group by WO,District,LeadTech,Service,Rush,ReqDate,WorkDate,Techs,WtyLbr,WtyParts,LbrHrs,
PartsCost,Payment,Wait, LbrRate, LbrCost, LbrFee, PartsFee, TotalCost,TotalFee,ReqDay,
WorkDay having COUNT(*)>1

--delete duplicate records

with DUPLICATE_RECORDS AS
(select WO,District,LeadTech,Service,Rush,ReqDate,WorkDate,Techs,WtyLbr,WtyParts,LbrHrs,
PartsCost,Payment,Wait, LbrRate, LbrCost, LbrFee, PartsFee, TotalCost,TotalFee,ReqDay,
WorkDay,row_number() OVER (Partition by wo,District,LeadTech,Service,Rush,ReqDate,WorkDate,Techs,WtyLbr,WtyParts,LbrHrs,
PartsCost,Payment,Wait, LbrRate, LbrCost, LbrFee, PartsFee, TotalCost,TotalFee,ReqDay,
WorkDay order by wo)as row_no from order2_excel)
Delete from DUPLICATE_RECORDS where row_no>1

select * from order2_excel;

---text to DB

sp_help order1

select * from order1

select COUNT(*) from Order1;

delete order1;

select * from INFORMATION_SCHEMA.tables

use SSIS_CS

select * from Customer

with DUPLICATE_RECORDS AS
(select firstName,MiddleName,Lastname,BirthDate,Gender, customer_id, ROW_NUMBER() 
OVER (Partition by firstName,MiddleName,Lastname,BirthDate,Gender, customer_id order by customer_id)as row_no from Customer)
Delete from DUPLICATE_RECORDS where row_no>1

--cte function are not applicable for group by clause
with duplicatevalues as
(select firstName,MiddleName,Lastname,BirthDate,Gender, customer_id, count(*) as duplicate from Customer
group by firstName,MiddleName,Lastname,BirthDate,Gender, customer_id
having count(*)>1)
delete from duplicatevalues where count(*)>1

select * from Customer
select * from Customer1
select * from Customer2

truncate table customer1
truncate table customer2

select * from Customer where Gender='M'--9351
select * from Customer where Gender='f'--9133