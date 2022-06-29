use practice1
go

--1. From the following tables, write a SQL query to find the information on each salesperson of ABC Company. Return name, city, country and state of each salesperson. Go to the editor
--Input:

--table: salespersons

--salesperson_id|first_name|last_name|
----------------|----------|---------|
--             1|Green     |Wright   |
--             2|Jones     |Collins  |
--             3|Bryant    |Davis    |
--table: address

--address_id|salesperson_id|city       |state     |country|
------------|--------------|-----------|----------|-------|
--         1|             2|Los Angeles|California|USA    |
--         2|             3|Denver     |Colorado  |USA    |
--         3|             4|Atlanta    |Georgia   |USA    |

--Output:

--first_name|last_name|city       |state     |
------------|---------|-----------|----------|
--Jones     |Collins  |Los Angeles|California|
--Bryant    |Davis    |Denver     |Colorado  |
--Green     |Wright   |           |          |

CREATE TABLE salespersons(salesperson_id int, first_name varchar(255), last_name varchar(255));
CREATE TABLE address (address_id int, salesperson_id  int, city varchar(255), state varchar(255), country varchar(255));
TRUNCATE TABLE address;
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('1', 'Green', 'Wright');
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('2', 'Jones', 'Collins');
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('3', 'Bryant', 'Davis');

TRUNCATE TABLE address;
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('1', '2', 'Los Angeles','California', 'USA');
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('2', '3', 'Denver', 'Colorado','USA');
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('3', '4', 'Atlanta', 'Georgia','USA');

select * from address;
select * from salespersons;

--Ans
select first_name,last_name,city,state from salespersons as s left join address as a 
on s.salesperson_id=a.salesperson_id

------------------------------------------------------------------------------------------------------------------
--2. From the following table, write a SQL query to find the third highest sale. Return sale amount. Go to the editor
--Input:

--table: salemast

--sale_id|employee_id|sale_date |sale_amt|
---------|-----------|----------|--------|
--      1|       1000|2012-03-08|    4500|
--      2|       1001|2012-03-09|    5500|
--      3|       1003|2012-04-10|    3500|
--      3|       1003|2012-04-10|    2500|
--Output:

--SecondHighestSale|
-------------------|
--             3500|

CREATE TABLE  salemast(sale_id int, employee_id int, sale_date date, sale_amt int);

INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('1', '1000', '2012-03-08', 4500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('2', '1001', '2012-03-09', 5500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 3500); 
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 2500); 

SELECT  * FROM salemast;

--Ans

select max(sale_amt) as third_highest_amt from salemast where sale_amt  <
(select max(sale_amt) from salemast where sale_amt < (select max(sale_amt) from salemast))

with new_rank as
(select *,DENSE_RANK () over (order by sale_amt desc) as number from salemast)
select sale_amt as third_highest_amt from new_rank where number=3;

--4. From the following table, write a SQL query to find the marks, which appear at least thrice one after another without interruption. Return the number. Go to the editor					
--Input:					
--table: logs					
					
--student_id|marks|					
------------|-----|					
--       101|   83|					
--       102|   79|					
--       103|   83|					
--       104|   83|					
--       105|   83|					
--       106|   79|					
--       107|   79|					
--       108|   83|					
					
--Output:					
					
--ConsecutiveNums|					
-----------------|					
--             83|

--test data
CREATE TABLE logs (student_id int, marks int);

INSERT INTO logs (student_id, marks) VALUES ('101', '83');
INSERT INTO logs (student_id, marks) VALUES ('102', '79');
INSERT INTO logs (student_id, marks) VALUES ('103', '83');
INSERT INTO logs (student_id, marks) VALUES ('104', '83');
INSERT INTO logs (student_id, marks) VALUES ('105', '83');
INSERT INTO logs (student_id, marks) VALUES ('106', '79');
INSERT INTO logs (student_id, marks) VALUES ('107', '79');
INSERT INTO logs (student_id, marks) VALUES ('108', '83');
select * from logs;

--Ans
SELECT DISTINCT L1.marks AS ConsecutiveMarks,*
FROM logs AS L1, logs AS L2, logs AS L3
WHERE L1.student_id = L2.student_id +1 
AND L1.student_id = L3.student_id +2 
AND L1.marks = L2.marks AND L1.marks = L3.marks;

--5. From the following table, write a SQL query to find all the duplicate emails (no upper case letters) of the employees. Return email id. Go to the editor					
--Input:					
--table: employees					
					
--employee_id|employee_name|email_id     |					
-------------|-------------|-------------|					
--        101|Liam Alton   |li.al@abc.com|					
--        102|Josh Day     |jo.da@abc.com|					
--        103|Sean Mann    |se.ma@abc.com|					
--        104|Evan Blake   |ev.bl@abc.com|					
--        105|Toby Scott   |jo.da@abc.com|					
					
--Output:					
					
--email_id     |					
---------------|					
--jo.da@abc.com|				


--Test data
CREATE TABLE  employees(employee_id int, employee_name varchar(255), email_id varchar(255));

INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com');	
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');
SELECT * FROM employees;

--Ans
select email_id from employees group by email_id having COUNT(email_id)>1

--6. From the following tables, write a SQL query to find those customers who never ordered anything. Return customer name. Go to the editor					
--Input:					
--table: customers					
					
--customer_id|customer_name|					
-------------|-------------|					
--        101|Liam         |					
--        102|Josh         |					
--        103|Sean         |					
--        104|Evan         |					
--        105|Toby         |					
					
--table: orders					
					
--order_id|customer_id|order_date|order_amount|					
----------|-----------|----------|------------|					
--     401|        103|2012-03-08|        4500|					
--     402|        101|2012-09-15|        3650|					
--     403|        102|2012-06-27|        4800|					
					
--Output:					
					
--Customers|					
-----------|					
--Evan     |					
--Toby     |

--Test Data
CREATE TABLE customers (customer_id int, customer_name varchar(255));

INSERT INTO customers (customer_id, customer_name) VALUES ('101', 'Liam');
INSERT INTO customers (customer_id, customer_name) VALUES ('102', 'Josh');
INSERT INTO customers (customer_id, customer_name) VALUES ('103', 'Sean');
INSERT INTO customers (customer_id, customer_name) VALUES ('104', 'Evan');
INSERT INTO customers (customer_id, customer_name) VALUES ('105', 'Toby');	

CREATE TABLE orders (order_id int, customer_id int, order_date Date, order_amount int);

INSERT INTO orders (order_id, customer_id,order_date,order_amount) VALUES ('401', '103','2012-03-08','4500');
INSERT INTO orders (order_id, customer_id,order_date,order_amount) VALUES ('402', '101','2012-09-15','3650');
INSERT INTO orders (order_id, customer_id,order_date,order_amount) VALUES ('403', '102','2012-06-27','4800');
SELECT * FROM customers;
SELECT * FROM orders;

--solution 1
select customer_name from customers where customer_id in (
select customer_id from customers except select customer_id from orders)
--solution 2
select customer_name from customers where customer_id not in (select customer_id from orders)

