CREATE DATABASE Laundry_management_system
USE Laundry_management_system

-- Bill Table
CREATE TABLE tbl_bill 
(
	bill_id int identity(1, 1) not null primary key,
	customer_id int not null foreign key references tbl_customer(customer_id),
	amount float not null,
	quantity varchar(20) not null,
	price float not null
);
-- Customer Table
CREATE TABLE tbl_customer
(
	customer_id int identity(1, 1) not null primary key,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	age int not null,
	[address] varchar(max) not null,
	phone_number varchar(20) not null UNIQUE,
	gender varchar(20) not null
);
-- Delivery Table --
CREATE TABLE tbl_delivery
(
	delivery_id int identity(1, 1) not null primary key,
	employee_id int not null foreign key references tbl_employees(employee_id),
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	[address] varchar(max) not null
);
-- Employee Table
CREATE TABLE tbl_employees
(
	employee_id int identity(1, 1) not null primary key,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	age int not null,
	phone_number varchar(20) not null UNIQUE,
	email varchar(20) not null UNIQUE,
	[address] varchar(max) not null,
	gender varchar(20) not null,
	salary float not null
);
-- Service Table
CREATE TABLE tbl_service
(
	service_id int identity(1, 1) not null primary key,
	[service_name] varchar(30) not null,
	price float not null
);

-- Transaction Table
CREATE TABLE tbl_transaction
(
	transaction_id int identity(1, 1) not null primary key,
	customer_id int not null foreign key references tbl_customer(customer_id),
	delivery_id int not null foreign key references tbl_delivery(delivery_id),
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	phone_number varchar(20) not null UNIQUE,
	bill_amount float not null
);