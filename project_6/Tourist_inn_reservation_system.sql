CREATE DATABASE Tourist_inn_reservation_system
USE Tourist_inn_reservation_system

-- Guest Table
CREATE TABLE tbl_guest
(
	guiest_id int identity(1, 1) not null primary key, 
	first_name nvarchar(20) not null,
	last_name nvarchar(20) not null,
	[address] nvarchar(max) not null,
	phone_number varchar(11) not null UNIQUE,
	email varchar(30) not null UNIQUE
);

-- Reservation Table 
CREATE TABLE tbl_reservation
(
	reservation_id int identity(1, 1) not null primary key,
	guiest_id int not null foreign key references tbl_guest(guiest_id),
	room_type_id int not null foreign key references tbl_room_type(room_type_id),
	check_id varchar(50) not null,
	check_out varchar(50) not null,
	reservation_status varchar(1) not null
);
-- Booking Table
CREATE TABLE tbl_booking
(
	booking_id int identity(1, 1) not null primary key,
	room_type_id int not null foreign key references tbl_room_type(room_type_id),
	guiest_id int not null foreign key references tbl_guest(guiest_id),
	check_in_datetime datetime not null,
	check_out_datetime datetime not null,
);
-- Room Type Table
CREATE TABLE tbl_room_type
(
	room_type_id int identity(1, 1) not null primary key,
	room_type varchar(50) not null
);
-- Room Table
CREATE TABLE tbl_room
(
	room_id int identity(1, 1) not null primary key,
	room_number int not null,
	room_type_id int not null foreign key references tbl_room_type(room_type_id),
	room_price float not null,
	room_status varchar(1) not null
);
-- Payment Table
CREATE TABLE tbl_payment
(
	payment_id int identity(1, 1) not null primary key,
	guiest_id int not null foreign key references tbl_guest(guiest_id),
	reservation_id int not null foreign key references tbl_reservation(reservation_id),
	add_on varchar(50) not null,
	room_price float not null,
	number_of_nights int not null,
	total decimal(18, 2) not null,
	payment_status varchar(1) not null
);