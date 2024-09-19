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
	proof_of_payment 

);
