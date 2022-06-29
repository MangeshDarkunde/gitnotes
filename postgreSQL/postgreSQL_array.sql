--Array

--Every data type has its own companion array type 
--e.g., integer has an integer[] array type, character has character[] array type, etc. 
--In case you define your own data type, 
--PostgreSQL creates a corresponding array type in the background for you.

--PostgreSQL allows you to define a column to be an array of any valid data type including built-in type, 
--user-defined type or enumerated type.

--The following CREATE TABLE statement creates the contacts table with the phones column is defined as an array of text.

create table contacts(id serial primary key ,name varchar(10),phones varchar[]);

alter sequence contacts_id_seq restart with 11 increment by 1;


delete from contacts where id=1;

select * from contacts;

--The phones column is a one-dimensional array that holds various phone numbers that a contact may have.

--Insert PostgreSQL array values
--The following statement inserts a new contact into the contacts table.

INSERT INTO contacts (name, phones) VALUES('John Doe',ARRAY [ '(91)-589-5846','(91)-589-5555' ]);

INSERT INTO contacts (name, phones) VALUES('Simion Kate', Array[ '(91)-589-5847','(91)-589-5567' ]);

select * from contacts
--We used the ARRAY constructor to construct an array and insert it into the contacts table. 
--You can also use curly braces as follows:

INSERT INTO contacts (name, phones)VALUES('Lily Bush','{"(91)-589-5841"}'),
      ('William Gate','{"(91)-589-5842","(91)-589-58423"}');

INSERT INTO contacts (name,phones) VALUES ('Shuan Mike','{"(91)-589-6789"}')


--The statement above inserts two rows into the contacts table. 
--Notice that when you use curly braces, you use single quotes ' to wrap the array and 
--and double quotes " to wrap text array items.

--Query array data
--You use the SELECT statement to query array data as follows:

SELECT * FROM contacts;

--postgresql array query data
--We access array elements using the subscript within square brackets [1,2]. 
--By default, PostgreSQL uses one-based numbering for array elements. 
--It means the first array element starts with number 1. 

--Example:
--array phone =[1223,34456,7891]
--phone =[1,2,3]
--phone [3] = 7891

--Suppose, we want to get the contact’s name and the first phone number, we use the following query:

select *,phones[3] from contacts;

--postgresql array query array item
--We can use array element in the WHERE clause as the condition to filter the rows. 
--For example, to find out who has the phone number (91)-589-58423 as the second phone number, we use the following query.
select * from contacts;
SELECT * FROM contacts WHERE phones [2] = '(91)-589-58423';
select * from contacts where phones[3] ='9876543210'

--postgresql array element in where clause
--Modifying PostgreSQL array
--PostgreSQL allows you to update each element of an array or  the whole array. The following statement updates the second phone number of William Gate.
select * from contacts 

UPDATE contacts SET phones [3] = '(91)-222-1111' WHERE ID = 12;


SELECT id,name,phones [ 2 ] FROM contacts WHERE id = 12;

--postgresql array update
--The following statement updates an array as a whole.

UPDATE contacts SET phones = '{"9383938393"}' WHERE id =15;

--We verify the update using the following statement.

SELECT name,phones FROM contacts WHERE id = 15;

--postgresql array select
--Search in PostgreSQL Array
--Suppose, we want to know who has the phone number (91)-589-5555 regardless of position of the phone number in the phones array, we use ANY() function as follows:

SELECT * FROM contacts WHERE '(91)-589-5555' = ANY (phones);

select * from contacts where '0123456789'= any (phones)

--postgresql array any function
--Expand Arrays
--PostgreSQL provides the unnest() function to expand an array to a list of rows. 
--For example,  the following query expands all phone numbers of the phones array.

SELECT *,unnest(phones) FROM contacts;

--postgresql array unnest function

select * from contacts

delete from contacts where phones [3] ='(91)-222-1111'

delete from contacts where id =3

--****************************************************************************************************************************************************
