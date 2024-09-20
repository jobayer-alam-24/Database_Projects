CREATE DATABASE Boarding_house_management_system
USE Boarding_house_management_system;

--Tenant Table
CREATE TABLE tbl_tenant
(
	tenant_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	last_name nvarchar(20) not null,
	first_name nvarchar(20) not null,
	middle_name nvarchar(20) not null,
	complete_address nvarchar(max) not null,
	email_address nvarchar(30) not null UNIQUE,
	contact_number nvarchar(20) not null,
	gender nvarchar(20) not null,
	profile_picture varchar(max) not null,
	valid_documents text not null
);
-- Room Table
CREATE TABLE tbl_room
(
	room_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	room_number int not null,
	[description] text not null,
	[image] varchar(max) not null
);
-- Bed Management Table
CREATE TABLE tbl_bed_management
(
	bed_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	bed_number int not null,
	room_id INT NOT NULL FOREIGN KEY REFERENCES tbl_room(room_id),
	daily_rent float not null,
	monthly_rent float not null,
	bet_status varchar(1) not null
);
--Bed Assignment Table
CREATE TABLE tbl_bed_assignment
(
	assignment_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	tenant_id INT NOT NULL FOREIGN KEY REFERENCES tbl_tenant(tenant_id),
	room_id INT NOT NULL FOREIGN KEY REFERENCES tbl_room(room_id),
	bed_id INT NOT NULL FOREIGN KEY REFERENCES tbl_bed_management(bed_id),
	date_started datetime not null,
	due_date datetime not null
);
-- Rate Setting Table
CREATE TABLE tbl_rate_setting 
(
	water_bill_rate decimal(18, 2) not null,
	electricity_bill_rate decimal(18, 2) not null
);
-- SMS Setting Table
CREATE TABLE tbl_sms_setting 
(
	api_code varchar(50) not null UNIQUE,
	api_password nvarchar(20) not null,
	set_alarm datetime not null,
	messege varchar(100) not null
);
-- Invoice Table
CREATE TABLE tbl_invoice 
(
	invoice_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	tenant_id INT NOT NULL FOREIGN KEY REFERENCES tbl_tenant(tenant_id),
	room_id INT NOT NULL FOREIGN KEY REFERENCES tbl_room(room_id),
	room_rate decimal(18, 2) not null,
	water_bill_rate decimal(18, 2) not null,
	electricity_bill_rate float not null,
	total_due float not null,
	[date] date not null,
	remarks varchar(max) not null,
	[status] varchar(1) not null,
	processed_by nvarchar(30) not null
);
-- Payment Table 
CREATE TABLE tbl_payment
(
	payment_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	official_receipt_number int not null UNIQUE,
	payment_amount float not null,
	[date] date not null,
	proof_of_payment nvarchar(100) not null,
	remarks nvarchar(100) not null,
	[status] varchar(20) CHECK ([status] in ('pending, approved, cancelled')),
	processed_by INT NOT NULL FOREIGN KEY REFERENCES tbl_user([user_id])
);
-- Notice Board Table
CREATE TABLE tbl_notice_board 
(
	notice_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	title nvarchar(100) not null UNIQUE,
	content text not null,
	[status] varchar(1) not null
);
-- Suggestion Table
CREATE TABLE tbl_suggestions
(
	suggestion_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	tenant_id INT NOT NULL FOREIGN KEY REFERENCES tbl_tenant(tenant_id),
	suggestion nvarchar(max) not null,
	[date] date not null,
	reply_from_owner varchar(max) not null,
	[status] varchar(100) CHECK ([status] in ('pending', 'solved', 'on-going'))
);
-- User Table
CREATE TABLE tbl_user
(
	[user_id] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	username nvarchar(100) not null,
	[password] nvarchar(20) not null,
	avatar varchar(max) not null,
	fullname nvarchar(30) not null,
	contact nvarchar(20) not null,
	email nvarchar(30) not null,
	[status] varchar(1) not null
);