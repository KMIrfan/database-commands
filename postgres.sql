CREATE DATABASE ecommerce;
\l
\c ecommerce
CREATE TABLE employees(
    pk_emp_id SERIAL PRIMARY KEY,
    category VARCHAR(50),
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(50),
    gender VARCHAR(20),
    dob DATE
    );

CREATE TABLE category(
    pk_category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50),
    item_description VARCHAR(500)
);

CREATE TABLE products(
    pk_product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    fk_category_id INT,
    product_description VARCHAR(500),
    price FLOAT,
    added_date DATE,
    FOREIGN KEY (fk_category_id) REFERENCES category(pk_category_id) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE bills(
    pk_bill_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_phone VARCHAR(50),
    bill_date DATE
);

SELECT * FROM products

INSERT INTO category VALUES (
    5, 'Electronics', 'Laptop, Mobile, AC, Fridge'
);

INSERT INTO employees VALUES (
    1, 'staff', 'irfan', 'km', 'irfan@gmail.com', 986595566,'male', '1990-11-14'
);

INSERT INTO employees VALUES (
    5, 'HR', 'Haniya', 'M', 'haniya@hotmail.com', 9846732878,'female', '2010-10-20'
);

-- Adding new column
ALTER TABLE employees add city VARCHAR(100);

-- drop one column
ALTER TABLE employees drop COLUMN city;

-- Table Drop
DROP TABLE tablename


-- Renaming column
ALTER TABLE employees RENAME COLUMN category TO department;

-- Type Changing
ALTER TABLE employees ALTER COLUMN phone TYPE INT;

INSERT INTO products VALUES(
    1,'pen',3,'demo text',40,'07-12-2022'
    ); 

INSERT INTO products VALUES(
    5,'Apple',1,'Apple',60.78,'07-12-2022'
    );     

SELECT * FROM employees WHERE gender='male';    

SELECT product_name,product_description,price FROM products;

-- select items between the numbers
SELECT product_name,price,fk_category_id FROM products WHERE price BETWEEN 5 AND 80;

SELECT * FROM products LIMIT 3;

\l  - list database


-- database connection
\c  ecommerce(database name) 


\d employees    table details

-- List table
\dt      show table

-- First Letter
SELECT * FROM products WHERE product_name LIKE 'p%'; 

-- Second letter
SELECT * FROM products WHERE product_name LIKE '_e%';


select product_name,price from products where product_description like '%world%';


UPDATE products SET price=10 WHERE pk_product_id=1;

DELETE FROM employees WHERE firstname='ajmal' AND phone=984955294;

INSERT INTO bills VALUES (
    5,'Raju',9846206252,'2022/12/01'
);


SELECT avg(price) FROM products;

SELECT sum(price) FROM products;

SELECT max(price) FROM products;

SELECT min(price) FROM products;  

-- showing column name(areas name)
SELECT avg(price) AS average FROM products;

SELECT count(*) FROM products; 

SELECT UPPER(product_name) FROM products;

SELECT lower(product_name) FROM products;

SELECT substring(product_name,2,5) FROM products;

SELECT length(product_name) FROM products;

SELEct round(100.5);

-- Current date and time
SELECT now()

-- changing current date to varchar and fetch 
select substring(cast(now() as varchar),1,10);

CREATE TABLE student_details(
    st_id serial primary key,
    st_name VARCHAR(50),
    subject VARCHAR(50),
    marks float(5)
);
insert into student_details(st_name,subject,marks) values('neema','it',40.5);

 
Select st_name,sum(marks) from student_details group by st_name;

 Select subject,sum(marks) as total from student_details group by subject having subject='maths';
 
--  Remove duplicates
 select distinct st_name from student_detail


 create table bill_items (bill_items_id serial primary key, price int, quandity int, fk_bill_id int FOREIGN KEY (fk_bill_id) REFERENCES bills(pk__id) ON DELETE CASCADE ON UPDATE CASCADE );

insert into category(category_name,cat_description) values ('Sports','Ball,Net,shoes');

insert into bills(customer_name,customer_phone,bill_date) values ('hina','9846206246','2029/03/13');

Alter table bill_items add fk_product_id int Foreign key (fk_product_id) references product(product_id) on delete cascade on update cascade;

insert into bill_items(price,quandity,fk_bill_id,fk_product_id) values ('200','3','2');


-- Inner Join
select customer_name from bills inner join bill_items on bills.bill_id=bill_items.fk_bill_id;

select bills.customer_name,bill_items.price from bills inner join bill_items on bills.bill_id=bill_items.fk_bill_id;

-- left join
select bills.customer_name,bill_items.price from bills left join bill_items on bills.bill_id=bill_items.fk_bill_id;

-- right join
select bills.customer_name,bill_items.price from bills right join bill_items on bills.bill_id=bill_items.fk_bill_id;