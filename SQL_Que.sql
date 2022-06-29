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

--thirdHighestSale |
-------------------|
--             3500|

CREATE TABLE  salemast(sale_id int, employee_id int, sale_date date, sale_amt int);

INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('1', '1000', '2012-03-08', 4500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('2', '1001', '2012-03-09', 5500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 3500); 
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 2500); 

SELECT  * FROM salemast;

--Ans
--using subquery
select max(sale_amt) as third_highest_amt from salemast where sale_amt  <
(select max(sale_amt) from salemast where sale_amt < (select max(sale_amt) from salemast))

--using cte function
with new_rank as
(select *,DENSE_RANK () over (order by sale_amt desc) as number from salemast)
select sale_amt as third_highest_amt from new_rank where number=3;

--using top
select min(sale_amt) from (select top 3 sale_amt from salemast order by sale_amt desc) as s

--using nth highest
select sale_amt from salemast t1 where 3-1=(select count(distinct sale_amt) from salemast t2 where t2.sale_amt>t1.sale_amt)


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

--7. From the following table, write a SQL query to remove all the duplicate emails of employees keeping the unique email with the lowest employee id. Return employee id and unique emails. Go to the editor					
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
					
--employee_id|employee_name|email_id     |					
-------------|-------------|-------------|					
--        101|Liam Alton   |li.al@abc.com|					
--        102|Josh Day     |jo.da@abc.com|					
--        103|Sean Mann    |se.ma@abc.com|					
--        104|Evan Blake   |ev.bl@abc.com|	

select * from employees
--Ans
delete employees where employee_id not in (select min(employee_id)from employees group by email_id)

--8. From the following table, write a SQL query to find all dates city ID with higher pollution compared to 
--its previous dates (yesterday). Return city ID, date and pollution. Go to the editor					
--Input:					
--table: so2_pollution					
					
--city_id|date      |so2_amt|					
---------|----------|-------|					
--    701|2015-10-15|      5|					
--    702|2015-10-16|      7|					
--    703|2015-10-17|      9|					
--    704|2018-10-18|     15|					
--    705|2015-10-19|     14|					
					
--Output:			wrong output as per question		
					
--City ID|					
---------|					
--    702|					
--    703|	

--test data

CREATE TABLE  so2_pollution (city_id int, date date, so2_amt int);

INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('701', '2015-10-15', '5');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('702', '2015-10-16', '7');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('703', '2015-10-17', '9');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('704', '2018-10-18', '15');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('705', '2015-10-19', '14');
SELECT * FROM so2_pollution;

--ans

select t1.city_id,t1.date,t1.so2_amt from so2_pollution t1 join so2_pollution t2 
on t1.city_id=t2.city_id+1 and t1.so2_amt>t2.so2_amt

--9. A salesperson is a person whose job is to sell products or services.					
--From the following tables, write a SQL query to find the top 10 salesperson that have made highest sale. Return their names and total sale amount. Go to the editor					
--Input:					
--Table: sales					
					
--TRANSACTION_ID|SALESMAN_ID|SALE_AMOUNT|					
----------------|-----------|-----------|					
--           501|         18|    5200.00|					
--           502|         50|    5566.00|					
--           503|         38|    8400.00|					
--...					
--           599|         24|   16745.00|					
--           600|         12|   14900.00|					
					
--Table: salesman					
					
--SALESMAN_ID|SALESMAN_NAME        |					
-------------|---------------------|					
--         11|Jonathan Goodwin     |					
--         12|Adam Hughes          |					
--         13|Mark Davenport       |					
--....					
--         59|Cleveland Hart       |					
--         60|Marion Gregory       |					
					
--Output:					
					
--salesman_name        |total_sale|					
-----------------------|----------|					
--Dan McKee            |  70530.00|					
--Cleveland Klein      |  61020.00|					
--Elliot Clapham       |  60519.00|					
--Evan Blake           |  53108.00|					
--Ollie Wheatley       |  52640.00|					
--Frederick Kelsey     |  52270.00|					
--Sean Mann            |  52053.00|					
--Callum Bing          |  48645.00|					
--Kian Wordsworth      |  45250.00|					
--Bradley Wright       |  41961.00|					

--test data
CREATE TABLE sales (
TRANSACTION_ID INTEGER NOT NULL,
SALESMAN_ID   INTEGER NOT NULL,
SALE_AMOUNT  decimal(8,2),
PRIMARY KEY (TRANSACTION_ID)
)

INSERT INTO sales VALUES(501,18,5200.00),(502,50,5566.00),(503,38,8400.00),(504,43,8400.00),(505,11,9000.00);
INSERT INTO sales VALUES (506,42,5900.00),(507,13,7000.00),(508,33,6000.00),(509,41,8200.00),(510,11,4500.00);
INSERT INTO sales VALUES (511,51,10000.00),(512,29,9500.00),(513,59,6500.00),(514,38,7800.00),(515,58,9800.00);
INSERT INTO sales VALUES (516,60,12000.00),(517,58,13900.00),(518,23,12200.00),(519,34,5480.00),(520,35,8129.00);
INSERT INTO sales VALUES (521,49,9323.00),(522,46,8200.00),(523,47,9990.00),(524,42,14000.00),(525,44,7890.00);
INSERT INTO sales VALUES (526,47,5990.00),(527,21,7770.00),(528,57,6645.00),(529,56,5125.00),(530,25,10990.00);
INSERT INTO sales VALUES (531,21,12600.00),(532,41,5514.00),(533,17,15600.00),(534,44,15000.00),(535,12,17550.00);
INSERT INTO sales VALUES (536,55,13000.00),(537,58,16800.00),(538,25,19900.00),(539,57,9990.00),(540,28,8900.00);
INSERT INTO sales VALUES (541,44,10200.00),(542,57,18000.00),(543,34,16200.00),(544,36,19998.00),(545,30,13500.00);
INSERT INTO sales VALUES (546,37,15520.00),(547,36,20000.00),(548,20,19800.00),(549,22,18530.00),(550,19,12523.00);
INSERT INTO sales VALUES (551,46,9885.00),(552,22,7100.00),(553,54,17500.00),(554,19,19600.00),(555,24,17500.00);
INSERT INTO sales VALUES (556,38,7926.00),(557,49,7548.00),(558,15,9778.00),(559,56,19330.00),(560,24,14400.00);
INSERT INTO sales VALUES (561,18,16700.00),(562,54,6420.00),(563,31,18720.00),(564,21,17220.00),(565,48,18880.00); 
INSERT INTO sales VALUES (566,33,8882.00),(567,44,19550.00),(568,22,14440.00),(569,53,19500.00),(570,30,5300.00);
INSERT INTO sales VALUES (571,30,10823.00),(572,35,13300.00),(573,35,19100.00),(574,18,17525.00),(575,60,8995.00);
INSERT INTO sales VALUES (576,53,9990.00),(577,21,7660.00),(578,27,18990.00),(579,11,18200.00),(580,30,12338.00);
INSERT INTO sales VALUES (581,37,11000.00),(582,27,11980.00),(583,18,12628.00),(584,52,11265.00),(585,53,19990.00);
INSERT INTO sales VALUES (586,27,8125.00),(587,25,7128.00),(588,57,6760.00),(589,19,5985.00),(590,52,17641.00);
INSERT INTO sales VALUES (591,53,11225.00),(592,22,12200.00),(593,59,16520.00),(594,35,19990.00),(595,42,19741.00);
INSERT INTO sales VALUES (596,19,15000.00),(597,57,19625.00),(598,53,9825.00),(599,24,16745.00),(600,12,14900.00);

