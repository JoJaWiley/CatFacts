DROP TABLE IF EXISTS profile;
CREATE TABLE Profile (
    ProfileID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT UNIQUE,
    Bio VARCHAR(255),
    ProfilePic varchar(255)
);

DROP TABLE IF EXISTS User;
CREATE TABLE User (
    UserID INT PRIMARY KEY auto_increment,
    UserName VARCHAR(50) UNIQUE,
    Email VARCHAR(100),
    Password VARCHAR(100)
);

CREATE TABLE Post (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    ThreadID INT,
    UserID INT,
    Title VARCHAR(1000),
    Created DATETIME,
    Content TEXT
);

DROP TABLE IF EXISTS Thread;

CREATE TABLE Thread (
ThreadID INT PRIMARY KEY AUTO_INCREMENT,
CategoryID INT,
Title varchar(255),
Created datetime
);