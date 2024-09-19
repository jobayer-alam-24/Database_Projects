-- Creating Telemedicine Database
CREATE DATABASE Telemedicine_online_platform
USE Telemedicine_online_platform

-- Patient Table
CREATE TABLE tbl_patient 
(
	registration_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	full_name nvarchar(50) not null,
	gender nvarchar(30) not null,
	date_of_birth datetime not null,
	phone_number varchar(20) not null UNIQUE,
	email varchar(30) not null UNIQUE,
	[address] nvarchar(max) not null,
	profile_picture varchar(max) not null,
	username nvarchar(20) not null,         
	[password] nvarchar(30) not null,
	account_status varchar(1) not null
);

-- Doctor Table
CREATE TABLE tbl_doctor 
(
	doctor_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	full_name nvarchar(30) not null,
	gender nvarchar(20) not null,
	qualification nvarchar(max) not null,
	profile_picture varchar(max) not null,
	email nvarchar(30) not null UNIQUE,
	contact nvarchar(20) not null UNIQUE,
	clinic_map nvarchar(max) not null,
	username nvarchar(20) not null,
	[password] nvarchar(20) not null,
	account_status varchar(1) not null
);
-- Service Table
CREATE TABLE tbl_services
(
	service_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	[service_name] nvarchar(30) not null,
	amount decimal(18, 2) not null,
	doctor_id INT NOT NULL FOREIGN KEY REFERENCES tbl_doctor(doctor_id)
);

-- Payment List Table ---
CREATE TABLE tbl_payment_list
(
	payment_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	appointment_id INT NOT NULL FOREIGN KEY REFERENCES tbl_appointment(appointment_id),
	doctor_id INT NOT NULL FOREIGN KEY REFERENCES tbl_doctor(doctor_id),
	patient_id INT NOT NULL FOREIGN KEY REFERENCES tbl_patient(registration_id),
	service_id INT NOT NULL FOREIGN KEY REFERENCES tbl_services(service_id),
	amount float not null,
	proof_of_payment varchar(max) not null,
	-- Paid Or Unpaid 0/1
	[status] varchar(1) not null,
	remarks varchar(max) not null,
	processed_by nvarchar(30) not null
);
-- Appointment Table
CREATE TABLE tbl_appointment
(
	appointment_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	doctor_id INT NOT NULL FOREIGN KEY REFERENCES tbl_doctor(doctor_id),
	patient_id INT NOT NULL FOREIGN KEY REFERENCES tbl_patient(registration_id),
	[date] date not null,
	[time] time not null,
	service_id INT NOT NULL FOREIGN KEY REFERENCES tbl_services(service_id),
	amount float not null,
	meeting_link varchar(max) not null,
	-- Meeting has done or not yet 0/1
	[status] varchar(1) not null,
);
-- User Table
CREATE TABLE tbl_user
(
	[user_id] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	username nvarchar(20) not null,
	[password] nvarchar(30) not null,
	avatar varchar(max) not null,
	full_name nvarchar(30) not null,
	contact nvarchar(20) not null,
	email nvarchar(20) not null,
	-- Active or Inactive 0/1
	[status] varchar(1) not null
);