CREATE TABLE salesman (
SALESMAN_ID INTEGER NOT NULL,
SALESMAN_NAME varchar(30),
PRIMARY KEY (SALESMAN_ID)
)

INSERT INTO salesman VALUES(11	,'Jonathan Goodwin     ')
INSERT INTO salesman VALUES(12	,'Adam Hughes          ')
INSERT INTO salesman VALUES(13	,'Mark Davenport       ')
INSERT INTO salesman VALUES(14	,'Jamie Shelley        ')
INSERT INTO salesman VALUES(15	,'Ethan Birkenhead     ')
INSERT INTO salesman VALUES(16	,'Liam Alton           ')
INSERT INTO salesman VALUES(17	,'Josh Day             ')
INSERT INTO salesman VALUES(18	,'Sean Mann            ')
INSERT INTO salesman VALUES(19	,'Evan Blake           ')
INSERT INTO salesman VALUES(20	,'Rhys Emsworth        ')
INSERT INTO salesman VALUES(21	,'Kian Wordsworth      ')
INSERT INTO salesman VALUES(22	,'Frederick Kelsey     ')
INSERT INTO salesman VALUES(23	,'Noah Turner          ')
INSERT INTO salesman VALUES(24	,'Callum Bing          ')
INSERT INTO salesman VALUES(25	,'Harri Wilberforce    ')
INSERT INTO salesman VALUES(26	,'Gabriel Gibson       ')
INSERT INTO salesman VALUES(27	,'Richard York         ')
INSERT INTO salesman VALUES(28	,'Tobias Stratford     ')
INSERT INTO salesman VALUES(29	,'Will Kirby           ')
INSERT INTO salesman VALUES(30	,'Bradley Wright       ')
INSERT INTO salesman VALUES(31	,'Eli Willoughby       ')
INSERT INTO salesman VALUES(32	,'Patrick Riley        ')
INSERT INTO salesman VALUES(33	,'Kieran Freeman       ')
INSERT INTO salesman VALUES(34	,'Toby Scott           ')
INSERT INTO salesman VALUES(35	,'Elliot Clapham       ')
INSERT INTO salesman VALUES(36	,'Lewis Moss           ')
INSERT INTO salesman VALUES(37	,'Joshua Atterton      ')
INSERT INTO salesman VALUES(38	,'Jonathan Reynolds    ')
INSERT INTO salesman VALUES(39	,'David Hill           ')
INSERT INTO salesman VALUES(40	,'Aidan Yeardley       ')
INSERT INTO salesman VALUES(41	,'Dan Astley           ')
INSERT INTO salesman VALUES(42	,'Finlay Dalton        ')
INSERT INTO salesman VALUES(43	,'Toby Rodney          ')
INSERT INTO salesman VALUES(44	,'Ollie Wheatley       ')
INSERT INTO salesman VALUES(45	,'Sean Spalding        ')
INSERT INTO salesman VALUES(46	,'Jason Wilson         ')
INSERT INTO salesman VALUES(47	,'Christopher Wentworth')
INSERT INTO salesman VALUES(48	,'Cameron Ansley       ')
INSERT INTO salesman VALUES(49	,'Henry Porter         ')
INSERT INTO salesman VALUES(50	,'Ezra Winterbourne    ')
INSERT INTO salesman VALUES(51	,'Rufus Fleming        ')
INSERT INTO salesman VALUES(52	,'Wallace Dempsey      ')
INSERT INTO salesman VALUES(53	,'Dan McKee            ')
INSERT INTO salesman VALUES(54	,'Marion Caldwell      ')
INSERT INTO salesman VALUES(55	,'Morris Phillips      ')
INSERT INTO salesman VALUES(56	,'Chester Chandler     ')
INSERT INTO salesman VALUES(57	,'Cleveland Klein      ')
INSERT INTO salesman VALUES(58	,'Hubert Bean          ')
INSERT INTO salesman VALUES(59	,'Cleveland Hart       ')
INSERT INTO salesman VALUES(60	,'Marion Gregory     ');


select * from sales;
select * from salesman;

--ans
select top 10 SALESMAN_NAME, SUM(sale_amount) from salesman t1,sales t2 where t1.salesman_id=t2.salesman_id 
 group by t2.SALESMAN_ID,SALESMAN_NAME order by SUM(sale_amount) desc

--10. An active customer is simply someone who has bought company's product once before and has returned to make another purchase within 10 days.					
--From the following table, write a SQL query to identify the active customers. Show the list of customer IDs of active customers. Go to the editor					
--Input:					
--Table: orders					
					
--ORDER_ID|CUSTOMER_ID|ITEM_DESC|ORDER_DATE|					
----------|-----------|---------|----------|					
--     101|       2109|juice    |2020-03-03|					
--     102|       2139|chocolate|2019-03-18|					
--     103|       2120|juice    |2019-03-18|					
--...					
--     199|       2130|juice    |2019-03-16|					
--     200|       2117|cake     |2021-03-10|					
					
--Output:					
					
