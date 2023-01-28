-- creating database
create database technology;
-- 1. create a table named mobile_number to store person's name and mobile numbers. the table should be able to check if the length of the entered phone number is greater or equal to 10.

create table mobile_number(
	mobile_id int primary key identity(1,1),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	phone_num varchar(20) constraint phone_check check(len(phone_num)>=10)
);

-- insert data
insert into mobile_number(first_name, last_name, phone_num)
values('Nikhil', 'Shrestha', '9404850284');



--2. create a table named payment to store the payment records in a store. The table should contain columns Product, Price and date of payment. The table shoould check if the price is greater than 0. And the default date for date of payment should be today's date.

create table payment(
	bill_id int primary key identity(1,1),
	product varchar(30) not null,
	price decimal(10,2),
	Payment_Date date constraint pay_date_def default getdate(),
	constraint price_check check(price>0)
);

-- insert some data
insert into payment(product, price, Payment_Date)
values('Oil' , 370.90, '2020-12-10'),
('Ghee', 670, '10-30-2020');

insert into payment(product, price)
values('Oil' , 370.90),
('Ghee', 670);

-- update the oil product whose payment date is '2023-01-28'
update payment
	set product='Butter' 
	where product='Oil' and Payment_Date='2023-01-28';

-- delete a data
delete from payment
	where bill_id=4;

select * from payment;