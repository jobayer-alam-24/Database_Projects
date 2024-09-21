CREATE DATABASE Ordering_management_system
USE Ordering_management_system

-- Customer Table
CREATE TABLE tbl_customers
(
	ID int identity(1, 1) not null primary key,
	customer_id varchar(50) not null,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	age int not null,
	city_address varchar(50) not null,
	customer_address varchar(max) not null,
	phone_number varchar(11) not null UNIQUE
);
-- Employee Table
CREATE TABLE tbl_employees
(
	employeeID int identity(1, 1) not null primary key,
	first_name varchar(20) not null,
	middle_name varchar(20) not null,
	last_name varchar(20) not null,
	age int not null,
	emp_address varchar(max) not null,
	phone_number varchar(20) not null UNIQUE,
	salary decimal(18, 2) not null,
	job_title varchar(20) not null,
	username varchar(50) not null,
	[password] varchar(30) not null 
);

-- Order Table 
CREATE TABLE tbl_order
(
	order_id int identity(1, 1) not null primary key,
	product_id int not null foreign key references tbl_products(product_id),
	order_date date not null,
	quantity int not null,
	price float not null,
	claim_date date not null,
	order_number int not null,
	customer_id int not null foreign key references tbl_customers(ID),
);
-- Payments Table
CREATE TABLE tbl_payments
(
	payment_id int identity(1, 1) not null primary key,
	customer_id int not null foreign key references tbl_customers(ID),
	order_number int not null,
	order_date date not null,
	claim_date date not null,
	quantity int not null,
	price float not null
);	
-- Products Table
CREATE TABLE tbl_products
(
	product_id int identity(1, 1) not null primary key,
	products_name varchar(50) not null,
	products_type varchar(50) not null,
	quantity int not null,
	price float not null
);
-- Supplier Table
CREATE TABLE tbl_supplier
(
	supplier_id int identity(1, 1) not null primary key,
	supplier_name varchar(20) not null,
	supplier_address varchar(max) not null,
	contact varchar(30) not null UNIQUE
);
-- Transaction Table
CREATE TABLE tbl_transaction
(
	transaction_id int identity(1, 1) not null primary key,
	customer_id int not null foreign key references tbl_customers(ID),
	employee_id int not null foreign key references tbl_employees(employeeID),
	order_id int not null foreign key references tbl_order(order_id),
	product_id int not null foreign key references tbl_products(product_id),
	supplier_id int not null foreign key references tbl_supplier(supplier_id),
	payment_id int not null foreign key references tbl_payments(payment_id)
);