CREATE DATABASE Waste_management_with_reward_system
USE Waste_management_with_reward_system

-- Members Table
CREATE TABLE tbl_member
(
	member_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	last_name nvarchar(20) not null,
	first_name nvarchar(20) not null,
	middle_name nvarchar(20) not null,
	gender varchar(20) not null,
	age int not null,
	contact varchar(20) not null UNIQUE,
	email_address nvarchar(20) not null UNIQUE,
	profile_picture varchar(100) not null UNIQUE,
	username varchar(30) not null UNIQUE,
	[password] varchar(30) not null,
	account_status varchar(1) not null
);
-- Junk Shop Table
CREATE TABLE tbl_junkshop 
(
	shop_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	shop_name nvarchar(50) not null,
	[address] nvarchar(max) not null,
	contact varchar(20) not null UNIQUE,
	email_address varchar(30) not null UNIQUE,
	google_map_location varchar(100) not null
);
-- Garbage Type Table
CREATE TABLE tbl_garbage_type 
(
	[type_id] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	[name] varchar(30) not null,
	[description] varchar(max) not null,
	reward float not null
);
-- Collection Record Table --
CREATE TABLE tbl_collection_record 
(
	record_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	member_id INT NOT NULL FOREIGN KEY REFERENCES tbl_member(member_id),
	shop_id INT NOT NULL FOREIGN KEY REFERENCES tbl_junkshop(shop_id),
	[type_id] INT NOT NULL FOREIGN KEY REFERENCES tbl_garbage_type ([type_id]),
	quantity int not null,
	unit varchar(100) not null,
	total_amount int not null,
	[date] date not null,
	processed_by INT NOT NULL FOREIGN KEY REFERENCES tbl_user([user_id])
);
-- User Table
CREATE TABLE tbl_user
(
	[user_id] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	username nvarchar(20) not null,
	[password] nvarchar(20) not null,
	avatar nvarchar(100) not null,
	fullname nvarchar(30) not null,
	contact nvarchar(20) not null UNIQUE,
	email nvarchar(20) not null UNIQUE,
	user_category_id INT NOT NULL FOREIGN KEY REFERENCES tbl_user_group(user_group_id),
	[status] varchar(1) not null
);

-- User Group Table
CREATE TABLE tbl_user_group 
(
	user_group_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	group_name varchar(20) not null,
	[description] text not null,
	allow_add varchar(1) not null,
	allow_edit varchar(1) not null,
	allow_delete varchar(1) not null,
	allow_print varchar(1) not null,
	allow_export varchar(1) not null,
	allow_import varchar(1) not null,
);