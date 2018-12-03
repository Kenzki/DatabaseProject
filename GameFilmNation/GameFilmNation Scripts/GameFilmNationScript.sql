DROP TABLE Review;
DROP TABLE Account;
DROP TABLE Cast;
DROP TABLE Media;
DROP TABLE Employee;
 

CREATE TABLE Account
(AccountID Numeric(8) not null,
 Name VARCHAR2(30),
 Type VARCHAR2(1) NOT NULL,
 DoB DATE NOT NULL,
 Password VARCHAR2(15),
 Status VARCHAR2(1) NOT NULL,
 Email VARCHAR2(30) UNIQUE,
 Username VARCHAR2(30) UNIQUE,
 MemberLevel VARCHAR2(15) DEFAULT('Copper'),
 SavedSysTime TIMESTAMP,
 CONSTRAINT pk_AccountID PRIMARY KEY (AccountID));
 
 CREATE TABLE Media
(MediaID Numeric(8) NOT NULL,
 Name CHAR(40) NOT NULL,
 Description CHAR(200),
 YearReleased Numeric(4),
 AgeRating CHAR(5),
 Budget Numeric(10),
 PrimaryGenre CHAR(15),
 SecondaryGenre CHAR(15),
 MediaType CHAR(1) NOT NULL,
 Platform CHAR(15),
 AverageRating Decimal(3) DEFAULT(0),
 CONSTRAINT pk_MediaID PRIMARY KEY (MediaID));
 

CREATE TABLE Review
(ReviewID Numeric(8) NOT NULL,
 Rating Numeric(1) NOT NULL,
 Description CHAR(200) not null,
 ReviewType CHAR(15) NOT NULL,
 Status CHAR(1) NOT NULL,
 AccountID Numeric(8) NOT NULL,
 MediaID Numeric(8) NOT NULL,
 ReviewCount NUMERIC(7) DEFAULT(0),
 CONSTRAINT pk_Review PRIMARY KEY (ReviewID),
 CONSTRAINT fk_Review_Account FOREIGN KEY (AccountID) REFERENCES Account,
 CONSTRAINT fk_Review_Media FOREIGN KEY (MediaID) REFERENCES Media);
 
 
 CREATE TABLE Employee
 (EmployeeID Numeric(8) NOT NULL,
  DoB Date NOT NULL,
  Name CHAR(20) NOT NULL,
  Role char(20) NOT NULL,
  Nationality CHAR(20) NOT NULL,
  CONSTRAINT pk_Employee PRIMARY KEY (EmployeeID));
 
 
 CREATE TABLE Cast
 (CastID Numeric(8) NOT NULL,
  EmployeeID numeric(8) NOT NULL,
  MediaID numeric(8),
  CONSTRAINT pk_CastID PRIMARY KEY (CastID),
  CONSTRAINT fk_Cast_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee,
  CONSTRAINT fk_Cast_MediaID FOREIGN KEY (MediaId) REFERENCES Media);
  
  
 


