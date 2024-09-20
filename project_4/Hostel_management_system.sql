CREATE DATABASE Hostel_management_system
USE Hostel_management_system

-- Customer Details Table - 1
CREATE TABLE tblcustomer_details
(
	Customer_ID int identity(1, 1) not null primary key,
	First_name varchar(50) not null,
	Last_name varchar(50) not null,
	[Address] text not null,
	Phone_number varchar(11) not null UNIQUE
);
-- Room Table
CREATE TABLE tbl_room
(
	room_id int identity(1, 1) not null primary key,
	room_description varchar(50) not null,
	room_price float not null,
	hostel_id int not null,
	room_status varchar(50) not null  
);

-- Booking Table
CREATE TABLE tbl_booking
(
	booking_id int identity(1, 1) not null primary key,
	customer_id int not null foreign key references tblcustomer_details(Customer_ID),
	room_id int not null foreign key references tbl_room(room_id),
	booking_date date not null,
	check_in_date date not null,
	check_out_date date not null,
	no_of_nights int not null
);
-- Hostel Branch
CREATE TABLE tbl_hostel_branch
(
	hostelbranch_id int identity(1, 1) not null primary key,
	hostel_name varchar(50) not null,
	[address] text not null,
	phone_number varchar(20) not null UNIQUE,
	manager_id int not null
);
-- Employee Table
CREATE TABLE tbl_employee
(
	employee_id int identity(1, 1) not null primary key,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	[address] text not null,
	phone_number varchar(11) not null UNIQUE,
	email nvarchar(20) not null UNIQUE,
	hostel_id int not null
);
-- Payment Table
CREATE TABLE tbl_payment
(
	payment_id int identity(1, 1) not null primary key,
	customet_id int not null foreign key references tblcustomer_details(Customer_ID),
	booking_id int not null foreign key references tbl_booking(booking_id),
	room_price float not null,
	no_of_nights int not null,
	total_payments float not null
);
-- Transaction Table
CREATE TABLE tbl_transaction
(
	transaction_id int identity(1, 1) not null primary key,
	customer_id int not null foreign key references tblcustomer_details(Customer_ID),
	booking_id int not null foreign key references tbl_booking(booking_id),
	payment_id int not null foreign key references tbl_payment(payment_id),
	employee_id int not null foreign key references tbl_employee(employee_id)
);