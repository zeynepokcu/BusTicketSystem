CREATE TABLE SystemAdmin (username varchar(11),
           password varchar(20));
           
CREATE TABLE Users (userID integer,
                    	          firstName varchar(20),
                   	          lastName varchar(20),
                    	          tcNo varchar(11),
                    	          contactNo varchar(11),
                     	          dateOfBirth varchar(10),
                   	          gender varchar(5),
          username varchar(15),
          password varchar(20));
        
ALTER TABLE Users ADD (
CONSTRAINT users_pk PRIMARY KEY (userID));

create sequence users_seq start with 1 increment by 1 nomaxvalue;

create trigger users_trigger
before insert on users
for each row
   begin
     select users_seq.nextval into :new.userID from dual;
   end;


CREATE TABLE Conductor (conductorID integer,
                        firstName varchar(20),
                        lastName varchar(20),
                        tcNo varchar(11),
                        contactNo varchar(11),
                        dateOfBirth varchar(10),
                        gender varchar(5));

ALTER TABLE Conductor ADD (
CONSTRAINT conductor_pk PRIMARY KEY (conductorID));

create sequence conductor_seq start with 1 increment by 1 nomaxvalue;

create trigger conductor_trigger
before insert on conductor
for each row
   begin
     select conductor_seq.nextval into :new.conductorID from dual;
   end;

                    
CREATE TABLE Bus (busID integer,
                  busLicensePlate varchar(15),
    details varchar(200));

ALTER TABLE Bus ADD (
CONSTRAINT bus_pk PRIMARY KEY (busID));

create sequence bus_seq start with 1 increment by 1 nomaxvalue;

create trigger bus_trigger
before insert on bus
for each row
   begin
     select bus_seq.nextval into :new.busID from dual;
   end;


CREATE TABLE Route (routeID integer,
                    busID integer,
                    departure varchar(30),
                    arrival varchar(30),
                    routeDate varchar(10),
                    routeTime varchar(5) check(regexp_like(routeTime, '[0-9]{2}:[0-9]{2}')),
                    routeFee decimal(5,3));


ALTER TABLE Route ADD (
CONSTRAINT route_pk PRIMARY KEY (routeID));

create sequence route_seq start with 1 increment by 1 nomaxvalue;

create trigger route_trigger
before insert on route
for each row
   begin
     select route_seq.nextval into :new.routeID from dual;
   end;

CREATE TABLE Seat (seatNo integer,
                   routeID integer,
                   available varchar(11));

CREATE TABLE Ticket (ticketID integer,
                     seatNo integer,
	       routeID integer,
	       busID integer,
                     departure varchar(50),
                     arrival varchar(50),
                     routeDate varchar(10),
                     routeTime varchar(10),
                     routeFee decimal(5,3),
       customerName varchar(20),
       customerSurname varchar(20),
       customerTC varchar(11));

ALTER TABLE Ticket ADD (
CONSTRAINT ticket_pk PRIMARY KEY (ticketID));

create sequence ticket_seq start with 1 increment by 1 nomaxvalue;

create trigger ticket_trigger
before insert on ticket
for each row
   begin
     select ticket_seq.nextval into :new.ticketID from dual;
   end;

