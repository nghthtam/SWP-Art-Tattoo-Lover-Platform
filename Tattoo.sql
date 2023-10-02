use [master]

drop database [TattooManager]

create  database [TattooManager]

use [TattooManager]

create Table [Role](
roleID varchar(15)	Primary Key,
roleName varchar(30),
[status] bit
)

create Table [User](
userID varchar(15) Primary Key,
userAcccount varchar(30) not Null,
[password] varchar(30) not Null,
roleID varchar(15) Foreign Key references [Role](roleID) not Null,
fullname varchar(30) not Null,
birthday date not Null,
gender varchar(10),
phoneNumber varchar(15) not Null,
email varchar(30) not Null,
city varchar(15) not Null,
district varchar(15) not Null,
[status] bit
)

create Table [Studio](
studioID varchar(15) Primary Key,
managerID varchar(15) Foreign Key references [User](userID) not Null,
studioName varchar(50) not Null,
studioAdress varchar(200) not Null,
city varchar(15) not Null,
district varchar(15) not Null,
studioPhoneNumber varchar(15) not Null,
studioEmail varchar(30) not Null,
[status] bit,
rating float
)

create Table [Service](
serviceID varchar(15) Primary Key,
serviceName varchar(30),
systemStaffID varchar(15) Foreign Key References [User](userID),
serviceDetail varchar(200),
[status] bit,
)

create Table [Image](
imgId varchar(15) Primary Key,
imgName varchar(50),
studioID varchar(15) Foreign Key References [Studio](studioID),
img varbinary(max),
userID varchar(15) Foreign Key References [User](userID)
)

create Table [Studio_Service](
studioServiceID varchar(15) Primary Key,
studioID varchar(15) Foreign Key References [Studio](studioID),
sereviceID varchar(15) Foreign Key References [Service](serviceID),
studioStaffID varchar(15) Foreign Key References [User](userID),
imgID varchar(15) Foreign Key References [Image](imgID),
price float,
[status] bit
)

create Table [Slot](
slotID varchar(15) Primary Key,
studioID varchar(15) Foreign Key References [Studio](studioID),
slotCount int,
[date] date,
timeStart time,
timeEnd time
)

create Table [Booking](
bookingID varchar(15) Primary Key,
userID varchar(15) Foreign Key References [User](userID),
studioID varchar(15) Foreign Key References [Studio](studioID),
artistID varchar(15) Foreign Key REferences [User](userID),
staffID varchar(15) Foreign Key References [User](userID),
slotID varchar(15) Foreign Key References [Slot](slotID),
[description] varchar(300),
currentDate date,
rating int,
commentation varchar(300),
[status] varchar(50)
)

create Table [Booking_StudioService](
bookingID varchar(15) Foreign Key References [Booking](bookingID),
studioServiceID varchar(15) Foreign Key References [Studio_Service](studioServiceID)
)

Alter Table [User]
Add studioID varchar(15) Foreign Key References [Studio](studioID)


