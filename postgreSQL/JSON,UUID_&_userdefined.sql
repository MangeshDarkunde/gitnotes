****************************************************************************************************************************************************
--Data Types 
--JSON
--JSON stands for JavaScript Object Notation. 
--JSON is an open standard format that consists of key-value pairs.
--The main usage of JSON is to transport data between a server and a web application. 
--Unlike other formats, JSON is human-readable text.

CREATE TABLE orders (
	id serial NOT NULL PRIMARY KEY,
	information json NOT NULL
);

select * from orders;
--in hstore we can store key: value but in json we can store key:value /key:{key:value,key:value}
--single row 
insert into orders (information) values ('{"customer": "John Doe","items":{"product": "beer","qty":6}}');

--Multiple row 
INSERT INTO orders (information)
VALUES('{ "customer": "Lily Bush", "items": {"product": "Diaper","qty": 24}}'),
      ('{ "customer": "Josh William", "items": {"product": "Toy Car","qty": 1}}'),
      ('{ "customer": "Mary Clark", "items": {"product": "Toy Train","qty": 2}}');

--Querying JSON data
--To query JSON data, you use the SELECT statement, which is similar to querying other native data types:
select * from orders

--alter sequence orders_id_seq restart with 11 increment by 1;

SELECT information FROM orders;

--PostgreSQL returns a result set in the form of JSON.
--PostgreSQL provides two native operators -> and ->> to help you query JSON data.
--•	The operator -> returns JSON object field by key.
--•	The operator ->> returns JSON object field by text.

--The following query uses the operator -> to get all customers in form of JSON:
SELECT information -> 'customer' AS customer FROM orders;
SELECT information -> 'items' AS customer FROM orders;
 
--And the following query uses operator ->> to get all customers in form of text:

SELECT information ->> 'customer' AS customer FROM orders;
 
--Because -> operator returns a JSON object, you can change it with the operator ->> to retrieve a specific node. 
--For example, the following statement returns all products sold:
select * from orders
SELECT *,information -> 'items' ->> 'product' as product FROM orders ORDER BY product;

 
--First  information -> 'items' returns items as JSON objects. 
--And then information->'items'->>'product' returns all products as text.


--Use JSON operator in WHERE clause
--We can use the JSON operators in WHERE clause to filter the returning rows. 
--For example, to find out who bought Diaper, we use the following query:

SELECT information ->> 'customer' AS customer FROM orders WHERE information -> 'items' ->> 'product' = 'Diaper';

--To find out who bought two products at a time, we use the following query and we can also apply multiple condition

SELECT  information ->> 'customer' AS customer,information -> 'items' ->> 'product' AS product FROM orders
WHERE cast (information -> 'items' ->> 'qty' as integer )>= 2 and information->'items' ->> 'product' ='beer';

 
--Notice that we used the type cast to convert the qty field into INTEGER type and compare it with two.
--Apply aggregate functions to JSON data
--We can apply aggregate functions such as MIN, MAX, AVERAGE, SUM, etc., to JSON data.
--For example, the following statement returns minimum quantity, maximum quantity, average quantity and the total quantity of products sold.

SELECT 
   MIN (CAST (information -> 'items' ->> 'qty' AS INTEGER)),
   MAX (CAST (information -> 'items' ->> 'qty' AS INTEGER)),
   SUM (CAST (information -> 'items' ->> 'qty' AS INTEGER)),
   AVG (CAST (information -> 'items' ->> 'qty' AS float))
FROM orders;

select * from orders;

--PostgreSQL JSON functions
--PostgreSQL provides us with some functions to help you process JSON data.

--json_each function
--The json_each() function allows us to expand the outermost JSON object into a set of key-value pairs. 
select * from orders

Select json_each (information->'items') from orders;
 
--If you want to get a set of key-value pairs as text, you use the json_each_text() function instead.
--json_object_keys function
SELECT json_each_text (information->'items') FROM orders;
--To get a set of keys in the outermost JSON object, you use the json_object_keys() function. 
--The following query returns all keys of the nested items object in the info column
select * from orders
SELECT json_object_keys (information) FROM orders;
SELECT json_object_keys (information->'items') FROM orders;


--json_typeof function
--The json_typeof() function returns type of the outermost JSON value as a string.
--It can be number, boolean, null, object, array, and string.

--The following query return the data type of the JSON Object:
select * from orders
SELECT json_typeof (information->'items') FROM orders;

 
--The following query returns the data type of the qty field of the nested items strings.

SELECT json_typeof (information->'items'->'product') FROM orders;
***********************************************************************************************************************************************
--UUID Data Type

--UUID stands for Universal Unique Identifier defined by RFC 4122 and other related standards. 
--A UUID value is 128-bit quantity generated by an algorithm that make 
--it unique in the known universe using the same algorithm. 

--The following shows some examples of the UUID values:
40e6215d-b5c6-4896-987c-f30f3678f608
6ecd8c99-4036-403d-bf84-cf8400f67836
3f333df6-90a4-4fda-8dd3-9485d27cee36

--A UUID is a sequence of 32 digits of hexadecimal digits represented in groups separated by hyphens.
--Because of its uniqueness feature, you often found UUID in the distributed systems 
--because it guarantees a better uniqueness than the SERIAL data type 
--which generates only unique values within a single database.