--customer_id|			note - wrong ouput		
-------------|					
--       2103|					
--       2110|					
--       2111|					
--       2112|					
--       2129|					
--       2130|

 --test data

CREATE TABLE order_s (
ORDER_ID INTEGER NOT NULL,
CUSTOMER_ID INTEGER NOT NULL,
ITEM_DESC varchar(30) NOT NULL,
ORDER_DATE date NOT NULL,
PRIMARY KEY (ORDER_ID)
)

INSERT INTO order_s VALUES(101,2109,'juice','2020-03-03');
INSERT INTO order_s VALUES(102,2139,'chocolate','2019-03-18');
INSERT INTO order_s VALUES(103,2120,'juice','2019-03-18');
INSERT INTO order_s VALUES(104,2108,'cookies','2019-03-18');
INSERT INTO order_s VALUES(105,2130,'juice','2020-03-28');
INSERT INTO order_s VALUES(106,2103,'cake','2019-03-29');
INSERT INTO order_s VALUES(107,2122,'cookies','2021-03-07');
INSERT INTO order_s VALUES(108,2125,'cake','2021-03-13');
INSERT INTO order_s VALUES(109,2139,'cake','2019-03-30');
INSERT INTO order_s VALUES(110,2141,'cookies','2019-03-17');
INSERT INTO order_s VALUES(111,2116,'cake','2020-03-31');
INSERT INTO order_s VALUES(112,2128,'cake','2021-03-04');
INSERT INTO order_s VALUES(113,2146,'chocolate','2021-03-04');
INSERT INTO order_s VALUES(114,2119,'cookies','2020-03-28');
INSERT INTO order_s VALUES(115,2142,'cake','2019-03-09');
INSERT INTO order_s VALUES(116,2122,'cake','2019-03-06');
INSERT INTO order_s VALUES(117,2128,'chocolate','2019-03-24');
INSERT INTO order_s VALUES(118,2112,'cookies','2019-03-24');
INSERT INTO order_s VALUES(119,2149,'cookies','2020-03-29');
INSERT INTO order_s VALUES(120,2100,'cookies','2021-03-18');
INSERT INTO order_s VALUES(121,2130,'juice','2021-03-16');
INSERT INTO order_s VALUES(122,2103,'juice','2019-03-31');
INSERT INTO order_s VALUES(123,2112,'cookies','2019-03-23');
INSERT INTO order_s VALUES(124,2102,'cake','2020-03-25');
INSERT INTO order_s VALUES(125,2120,'chocolate','2020-03-21');
INSERT INTO order_s VALUES(126,2109,'cake','2019-03-22');
INSERT INTO order_s VALUES(127,2101,'juice','2021-03-01');
INSERT INTO order_s VALUES(128,2138,'juice','2019-03-19');
INSERT INTO order_s VALUES(129,2100,'juice','2019-03-29');
INSERT INTO order_s VALUES(130,2129,'juice','2021-03-02');
INSERT INTO order_s VALUES(131,2123,'juice','2020-03-31');
INSERT INTO order_s VALUES(132,2104,'chocolate','2020-03-31');
INSERT INTO order_s VALUES(133,2110,'cake','2021-03-13');
INSERT INTO order_s VALUES(134,2143,'cake','2019-03-27');
INSERT INTO order_s VALUES(135,2130,'juice','2019-03-12');
INSERT INTO order_s VALUES(136,2128,'juice','2020-03-28');
INSERT INTO order_s VALUES(137,2133,'cookies','2019-03-21');
INSERT INTO order_s VALUES(138,2150,'cookies','2019-03-20');
INSERT INTO order_s VALUES(139,2120,'juice','2020-03-27');
INSERT INTO order_s VALUES(140,2109,'cake','2021-03-02');
INSERT INTO order_s VALUES(141,2110,'cake','2021-03-13');
INSERT INTO order_s VALUES(142,2140,'juice','2019-03-09');
INSERT INTO order_s VALUES(143,2112,'cookies','2021-03-04');
INSERT INTO order_s VALUES(144,2117,'chocolate','2019-03-19');
INSERT INTO order_s VALUES(145,2137,'cookies','2020-03-23');
INSERT INTO order_s VALUES(146,2130,'cake','2021-03-09');
INSERT INTO order_s VALUES(147,2133,'cake','2020-03-08');
INSERT INTO order_s VALUES(148,2143,'juice','2019-03-11');
INSERT INTO order_s VALUES(149,2111,'chocolate','2020-03-23');
INSERT INTO order_s VALUES(150,2150,'cookies','2021-03-04');
INSERT INTO order_s VALUES(151,2131,'cake','2020-03-10');
INSERT INTO order_s VALUES(152,2140,'chocolate','2019-03-17');
INSERT INTO order_s VALUES(153,2147,'cookies','2020-03-22');
INSERT INTO order_s VALUES(154,2119,'chocolate','2019-03-15');
INSERT INTO order_s VALUES(155,2116,'juice','2021-03-12');
INSERT INTO order_s VALUES(156,2141,'juice','2021-03-14');
INSERT INTO order_s VALUES(157,2143,'cake','2019-03-16');
INSERT INTO order_s VALUES(158,2105,'cake','2020-03-21');
INSERT INTO order_s VALUES(159,2149,'chocolate','2019-03-11');
INSERT INTO order_s VALUES(160,2117,'cookies','2020-03-22');
INSERT INTO order_s VALUES(161,2150,'cookies','2020-03-21');
INSERT INTO order_s VALUES(162,2134,'cake','2019-03-08');
INSERT INTO order_s VALUES(163,2133,'cookies','2019-03-26');
INSERT INTO order_s VALUES(164,2127,'juice','2019-03-27');
INSERT INTO order_s VALUES(165,2101,'juice','2019-03-26');
INSERT INTO order_s VALUES(166,2137,'chocolate','2021-03-12');
INSERT INTO order_s VALUES(167,2113,'chocolate','2019-03-21');
INSERT INTO order_s VALUES(168,2141,'cake','2019-03-21');
INSERT INTO order_s VALUES(169,2112,'chocolate','2021-03-14');
INSERT INTO order_s VALUES(170,2118,'juice','2020-03-30');
INSERT INTO order_s VALUES(171,2111,'juice','2019-03-19');
INSERT INTO order_s VALUES(172,2146,'chocolate','2021-03-13');
INSERT INTO order_s VALUES(173,2148,'cookies','2021-03-14');
INSERT INTO order_s VALUES(174,2100,'cookies','2021-03-13');
INSERT INTO order_s VALUES(175,2105,'cookies','2019-03-05');
INSERT INTO order_s VALUES(176,2129,'juice','2021-03-02');
INSERT INTO order_s VALUES(177,2121,'juice','2019-03-16');
INSERT INTO order_s VALUES(178,2117,'cake','2020-03-11');
INSERT INTO order_s VALUES(179,2133,'juice','2020-03-12');
INSERT INTO order_s VALUES(180,2124,'cake','2019-03-31');
INSERT INTO order_s VALUES(181,2145,'cake','2021-03-07');
INSERT INTO order_s VALUES(182,2105,'cookies','2019-03-09');
INSERT INTO order_s VALUES(183,2131,'juice','2019-03-09');
INSERT INTO order_s VALUES(184,2114,'chocolate','2020-03-31');
INSERT INTO order_s VALUES(185,2120,'juice','2021-03-06');
INSERT INTO order_s VALUES(186,2130,'juice','2021-03-06');
INSERT INTO order_s VALUES(187,2141,'chocolate','2019-03-11');
INSERT INTO order_s VALUES(188,2147,'cake','2021-03-14');
INSERT INTO order_s VALUES(189,2118,'juice','2019-03-15');
INSERT INTO order_s VALUES(190,2136,'chocolate','2020-03-22');
INSERT INTO order_s VALUES(191,2132,'cake','2021-03-06');
INSERT INTO order_s VALUES(192,2137,'chocolate','2019-03-31');
INSERT INTO order_s VALUES(193,2107,'cake','2021-03-01');
INSERT INTO order_s VALUES(194,2111,'chocolate','2019-03-18');
INSERT INTO order_s VALUES(195,2100,'cake','2019-03-07');
INSERT INTO order_s VALUES(196,2106,'juice','2020-03-21');
INSERT INTO order_s VALUES(197,2114,'cookies','2019-03-25');
INSERT INTO order_s VALUES(198,2110,'cake','2019-03-27');
INSERT INTO order_s VALUES(199,2130,'juice','2019-03-16');
INSERT INTO order_s VALUES(200,2117,'cake','2021-03-10');
SELECT * FROM order_s;

