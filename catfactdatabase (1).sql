use catfact;

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
    UserID INT PRIMARY KEY auto_increment,
    UserName VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(100)
);

DROP TABLE IF EXISTS Guides;
CREATE TABLE Guides (
	GuideID INT PRIMARY KEY AUTO_INCREMENT,
    GameID INT,
    InfoID INT,
    StratID INT,
    UserID INT,
    GuideCatID INT
);

DROP TABLE IF EXISTS Post;
CREATE TABLE Post (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    ThreadID INT,
    UserID INT,
    Title VARCHAR(255),
    Created DATETIME,
    Content TEXT
);

DROP TABLE IF EXISTS Thread;

CREATE TABLE Thread (
ThreadID INT PRIMARY KEY AUTO_INCREMENT,
CategoryID INT,
Title varchar(50),
Created datetime
);

DROP TABLE ThreadCat;

CREATE TABLE ThreadCat (
ThreadCatID INT PRIMARY KEY AUTO_INCREMENT,
Title varchar(50)
);

DROP TABLE IF EXISTS profile;

CREATE TABLE Profile (
    ProfileID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT UNIQUE,
    Bio VARCHAR(255),
    ProfilePic varchar(255)
);

DROP TABLE IF EXISTS team;
CREATE TABLE team (
  teamID INT PRIMARY KEY AUTO_INCREMENT,
  TeamName VARCHAR(255),
  UserID INT,
  requirements TEXT,
  slots INT
);

INSERT INTO team (TeamName, UserID, requirements, slots)
VALUES ('Team A', 1, 'Requirement 1', 5);
SELECT * FROM team;

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
  
  FriendsID INT PRIMARY kEY AUTO_INCREMENT,
  UserID1 INT,
  UserID2 INT
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
  questionID INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  userID INT,
  content TEXT,
  questionCatID INT
);

DROP TABLE IF EXISTS answers;
CREATE TABLE answers (
  answerID INT PRIMARY KEY AUTO_INCREMENT,
  content TEXT,
  userID INT,
  questionID INT
);

DROP TABLE IF EXISTS questioncat;
CREATE TABLE questionCat (
  questionCatID INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255)
);

DROP TABLE IF EXISTS newscats;
CREATE TABLE newscats (
  newscatID INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  content TEXT
);

DROP TABLE IF EXISTS guidecategories;
CREATE TABLE guidecategories (
  guideCategoryID INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255)
);

DROP TABLE IF EXISTS strategies;
CREATE TABLE strategies (
  StratID INT PRIMARY KEY AUTO_INCREMENT,
  StratContent TEXT
);

DROP TABLE IF EXISTS info;
CREATE TABLE info (
  InfoID INT PRIMARY KEY AUTO_INCREMENT,
  InfoContent TEXT
);

DROP TABLE IF EXISTS favgames;
CREATE TABLE favGames (
  FavGamesID INT PRIMARY KEY AUTO_INCREMENT,
  UserID INT,
  GameID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (GameID) REFERENCES Games(GameID)
);






INSERT INTO newscats (title, content)
VALUES
  ( 'Category 1', 'Content 1'),
  ('Category 2', 'Content 2'),
  ('Category 3', 'Content 3'),
  ('Category 4', 'Content 4'),
  ('Category 5', 'Content 5'),
  ('Category 6', 'Content 6'),
  ('Category 7', 'Content 7'),
  ('Category 8', 'Content 8'),
  ('Category 9', 'Content 9'),
  ('Category 10', 'Content 10');

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

INSERT INTO Question (title, userID, content, questionCatID)
VALUES ('Example Question', 1, 'This is the content of the question.', 2);
SELECT * FROM Question;

INSERT INTO answers (answerID, content, userID, questionID)
VALUES (1, 'This is an example answer.', 1, 1);
SELECT * FROM answers;

INSERT INTO guidecategories (title)
VALUES ('Category 1'), ('Category 2'), ('Category 3');
SELECT * FROM guidecategories;

INSERT INTO strategies (StratContent)
VALUES ('Strategy 1'), ('Strategy 2'), ('Strategy 3');
SELECT * FROM strategies;

INSERT INTO info (InfoContent)
VALUES ('Information 1'), ('Information 2'), ('Information 3');
SELECT * FROM info;

INSERT INTO favGames (UserID, GameID) VALUES (1, 2);
SELECT * FROM favGames;

