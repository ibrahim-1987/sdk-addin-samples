Drop database if exists ibra1987hoteldb;

create database ibra1987hoteldb;

use ibra1987hoteldb;

create table room(
	roomId INT PRIMARY KEY,
    `type` varchar(20) NOT NULL,
    ada_accessible TINYINT(1) NOT NULL,
    standard_occupancy INT NOT NULL,
    maximum_occupancy INT NOT NULL,
    base_price decimal(6,2) NOT NULL,
    extra_person_cost decimal(6,2)
);

create table amenity(
	amenityId INT PRIMARY KEY AUTO_INCREMENT,
    amenity_name varchar(50) NOT NULL
);

create table roomAmenity(
	roomId INT NOT NULL,
    amenityId INT NOT NULL,
    CONSTRAINT PK_roomAmenity 
		PRIMARY KEY (roomId,amenityId),
	CONSTRAINT FK_roomAmenity_room
		FOREIGN KEY (roomId)
		REFERENCES room(roomId),
	CONSTRAINT FK_roomAmenity_amenity
		FOREIGN KEY (amenityId)
		REFERENCES amenity(amenityId)
);

create table guest(
	guestId INT PRIMARY KEY AUTO_INCREMENT,
    guest_name varchar(50) NOT NULL,
    address varchar(100) NOT NULL,
    city varchar(50) NOT NULL,
    state varchar(50) NOT NULL,
    zip varchar(10) NOT NULL,
    phone varchar(15) NOT NULL
);


create table reservation(
	reservationId INT PRIMARY KEY auto_increment,
    roomId INT PRIMARY KEY NOT NULL,
    guestId INT PRIMARY KEY NOT NULL,
    adults INT NOT NULL,
    children INT NOT NULL,
	start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_cost decimal(15,2) NOT NULL,
    
    CONSTRAINT FK_reservation_room
		FOREIGN KEY (roomId)
        REFERENCES room(roomId),
    CONSTRAINT FK_reservation_guest
		FOREIGN KEY (guestId)
        REFERENCES guest(guestId)
);