select distinct customer_id from order_s

--ans:

select distinct t1.CUSTOMER_ID from order_s t1 inner join order_s t2 
on t1.CUSTOMER_ID=t2.CUSTOMER_ID and DATEDIFF(dd,t1.ORDER_DATE,t2.ORDER_DATE) between 0 and 10 and (t1.order_id!=t2.order_id)
order by t1.CUSTOMER_ID

--11. From the following table, write a SQL query to convert negative numbers to positive and vice verse. Return the number. Go to the editor					
--Input:					
--Table name: tablefortest	

--srno|pos_neg_val|					
------|-----------|					
--   1|         56|					
--   2|        -74|					
--   3|         15|					
--   4|        -51|					
--   5|         -9|					
--   6|         32|					
					
--Output:					
					
--srno|pos_neg_val|converted_signed_value|					
------|-----------|----------------------|					
--   1|         56|                   -56|					
--   2|        -74|                    74|					
--   3|         15|                   -15|					
--   4|        -51|                    51|					
--   5|         -9|                     9|					
--   6|         32|                   -32|


--test data
CREATE TABLE tablefortest(srno int,  pos_neg_val int);
INSERT INTO tablefortest VALUES (1, 56);
INSERT INTO tablefortest VALUES (2, -74);
INSERT INTO tablefortest VALUES (3, 15);
INSERT INTO tablefortest VALUES (4, -51);
INSERT INTO tablefortest VALUES (5, -9);
INSERT INTO tablefortest VALUES (6, 32);
select * from tablefortest;

--ans
SELECT srno,pos_neg_val,-1 *(pos_neg_val) AS converted_signed_value 
FROM tablefortest;

--12. From the following table, write a SQL query to find the century of a given date. Return the century. Go to the editor					
--Input:					
--Table name: tablefortest					
					
--ID|date_of_birth|					
----|-------------|					
-- 1|   1907-08-15|					
-- 2|   1883-06-27|					
-- 3|   1900-01-01|					
-- 4|   1901-01-01|					
-- 5|   2005-09-01|					
-- 6|   1775-11-23|					
-- 7|   1800-01-01|					
					
--Output:					
					
--id|date_of_birth|Century|					
----|-------------|-------|					
-- 1|   1907-08-15|   20  |					
-- 2|   1883-06-27|   19  |					
-- 3|   1900-01-01|   19  |					
-- 4|   1901-01-01|   20  |					
-- 5|   2005-09-01|   21  |					
-- 6|   1775-11-23|   18  |					
-- 7|   1800-01centuary_table-01|   18  |

--test data

CREATE TABLE centuary_table(ID int,  date_of_birth date);
INSERT INTO centuary_table VALUES (1, '1907-08-15');
INSERT INTO centuary_table VALUES (2, '1883-06-27');
INSERT INTO centuary_table VALUES (3, '1900-01-01');
INSERT INTO centuary_table VALUES (4, '1901-01-01');
INSERT INTO centuary_table VALUES (5, '2005-09-01');
INSERT INTO centuary_table VALUES (6, '1775-11-23');
INSERT INTO centuary_table VALUES (7, '1800-01-01');
SELECT * FROM centuary_table;

--ans:
--sol 1
select id, date_of_birth, substring((str(datepart(YYYY,date_of_birth)-1,4,0)),1,2)+1 as centuary from centuary_table
--sol 2	
select id, date_of_birth, substring((ltrim(str(datepart(YYYY,date_of_birth)-1))),1,2)+1 as centuary from centuary_table

--Q How to convert number into string

select str(1957)     --o/p is '      1957'  add space before number

--solution1 (remove space)
select str(1957,4,0) --o/p is '1957'

--solution2 (remove space)
select ltrim(str(1957))--o/p is '1957'

--13. From the following table, write a SQL query to find the even or odd values. Return "Even" for even number and "Odd" for odd number. Go to the editor					
--Input:					
--Table name: tablefortest					
					