--Generating UUID values
--PostgreSQL allows you store and compare UUID values but it does not include functions for generating 
--the UUID values in its core.

--Instead, it relies on the third-party modules that provide specific algorithms to generate UUIDs. 
--For example the uuid-ossp module provides some handy functions that implement standard algorithms 
--for generating UUIDs.

--To install the uuid-ossp module, you use the CREATE EXTENSION statement as follows:

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--To generate the UUID values based on the combination of computer’s MAC address, 
--current timestamp, and a random value, you use the uuid_generate_v1() function:

SELECT uuid_generate_v1(); --"cf5a283e-8556-11ec-a797-7c70db33ba11","d941a82c-8556-11ec-a798-7c70db33ba11"
--Code language: SQL (Structured Query Language) (sql)

--If you want to generate a UUID value solely based on random numbers, 
--you can use the uuid_generate_v4() function. For example:

SELECT uuid_generate_v4(); --"6e6f76fc-9329-4950-817e-374d778262e8","b20d2f37-2e10-4fd9-9fba-d63659338692"

--Creating a table with UUID column
--We will create a table whose primary key is UUID data type. 
--In addition, the values of the primary key column will be generated automatically 
--using the uuid_generate_v4() function.

--Create the contacts table using the following statement:

CREATE TABLE contacts1 (
    contact_id uuid DEFAULT uuid_generate_v4 (),
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    phone VARCHAR,
    PRIMARY KEY (contact_id)
);

--In this statement, the data type of the contact_id column is UUID. 
--The contact_id column has a default values provided by the uuid_generate_v4() function,
--therefore, whenever you insert new row without specifying the value for the contact_id column, 
--PostgreSQL will call the uuid_generate_v4() function to generate the value for it.

--inserting some data into the contacts table:
select * from contacts1 
INSERT INTO contacts1 (first_name,last_name,email,phone)
VALUES('simon','kate','simon.kate@mexample.com','987654321'),
    ('Jane','Smith','jane.smith@example.com','408-237-2344'),
    ('Alex','Smith','alex.smith@example.com','408-237-2343');

SELECT * FROM contacts1 where contact_id='0dc3cd5b-b5c9-462d-b831-46aa2546969a'
*****************************************************************************************************************************************************
--user-defined data type using CREATE DOMAIN and CREATE TYPE statements.

--Besides built-in data types, PostgreSQL allows you to create user-defined data types 
--through the following statements:
--1.CREATE DOMAIN :creates a user-defined data type with constraints such as NOT NULL, CHECK, etc.
--2.CREATE TYPE : creates a composite type used in stored procedures as the data types of returned values.

--CREATE DOMAIN statement
--A domain is a data type with optional constraints e.g.,NOT NULL and CHECK. 
--A domain has a unique name within the schema scope.
--Domains are useful for centralizing the management of fields with common constraints. 
--For example, some tables may have the same column that do not accept NULL and spaces.

--The following statement create a table named mailing_list:

CREATE TABLE mailing_list (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    CHECK (
        first_name !~ '\s'
        AND last_name !~ '\s'
    ));

	select * from mailing_list

Drop table mailing_list
--In this table, both first_name and last_name columns do not accept null and spaces. 
--Instead of defining the CHECK constraint,
--you can create a contact_name domain and reuse it in multiple columns.

--The following statement uses the CREATE DOMAIN to create 
--a new domain called contact_name with the VARCHAR datatype and do not accept NULL and spaces:

CREATE DOMAIN contact_name AS VARCHAR NOT NULL CHECK (value !~ '\s');

--And you use contact_name as the datatype of the first_name and last_name columns as a 
--regular built-in type:

CREATE TABLE mailing_list (
    id serial PRIMARY KEY,
    first_name contact_name,
    last_name contact_name,
    email VARCHAR NOT NULL
);

select * from mailing_list
--The following statement inserts a new row into the mailing_list table:

INSERT INTO mailing_list (first_name, last_name, email)
VALUES('JameV','Doe','jame.doe@example.com');

--issued the following error because the first name contains a space:

--ERROR:  value for domain contact_name violates check constraint "contact_name_check"

--The following statement works because it does not violate any constraints of the contact_name type:

INSERT INTO mailing_list (first_name, last_name, email)
VALUES('Jane','Doe','jane.doe@example.com');

--To change or remove a domain, you use the ALTER DOMAIN or DROP DOMAIN respectively.

--CREATE TYPE
--The CREATE TYPE statement allows you to create a composite type, 
--which can be used as the return type of a function.

--Suppose you want to have a function that returns several values: film_id, title, and release_year. 
--The first step is to create a type e.g., film_summary as follows:

CREATE TYPE film_summary AS (
    film_id INT,
    title VARCHAR,
    release_year SMALLINT
); 

--Second, use the film_summary data type as the return type of a function:

CREATE OR REPLACE FUNCTION get_film_summary (f_id INT) 
    RETURNS film_summary AS 
$$ 
SELECT
    film_id,
    title,
    release_year
FROM
    film
WHERE
    film_id = f_id ; 
$$ 
LANGUAGE SQL; 

--call get_ functionfilm_summary function
SELECT * FROM get_film_summary (40);

--user-defined type example
--To change a user-defined type, you use the ALTER TYPE statement. 
--To remove a user-defined type, you use the DROP TYPE statement.
