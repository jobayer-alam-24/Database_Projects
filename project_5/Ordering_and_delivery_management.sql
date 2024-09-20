CREATE DATABASE Ordering_and_delivery_management
USE Ordering_and_delivery_management

-- Employee Table
CREATE TABLE tbl_employee
(
	emp_id int identity(1, 1) not null primary key,
	first_name nvarchar(20) not null,
	last_name nvarchar(20) not null,
	[address] nvarchar(max) not null,
	contact varchar(11) not null UNIQUE
);
-- Customet Table
CREATE TABLE tbl_customer
(
	customer_id int identity(1, 1) not null primary key,
	[name] nvarchar(20) not null,
	[address] nvarchar(20) not null,
	contact varchar(20) not null UNIQUE
);
-- Product Table
CREATE TABLE tbl_product
(
	product_id int identity(1, 1) not null primary key,
	[name] nvarchar(20) not null,
	flavors varchar(20) not null,
	price float not null
);
-- User Table
CREATE TABLE tbl_user
(
	userid int identity(1, 1) not null primary key,
	username nvarchar(20) not null,
	[password] varchar(20) not null,
	first_name nvarchar(20) not null,
	last_name varchar(20) not null,
	contact varchar(11) not null UNIQUE,
	[address] nvarchar(max) not null
);
-- Transaction Table
CREATE TABLE tbl_transaction
(
	pending_no int not null,
	product_id int not null foreign key references tbl_product(product_id),
	customer_id int not null foreign key references tbl_customer(customer_id),
	flavor varchar(20) not null,
	price float not null,
	quantity int not null,
	total_price float not null,
	[date] date not null
);
-- Pending Table
CREATE TABLE tbl_pending
(
	pending_no int not null,
	product_id int not null foreign key references tbl_product(product_id),
	customer_id int not null foreign key references tbl_customer(customer_id),
	flavor varchar(20) not null,
	price float not null,
	quantity int not null,
	total_price float not null,
	[date] date not null
);