--srno|col_val|					
------|-------|					
--   1|     56|					
--   2|     74|					
--   3|     15|					
--   4|     51|					
--   5|      9|					
--   6|     32|					
					
--Output:					
					
--srno|col_val|Even_Odd|					
------|-------|--------|					
--   1|     56|Even    |					
--   2|     74|Even    |					
--   3|     15|Odd     |					
--   4|     51|Odd     |					
--   5|      9|Odd     |					
--   6|     32|Even    |

--test data

CREATE TABLE Even_odd(srno int,  col_val int);
INSERT INTO Even_odd VALUES (1, 56);
INSERT INTO Even_odd VALUES (2, 74);
INSERT INTO Even_odd VALUES (3, 15);
INSERT INTO Even_odd VALUES (4, 51);
INSERT INTO Even_odd VALUES (5, 9);
INSERT INTO Even_odd VALUES (6, 32);
SELECT * FROM Even_odd;

--sol1
select *, (case 
        when col_val%2=0 then 'Even'
        WHEN col_val%2=1 THEN 'Odd'
	    end) as EvenOrOdd from even_odd

--19. From the following tables, write a SQL query to find the overall rate of execution of orders, which is the number of orders execution divided by the number of orders quote. Return rate_of_execution rounded to 2 decimals places. Go to the editor					
--Input:					
--Table: orders_issued					
					
--distributor_id|company_id|quotation_date|					
----------------|----------|--------------|					
--           101|       202|    2019-11-15|					
--           101|       203|    2019-11-15|					
--           101|       204|    2019-11-15|					
--           102|       202|    2019-11-16|					
--           102|       201|    2019-11-15|					
--           103|       203|    2019-11-17|					
--           103|       202|    2019-11-17|					
--           104|       203|    2019-11-18|					
--           104|       204|    2019-11-18|					
					
--Table: orders_executed					
					
--orders_from|executed_from|executed_date|					
-------------|-------------|-------------|					
--        101|          202|   2019-11-17|					
--        101|          203|   2019-11-17|					
--        102|          202|   2019-11-17|					
--        103|          203|   2019-11-18|					
--        103|          202|   2019-11-19|					
--        104|          203|   2019-11-20|					
					
--Output:					
					
--rate_of_execution|					
-------------------|					
--             0.67|

--test data

CREATE TABLE orders_issued (distributor_id int, company_id int, quotation_date date);
INSERT INTO orders_issued VALUES (101, 202, '2019-11-15');
INSERT INTO orders_issued VALUES (101, 203, '2019-11-15');
INSERT INTO orders_issued VALUES (101, 204, '2019-11-15');
INSERT INTO orders_issued VALUES (102, 202, '2019-11-16');
INSERT INTO orders_issued VALUES (102, 201, '2019-11-15');
INSERT INTO orders_issued VALUES (103, 203, '2019-11-17');
INSERT INTO orders_issued VALUES (103, 202, '2019-11-17');
INSERT INTO orders_issued VALUES (104, 203, '2019-11-18');
INSERT INTO orders_issued VALUES (104, 204, '2019-11-18');

CREATE TABLE orders_executed (orders_from int, executed_from int, executed_date date);
INSERT INTO orders_executed VALUES (101, 202, '2019-11-17');
INSERT INTO orders_executed VALUES (101, 203, '2019-11-17');
INSERT INTO orders_executed VALUES (102, 202, '2019-11-17');
INSERT INTO orders_executed VALUES (103, 203, '2019-11-18');
INSERT INTO orders_executed VALUES (103, 202, '2019-11-19');
INSERT INTO orders_executed VALUES (104, 203, '2019-11-20');

select * from orders_issued;
select * from orders_executed;

--ans
select str((select count(*) from orders_executed)/ cast((select count(*) from orders_issued)as decimal),4,2)

--Note
--round/ str function given output as int when both number is int in division or
--if any one of the number is decimal then output is in decimal

select ROUND(20/cast(9 as decimal),3,0) rate_of_execution;

--20. From the following table write an SQL query to display the records with four or more rows with consecutive match_no's, 
--and the crowd attended more than or equal to 50000 for each match. Return match_no, match_date and audience. Order the result by visit_date, descending.
--Go to the editor					
--Input:					
--table : match_crowd					
					
--match_no|match_date|audience|					
----------|----------|--------|					
--       1|2016-06-11|   75113|					
--       2|2016-06-12|   62343|					
--       3|2016-06-13|   43035|					
--       4|2016-06-14|   55408|					
--       5|2016-06-15|   38742|					
--       6|2016-06-16|   63670|					
--       7|2016-06-17|   73648|					
--       8|2016-06-18|   52409|					
--       9|2016-06-19|   67291|					
--      10|2016-06-20|   49752|					
--      11|2016-06-21|   28840|					
--      12|2016-06-22|   32836|					
--      13|2016-06-23|   44268|		

--Output:					
					
--match_no|match_date|audience|					
----------|----------|--------|					
--       6|2016-06-16|   63670|					
--       7|2016-06-17|   73648|					
--       8|2016-06-18|   52409|					
--       9|2016-06-19|   67291|					


--test data
CREATE TABLE match_crowd (match_no int, match_date date not null unique, audience int);
INSERT INTO match_crowd VALUES ( 1,'2016-06-11',  75113 );
INSERT INTO match_crowd VALUES ( 2,'2016-06-12',  62343 );
INSERT INTO match_crowd VALUES ( 3,'2016-06-13',  43035 );
INSERT INTO match_crowd VALUES ( 4,'2016-06-14',  55408 );
INSERT INTO match_crowd VALUES ( 5,'2016-06-15',  38742 );
INSERT INTO match_crowd VALUES ( 6,'2016-06-16',  63670 );
INSERT INTO match_crowd VALUES ( 7,'2016-06-17',  73648 );
INSERT INTO match_crowd VALUES ( 8,'2016-06-18',  52409 );
INSERT INTO match_crowd VALUES ( 9,'2016-06-19',  67291 );
INSERT INTO match_crowd VALUES (10,'2016-06-20',  49752 );
INSERT INTO match_crowd VALUES (11,'2016-06-21',  28840 );
INSERT INTO match_crowd VALUES (12,'2016-06-22',  32836 );
INSERT INTO match_crowd VALUES (13,'2016-06-23',  44268 );
select * from match_crowd;	

