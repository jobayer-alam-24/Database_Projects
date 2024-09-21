CREATE DATABASE Boutique_management_system
USE Boutique_management_system

-- Boutique Table
CREATE TABLE tbl_boutique
(
	boutique_id int identity(1, 1) not null primary key,
	owner_id int not null,
	[name] varchar(20) not null,
	[type] varchar(20) not null,
	[description] varchar(max) not null,
	place varchar(30) not null
);

-- Stock Table
CREATE TABLE tbl_stock
(
	stock_id int identity(1, 1) not null primary key,
	items varchar(50) not null,
	number int not null,
	[type] varchar(20) not null,
	stock_description varchar(max) not null
);
-- Product Table -- 
CREATE TABLE tbl_products
(
	product_id int identity(1, 1) not null primary key,
	product_customer_id int not null foreign key references tbl_customer(customer_id),
	product_no int not null,
	product_items varchar(20) not null,
	[type] varchar(20) not null,
	product_description varchar(max) not null
);

-- Sales Table
CREATE TABLE tbl_sales
(
	sales_id int identity(1, 1) not null primary key,
	sales_customer_id int not null foreign key references tbl_customer(customer_id),
	sales_amount int not null,
	sales_type varchar(20) not null,
	sales_description varchar(max) not null
);
-- Inventory Table
CREATE TABLE tbl_inventory
(
	inventory_id int identity(1, 1) not null primary key,
	items varchar(50) not null,
	number int not null,
	inventory_type varchar(50) not null,
	inventory_description varchar(max) not null
);
-- Customer Table
CREATE TABLE tbl_customer
(
	customer_id int identity(1, 1) not null primary key,
	customer_name varchar(50) not null,
	phone_number varchar(11) not null UNIQUE,
	email varchar(20) not null UNIQUE,
	customer_address varchar(max) not null
);