--Hstore Datatype

--Hstore module implements the hstore data type for storing key value pairs in a single value

--Hstore data type is very useful in many cases such as semi structured data or rows

--key and values are text strings

--Enable postgre sql hstore extension before working with hstore data type

create extension hstore;

create table books (
	id serial primary key, 
	title varchar(250),
    attri hstore)
	
select * from books
	
--insert data into hstore column by using statement

insert into books (title,attri) values
('scodeen postgre SQL Tutorial',
 '"Total Papers" => "243",
 "Publisher" => "scodeen global",
 "language" => "english",
 "ISBN-13" => "789-1449546000",
 "weight" => "2.5kg"');

insert into books (title,attri) values
('scodeen postgre SQL Tutorial',
 '"Total Papers" => "20",
 "Publisher" => "Chetan Bhagat",
 "language" => "English",
 "ISBN-13" => "123-6552556250",
 "weight" => "2.3kg"');
 
update books set title='Scooden unix Tutorial' where id=2;


select * from books

select attri from books;

--Hstore provides the -> operator to query the value of specific key from hstore column

--In Hstore data type keys and its values are case sensitive e.g Publisher <> publisher,PUBLISHER,etc.

select id,attri-> 'Publisher' as PublisherName,attri -> 'weight' as booksweight from books where attri -> 'Publisher' = 'Chetan Bhagat'

--We can add new key-value pair inside hstore column by using update statements

update books set attri = attri || '"shipping" => "Yes"' hstore where id =1;

update books set attri = attri || '"shipping" => "No"' where id =2;

--we can remove key-value pair from hstore column by using  update and delete statements

update books set attri = delete (attri,'shipping') where id =2

select * from books;

--If we want to access specific key in hstore column using ? operator in where clause

select title,attri -> 'Publisher' as PublisherName from books where attri ? 'Publisher'

--If we want access a perticular column using key-value pair filter

select title from books where attri @> '"weight"=>"2.3kg"';
select title from books where attri -> 'weight' = '2.5kg';

--postgresql hstore check key-pair
--Query rows that contain multiple specified keys
--You can query the rows whose hstore column contain multiple keys using ?& operator. 
--For example, you can get books where attr column contains both language and weight keys.
select * from books

SELECT id,title FROM books WHERE attri ?& ARRAY [ 'language', 'weight','ISBN-13','shipping' ]; --Multiple Keys

--postgresql hstore check multiple keys
--To check if a row whose hstore column contains any key from a list of keys, 
 --you use the ?| operator instead of the ?& operator.
 
SELECT id,title FROM books WHERE attri ?| ARRAY [ 'language', 'weight','ISBN-13','shipping' ];

--Get all keys from an hstore column
--To get all keys from an hstore column, you use the akeys() function as follows:
select * from books 
SELECT akeys (attri) FROM books;

--postgresql hstore akeys function
--Or you can use the  skey() function if you want PostgreSQL to return the result as a set.

SELECT id,skeys (attri) FROM books;

--postgresql hstore skeys function

--Get all values from an hstore columnLike keys, 
--you can get all values from an hstore column using the  avals() function in the form of arrays.

SELECT avals (attri) FROM books;

--postgresql hstore avals function
--Or you can use the  svals() function if you want to get the result as a set.

select svals(attri) from books;

--to fetch key and pair 

select id,akeys (attri), avals (attri) from books;
SELECT id,skeys (attri) ,svals (attri) FROM books;

--postgresql hstore svals
--Convert hstore data to JSON
--PostgreSQL provides the hstore_to_json() function to convert hstore data to JSON. 
--See the following statement:
select * from books;
SELECT title,hstore_to_json (attri) json FROM books;

--postgresql hstore to json

--Convert hstore data to sets
--To convert hstore data to sets, you use the  each(). function as follows:

SELECT title,(EACH(attri)). * FROM books;

SELECT title, skeys (attri),svals(attri) from books;