--ans
SELECT DISTINCT m.match_no, m.match_date, m.audience
FROM match_crowd m,
(SELECT m1.match_no AS FROM_ID, m1.match_no+2 AS TO_ID
FROM match_crowd m1, match_crowd m2, match_crowd m3
WHERE m1.match_no+1 = m2.match_no
AND m2.match_no+1 = m3.match_no
AND m1.audience >= 50000
AND m2.audience >= 50000
AND m3.audience >= 50000) m2
WHERE m.match_no BETWEEN m2.FROM_ID AND m2.TO_ID;

--21. From the following table write a SQL query to know the availability of the doctor for consecutive 2 or more days. Return visiting days. Go to the editor					
--Input:					
--Table: dr_clinic					
					
--visiting_date|availability|					
---------------|------------|					
--   2016-06-11|           1|					
--   2016-06-12|           1|					
--   2016-06-13|           0|					
--   2016-06-14|           1|					
--   2016-06-15|           0|					
--   2016-06-16|           0|					
--   2016-06-17|           1|					
--   2016-06-18|           1|					
--   2016-06-19|           1|					
--   2016-06-20|           1|					
--   2016-06-21|           1|					
					
--Output:					
					
--visiting_date|					
---------------|					
--   2016-06-11|					
--   2016-06-12|					
--   2016-06-17|					
--   2016-06-18|					
--   2016-06-19|					
--   2016-06-20|					
--   2016-06-21|  

--test data
CREATE TABLE dr_clinic (visiting_date date primary key, availability int);

INSERT INTO dr_clinic VALUES ('2016-06-11','1');
INSERT INTO dr_clinic VALUES ('2016-06-12','1');
INSERT INTO dr_clinic VALUES ('2016-06-13','0');
INSERT INTO dr_clinic VALUES ('2016-06-14','1');
INSERT INTO dr_clinic VALUES ('2016-06-15','0');
INSERT INTO dr_clinic VALUES ('2016-06-16','0');
INSERT INTO dr_clinic VALUES ('2016-06-17','1');
INSERT INTO dr_clinic VALUES ('2016-06-18','1');
INSERT INTO dr_clinic VALUES ('2016-06-19','1');
INSERT INTO dr_clinic VALUES ('2016-06-20','1');	   
INSERT INTO dr_clinic VALUES ('2016-06-21','1');
select * from dr_clinic

--ans
select DISTINCT t1.visiting_date from dr_clinic t1 join dr_clinic t2 
on t1.availability=1 and t2.availability=1 and abs(datediff(D,t1.visiting_date,t2.visiting_date))=1

--22. From the following tables find those customers who did not make any order to the supplier 'DCX LTD'. Return customers name. Go to the editor
--Input:

--Table: customers

--customer_id|customer_name|customer_city|avg_profit|
-------------|-------------|-------------|----------|
--        101|Liam         |New York     |     25000|
--        102|Josh         |Atlanta      |     22000|
--        103|Sean         |New York     |     27000|
--        104|Evan         |Toronto      |     15000|
--        105|Toby         |Dallas       |     20000|
--Table : supplier

--supplier_id|supplier_name|supplier_city|
-------------|-------------|-------------|
--        501|ABC INC      |Dallas       |
--        502|DCX LTD      |Atlanta      |
--        503|PUC ENT      |New York     |
--        504|JCR INC      |Toronto      |
--Table: orders

--order_id|customer_id|supplier_id|order_date|order_amount|
----------|-----------|-----------|----------|------------|
--     401|        103|        501|2012-03-08|        4500|
--     402|        101|        503|2012-09-15|        3650|
--     403|        102|        503|2012-06-27|        4800|
--     404|        104|        502|2012-06-17|        5600|
--     405|        104|        504|2012-06-22|        6000|
--     406|        105|        502|2012-06-25|        5600|
--Output:

--customer_name|
---------------|
--Liam         |
--Josh         |
--Sean         |
------------------------

--test data

CREATE TABLE customer (customer_id int, customer_name varchar(255), customer_city varchar(255), avg_profit int);
INSERT INTO customer VALUES ('101', 'Liam','New York',25000);
INSERT INTO customer VALUES ('102', 'Josh','Atlanta',22000);
INSERT INTO customer VALUES ('103', 'Sean','New York',27000);
INSERT INTO customer VALUES ('104', 'Evan','Toronto',15000);
INSERT INTO customer VALUES ('105', 'Toby','Dallas',20000);

CREATE TABLE supplier (supplier_id int, supplier_name varchar(255), supplier_city varchar(255));
INSERT INTO supplier  VALUES ('501', 'ABC INC','Dallas');
INSERT INTO supplier  VALUES ('502', 'DCX LTD','Atlanta');
INSERT INTO supplier  VALUES ('503', 'PUC ENT','New York');
INSERT INTO supplier  VALUES ('504', 'JCR INC','Toronto');
	
CREATE TABLE ord (order_id int, customer_id int, supplier_id int, order_date Date, order_amount int);
INSERT INTO ord  VALUES (401, 103,501,'2012-03-08','4500');
INSERT INTO ord  VALUES (402, 101,503,'2012-09-15','3650');
INSERT INTO ord  VALUES (403, 102,503,'2012-06-27','4800');
INSERT INTO ord  VALUES (404, 104,502,'2012-06-17','5600');
INSERT INTO ord  VALUES (405, 104,504,'2012-06-22','6000');
INSERT INTO ord  VALUES (406, 105,502,'2012-06-25','5600');

SELECT * FROM customer;
SELECT * FROM supplier;
SELECT * FROM ord;

--ans

select customer_name from customer c where customer_id not in 
(select customer_id from ord o join supplier s on o.supplier_id=s.supplier_id and supplier_name='DCX LTD')

--23. Table students contain marks of mathematics for several students in a class. It may same marks for more than one student.					
--From the following table write a SQL table to find the highest unique marks a student achieved. Return the marks. Go to the editor					
--Table: students					
					
--student_id|student_name|marks_achieved|					
------------|------------|--------------|					
--         1|Alex        |            87|					
--         2|Jhon        |            92|					
--         3|Pain        |            83|					
--         4|Danny       |            87|					
--         5|Paul        |            92|					
--         6|Rex         |            89|					
--         7|Philip      |            87|					
--         8|Josh        |            83|					
--         9|Evan        |            92|					
--        10|Larry       |            87|					
					
