create database catfacts;

use catfacts;

DROP TABLE IF EXISTS Games;

CREATE TABLE Games (
    GameID INT PRIMARY KEY,
    Title VARCHAR(50),
    Price DOUBLE,
    Date DATE,
    Score INT,
    Studio VARCHAR(50),
    Genre VARCHAR(50)
);

DROP TABLE IF EXISTS User;

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(100)
);

DROP TABLE IF EXISTS Guides;

CREATE TABLE Guides (
    GameID INT PRIMARY KEY,
    InfoID INT,
    StratID INT,
    UserID INT,
    GuideCatID INT
);

DROP TABLE IF EXISTS Post;

CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    ThreadID INT,
    UserID INT,
    Title VARCHAR(255),
    Created DATETIME,
    Content TEXT
);

DROP TABLE IF EXISTS Profile;

CREATE TABLE Profile (
    UserID INT PRIMARY KEY,
    Bio VARCHAR(255),
    ProfilePic VARCHAR(255)
);



INSERT INTO Games (GameID, Title, Price, Date, Score, Studio, Genre)
VALUES
    (1, 'The Last of Us Part II', 59.99, '2020-06-19', 95, 'Naughty Dog', 'Action-Adventure'),
    (2, 'God of War', 39.99, '2018-04-20', 93, 'Santa Monica Studio', 'Action-Adventure'),
    (3, 'Marvel''s Spider-Man', 49.99, '2018-09-07', 92, 'Insomniac Games', 'Action-Adventure'),
    (4, 'Bloodborne', 19.99, '2015-03-24', 90, 'FromSoftware', 'Action-RPG'),
    (5, 'The Legend of Zelda: Breath of the Wild', 59.99, '2017-03-03', 94, 'Nintendo', 'Action-Adventure'),
    (6, 'Super Mario Odyssey', 59.99, '2017-10-27', 92, 'Nintendo', 'Platformer'),
    (7, 'Animal Crossing: New Horizons', 49.99, '2020-03-20', 90, 'Nintendo', 'Life Simulation'),
    (8, 'Pokémon Sword/Shield', 59.99, '2019-11-15', 87, 'Game Freak', 'RPG'),
    (9, 'Uncharted 4: A Thief''s End', 19.99, '2016-05-10', 91, 'Naughty Dog', 'Action-Adventure'),
    (10, 'Horizon Zero Dawn', 39.99, '2017-02-28', 89, 'Guerrilla Games', 'Action-RPG'),
    (11, 'Final Fantasy VII Remake', 59.99, '2020-04-10', 88, 'Square Enix', 'RPG'),
    (12, 'Ghost of Tsushima', 59.99, '2020-07-17', 86, 'Sucker Punch Productions', 'Action-Adventure'),
    (13, 'Minecraft', 19.99, '2014-09-04', 85, 'Mojang Studios', 'Sandbox'),
    (14, 'Persona 5', 19.99, '2017-04-04', 84, 'Atlus', 'RPG'),
    (15, 'Assassin''s Creed Odyssey', 39.99, '2018-10-05', 83, 'Ubisoft', 'Action-Adventure'),
    (16, 'Resident Evil 2 Remake', 39.99, '2019-01-25', 82, 'Capcom', 'Survival Horror'),
    (17, 'Monster Hunter: World', 29.99, '2018-01-26', 81, 'Capcom', 'Action-RPG'),
    (18, 'FIFA 21', 59.99, '2020-10-09', 80, 'EA Sports', 'Sports'),
    (19, 'Red Dead Redemption 2', 59.99, '2018-10-26', 90, 'Rockstar Games', 'Action-Adventure'),
    (20, 'The Witcher 3: Wild Hunt', 39.99, '2015-05-19', 88, 'CD Projekt', 'Action-RPG'),
    (21, 'Death Stranding', 39.99, '2019-11-08', 87, 'Kojima Productions', 'Action-Adventure'),
    (22, 'Nioh', 19.99, '2017-02-07', 85, 'Team Ninja', 'Action-RPG'),
    (23, 'Crash Bandicoot N. Sane Trilogy', 39.99, '2017-06-30', 83, 'Vicarious Visions', 'Platformer'),
    (24, 'Dragon Quest XI: Echoes of an Elusive Age', 39.99, '2018-09-04', 82, 'Square Enix', 'RPG'),
    (25, 'Gravity Rush 2', 19.99, '2017-01-18', 80, 'SIE Japan Studio', 'Action-Adventure');
	SELECT * FROM Games;
  
  DROP TABLE IF EXISTS friends;
  
  CREATE TABLE friends (
  UserID1 INT,
  UserID2 INT
);

INSERT INTO User (UserID, UserName, Email, Password)
VALUES (1, 'JohnDoe', 'johndoe@example.com', 'mypassword');
SELECT * FROM User;

INSERT INTO Guides (GameID, InfoID, StratID, UserID, GuideCatID)
VALUES
(1, 123, 456, 789, 101),    
(2, 234, 567, 890, 202),
(3, 345, 678, 901, 303);
SELECT * FROM Guides;
    
INSERT INTO Post (PostID, ThreadID, UserID, Title, Created, Content)
VALUES
(1, 1, 1, 'First post', '2023-07-05 09:00:00', 'This is the content of the first post.'),
(2, 1, 2, 'Second post', '2023-07-05 10:30:00', 'This is the content of the second post.'),
(3, 2, 3, 'Hello world', '2023-07-05 13:45:00', 'Hello, everyone! This is my first post.');
SELECT * FROM Post;

INSERT INTO Profile (UserID, Bio, ProfilePic)
VALUES (1, 'Lorem ipsum', 'pic1.jpg');
SELECT * FROM Profile;

INSERT INTO friends (UserID1, UserID2)
VALUES (1, 2);
SELECT * FROM Friends;

SET sql_safe_updates = 0;

DELETE FROM friends;

INSERT INTO friends (UserID1, UserID2)
VALUES (1, 2);
SELECT * FROM friends;




