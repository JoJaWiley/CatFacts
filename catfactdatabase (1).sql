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
    UserName VARCHAR(50) UNIQUE,
    Email VARCHAR(100),
    Password VARCHAR(100)
);

DROP TABLE IF EXISTS Guides;
CREATE TABLE Guides (
	GuideID INT PRIMARY KEY AUTO_INCREMENT,
    GuideTitle varchar(200),
    GuideInfo varchar(500),
    guidePage varchar(200),
    GameID INT,
    InfoID INT,
    StratID INT,
    UserID INT,
    GuideCatID INT
);

DROP TABLE IF EXISTS guidecategories;
CREATE TABLE guidecategories (
  guideCategoryID INT PRIMARY KEY AUTO_INCREMENT,
  guideCategoryTitle VARCHAR(255)
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

DROP TABLE IF EXISTS ThreadCat;

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

DROP TABLE IF EXISTS teamuser;
CREATE TABLE teamuser (
teamuserID INT PRIMARY KEY AUTO_INCREMENT,
teamID INT UNIQUE,
UserID INT UNIQUE 
);

DROP TABLE IF EXISTS videos;

CREATE TABLE Videos (
videoID INT PRIMARY KEY auto_increment,
videoLink Varchar(350),
GameID INTEGER
);
INSERT INTO Videos VALUES (NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/X0VubwgS2Y4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 1),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/PCtLUS_eBjs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 2),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/3R2uvJqWeVg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 3),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/VkvdpZmIGtw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 4),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/O2pzSYE7FWY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 5),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/5kcdRBHM7kM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 6),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/_3YNL0OWio0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 7),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/uBYORdr_TY8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 8),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/hh5HV4iic1Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 9),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/u4-FCsiF5x4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 10),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/HkD8BCCYsS0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 11),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/b_iU_gnn28U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 12),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/0cpQC5jVMDg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 13),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/Kg56yNG5xZk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 14),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/G97lx7orMN8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 15),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/u3wS-Q2KBpk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 16),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/Ro6r15wzp2o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 17),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/sSUx54kmUD8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 18),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/4HRAUKE29GQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 19),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/c0i88t0Kacs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 20),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/rP3UngLFou4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 21),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/v9CP2GXo3Ew" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 22),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/r5yAjgP2vnM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 23),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/NdFgFABSkhQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 24),
(NULL, '<iframe width="560" height="315" src="https://www.youtube.com/embed/NPOqdxjH4NA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 25);


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
    
    INSERT INTO Guides (GuideTitle, GuideInfo, guidePage, GameID, InfoID, StratID, UserID, GuideCatID)
VALUES
("The Last of Us Part II", "Complete walkthrough of the game. Beginner's Guide for exploration, combat, environmental puzzles.", "thelastofusguide.jsp", 1, 123, 456, 789, 101),    
("God of War", "Complete walkthrough of the game. Beginner's Guide for exploration, combat, environmental puzzles.", "godofwarguide.jsp", 2, 234, 567, 890, 202),
("Marvel's Spiderman", "Complete walkthrough of the game. Beginner's Guide for exploration, combat, environmental puzzles.", "spidermanguide.jsp", 3, 345, 678, 901, 303);
SELECT * FROM Guides;

INSERT INTO guidecategories (guideCategoryTitle)
VALUES ('Basics'), ('Walkthrough'), ('Characters & Background');
SELECT * FROM guidecategories;

INSERT INTO ThreadCat (Title)
VALUES
("Game Boards"),
("Community Boards"),
("Team Boards"),
("Social Boards"),
("Technical Boards"),
("Other");
  
DROP TABLE IF EXISTS friend;

DROP TABLE IF EXISTS Question;


DROP TABLE IF EXISTS answers;


DROP TABLE IF EXISTS questioncat;

DROP TABLE IF EXISTS newscats;


DROP TABLE IF EXISTS strategies;

DROP TABLE IF EXISTS info;

DROP TABLE IF EXISTS favgames;

INSERT INTO User (UserID, UserName, Email, Password)
VALUES (1, 'JohnDoe', 'johndoe@example.com', 'mypassword');
SELECT * FROM User;

SET sql_safe_updates = 0;