--Output:					
					
--marks|					
-------|					
--   89|	

--test data
CREATE TABLE students(student_id int, student_name varchar(255), marks_achieved int);

INSERT INTO students VALUES(1, 'Alex',87);
INSERT INTO students VALUES(2, 'Jhon',92);
INSERT INTO students VALUES(3, 'Pain',83);
INSERT INTO students VALUES(4, 'Danny',87);
INSERT INTO students VALUES(5, 'Paul',92);
INSERT INTO students VALUES(6, 'Rex',89);
INSERT INTO students VALUES(7, 'Philip',87);
INSERT INTO students VALUES(8, 'Josh',83);
INSERT INTO students VALUES(9, 'Evan',92);
INSERT INTO students VALUES(10, 'Larry',87);
INSERT INTO students VALUES(11, 'Lora',90);


select * from students;

--ans
select max(marks_achieved) from students where marks_achieved in (select marks_achieved from students group by marks_achieved having count(marks_achieved)<2)
	
--24. In a hostel, each room contains two beds. After every 6 months a student have to change their bed with his or her room-mate.					
--From the following tables write a SQL query to find the new beds of the students in the hostel. Return original_bed_id, student_name, bed_id and student_new. Go to the editor					
--Table : bed_info					
					
--bed_id|student_name|					
--------|------------|					
--   101|Alex        |					
--   102|Jhon        |					
--   103|Pain        |					
--   104|Danny       |					
--   105|Paul        |					
--   106|Rex         |					
--   107|Philip      |					
--   108|Josh        |					
--   109|Evan        |					
--   110|Green       |					
					
--Output:					
					
--original_bed_id|student_name|bed_id|student_new|					
-----------------|------------|------|-----------|					
--            102|Jhon        |   101|Jhon       |					
--            101|Alex        |   102|Alex       |					
--            104|Danny       |   103|Danny      |					
--            103|Pain        |   104|Pain       |					
--            106|Rex         |   105|Rex        |					
--            105|Paul        |   106|Paul       |					
--            108|Josh        |   107|Josh       |					
--            107|Philip      |   108|Philip     |					
--            110|Green       |   109|Green      |					
--            109|Evan        |   110|Evan       |					


--test data
CREATE TABLE bed_info(bed_id int, student_name varchar(255));
INSERT INTO bed_info VALUES (101, 'Alex');
INSERT INTO bed_info VALUES (102, 'Jhon');
INSERT INTO bed_info VALUES (103, 'Pain');
INSERT INTO bed_info VALUES (104, 'Danny');
INSERT INTO bed_info VALUES (105, 'Paul');
INSERT INTO bed_info VALUES (106, 'Rex');
INSERT INTO bed_info VALUES (107, 'Philip');
INSERT INTO bed_info VALUES (108, 'Josh');
INSERT INTO bed_info VALUES (109, 'Evan');
INSERT INTO bed_info VALUES (110, 'Green');
select * from bed_info;

--ans
select t1.bed_id as original_bed,t1.student_name as original_student,
case when t1.bed_id%2=0 then t1.bed_id-1
	 when t1.bed_id%2=1 then t1.bed_id+1
end as new_bed
,t1.student_name as new_student 
from bed_info t1 join bed_info t2 on t1.bed_id=t2.bed_id

--25. From the following table, write a SQL query to find the first login date for each customer. Return customer id, login date. Go to the editor					
--Input:					
--Table: bank_trans					
					
--trans_id|customer_id|login_date|					
----------|-----------|----------|					
--     101|       3002|2019-09-01|					
--     101|       3002|2019-08-01|					
--     102|       3003|2018-09-13|					
--     102|       3002|2018-07-24|					
--     103|       3001|2019-09-25|					
--     102|       3004|2017-09-05|					
					
--Output:					
					
--customer_id|first_login|					
-------------|-----------|					
--       3001| 2019-09-25|					
--       3002| 2018-07-24|					
--       3003| 2018-09-13|					
--       3004| 2017-09-05|

--test data
CREATE TABLE bank_trans(trans_id int, customer_id int, login_date date);
INSERT INTO bank_trans VALUES (101, 3002, '2019-09-01');
INSERT INTO bank_trans VALUES (101, 3002, '2019-08-01');
INSERT INTO bank_trans VALUES (102, 3003, '2018-09-13');
INSERT INTO bank_trans VALUES (102, 3002, '2018-07-24');
INSERT INTO bank_trans VALUES (103, 3001, '2019-09-25');
INSERT INTO bank_trans VALUES (102, 3004, '2017-09-05');
SELECT * FROM bank_trans order by customer_id;

--ans
select customer_id,min(login_date) from bank_trans group by customer_id

--26. From the following table, write a SQL query to find those salespersons whose commission is less than ten thousand. Return salesperson name, commission. Go to the editor
--Input:

--Table: salemast

--salesman_id|salesman_name|yearly_sale|
-------------|-------------|-----------|
--        101|Adam         |     250000|
--        103|Mark         |     100000|
--        104|Liam         |     200000|
--        102|Evan         |     150000|
--        105|Blake        |     275000|
--        106|Noah         |      50000|
--Table : commision

--salesman_id|commision_amt|
-------------|-------------|
--        101|        10000|
--        103|         4000|
--        104|         8000|
--        102|         6000|
--        105|        11000|
--Output:

--salesman_name|commision_amt|
---------------|-------------|
--Mark         |         4000|
--Liam         |         8000|
--Evan         |         6000|

--test data
CREATE TABLE salesmast(salesman_id int, salesman_name varchar(255), yearly_sale int);
INSERT INTO salesmast VALUES (101, 'Adam', 250000);
INSERT INTO salesmast VALUES (103, 'Mark', 100000);
INSERT INTO salesmast VALUES (104, 'Liam', 200000);
INSERT INTO salesmast VALUES (102, 'Evan', 150000);
INSERT INTO salesmast VALUES (105, 'Blake', 275000);
INSERT INTO salesmast VALUES (106, 'Noah', 50000);
SELECT * FROM  salesmast;
CREATE TABLE commision (salesman_id int, commision_amt int);
INSERT INTO commision VALUES (101, 10000);
INSERT INTO commision VALUES (103, 4000);
INSERT INTO commision VALUES (104, 8000);
INSERT INTO commision VALUES (102, 6000);
INSERT INTO commision VALUES (105, 11000);
SELECT * FROM  commision;

--ans
select salesman_name ,commision_amt from salesmast s,commision c 
where s.salesman_id=c.salesman_id and commision_amt<10000

--27. From the following table write a SQL query to find those distributors who purchased all types of item from the company. Return distributors ids. Go to the editor
--Input:
--
--Table: items
--
--item_code|item_name|
-----------|---------|
--    10091|juice    |
--    10092|chocolate|
--    10093|cookies  |
--    10094|cake     |
--Table : orders
--
--order_id|distributor_id|item_ordered|item_quantity|
----------|--------------|------------|-------------|
--       1|           501|       10091|          250|
--       2|           502|       10093|          100|
--       3|           503|       10091|          200|
--       4|           502|       10091|          150|
--       5|           502|       10092|          300|
--       6|           504|       10094|          200|
--       7|           503|       10093|          250|
--       8|           503|       10092|          250|
--       9|           501|       10094|          180|
--      10|           503|       10094|          350|
--Output:
--
--distributor_id|
----------------|
--           503|

--test data
CREATE TABLE items (item_code int not null unique, item_name varchar(255));
INSERT INTO items VALUES (10091,'juice');
INSERT INTO items VALUES (10092,'chocolate');
INSERT INTO items VALUES (10093,'cookies');
INSERT INTO items VALUES (10094,'cake');

CREATE TABLE orders1 (order_id int, distributor_id int, item_ordered int, item_quantity int,
foreign key(item_ordered) references items(item_code));
INSERT INTO orders1 VALUES (1,501,10091,250);
INSERT INTO orders1 VALUES (2,502,10093,100);
INSERT INTO orders1 VALUES (3,503,10091,200);
INSERT INTO orders1 VALUES (4,502,10091,150);
INSERT INTO orders1 VALUES (5,502,10092,300);
INSERT INTO orders1 VALUES (6,504,10094,200);
INSERT INTO orders1 VALUES (7,503,10093,250);
INSERT INTO orders1 VALUES (8,503,10092,250);
INSERT INTO orders1 VALUES (9,501,10094,180);
INSERT INTO orders1 VALUES (10,503,10094,350);

select * from items;
select * from orders1;
--ans

select distributor_id from orders1 group by distributor_id
having COUNT(distributor_id) = (select count(item_code) from items)

--32. From the following tables write a SQL query to display those managers who have average experience for each scheme. Go to the editor					
--Input:					
--Table: managing_body					
					
--manager_id|manager_name|running_years|					
------------|------------|-------------|					
--        51|James       |            5|					
--        52|Cork        |            3|					
--        53|Paul        |            4|					
--        54|Adam        |            3|					
--        55|Hense       |            4|					
--        56|Peter       |            2|					
					
--Table : scheme					
					
--scheme_code|scheme_manager_id|					
-------------|-----------------|					
--       1001|               51|					
--       1001|               53|					
--       1001|               54|					
--       1001|               56|					
--       1002|               51|					
--       1002|               55|					
--       1003|               51|					
--       1004|               52|					
					
--Output:					
					
--scheme_code|Average year of experience|					
-------------|--------------------------|					
--       1001|                      3.50|					
--       1002|                      4.50|					
--       1003|                      5.00|					
--       1004|                      3.00|

--test data
CREATE TABLE managing_body (manager_id int NOT NULL UNIQUE, manager_name varchar(255), running_years int);

alter table managing_body alter column running_years int

INSERT INTO managing_body VALUES(51,'James',5);
INSERT INTO managing_body VALUES(52,'Cork',3);
INSERT INTO managing_body VALUES(53,'Paul',4);
INSERT INTO managing_body VALUES(54,'Adam',3);
INSERT INTO managing_body VALUES(55,'Hense',4);
INSERT INTO managing_body VALUES(56,'Peter',2);

CREATE TABLE scheme (scheme_code int NOT NULL , scheme_manager_id int NOT NULL, 
PRIMARY KEY(scheme_code,scheme_manager_id));
INSERT INTO scheme VALUES(1001,	51);
INSERT INTO scheme VALUES(1001,	53);
INSERT INTO scheme VALUES(1001,	54);
INSERT INTO scheme VALUES(1001,	56);
INSERT INTO scheme VALUES(1002,	51);
INSERT INTO scheme VALUES(1002,	55);
INSERT INTO scheme VALUES(1003,	51);
INSERT INTO scheme VALUES(1004,	52);

select * from managing_body;
select * from scheme;

--ans
select scheme_code, avg(running_years) as avg_exp from scheme join managing_body on manager_id=scheme_manager_id group by scheme_code

select scheme_code, avg(cast (running_years as decimal)) as avg_exp from scheme join managing_body on manager_id=scheme_manager_id group by scheme_code

--Note: str syntax
--str("any expression/value to be converted in string","Max Total length of ouput including '.' if any","digit after decimal")

select scheme_code, str(avg(cast (running_years as decimal)),10,1) as avg_exp from scheme join managing_body on manager_id=scheme_manager_id group by scheme_code


--34. From the following tables write a SQL query to find those experienced manager who execute the schemes. 
--Return scheme code and scheme manager ID
--OUTPUT:					
					
--SCHEME_CODE|SCHEME_MANAGER_ID|					
-------------|-----------------|					
--       1001|               51|					
--       1002|               51|					
--       1003|               51|					
--       1004|               52|	

--test data
--same above table

--ans

SELECT scheme_code, p.scheme_manager_id FROM scheme p JOIN managing_body e
ON p.scheme_manager_id = e.manager_id
and (scheme_code,e.running_years) in 
(SELECT scheme_code,MAX(running_years)
FROM scheme p JOIN managing_body e
ON p.scheme_manager_id = e.manager_id
GROUP BY scheme_code);


SELECT scheme_code, p.scheme_manager_id FROM scheme p JOIN managing_body e
ON p.scheme_manager_id = e.manager_id
and (scheme_code) in 
(SELECT scheme_code
FROM scheme p JOIN managing_body e
ON p.scheme_manager_id = e.manager_id
GROUP BY scheme_code)
and (running_years) in 
(SELECT max(running_years)
FROM scheme p JOIN managing_body e
ON p.scheme_manager_id = e.manager_id
GROUP BY scheme_code) group by scheme_code;

