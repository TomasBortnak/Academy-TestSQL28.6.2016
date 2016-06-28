
/********************!!!!!!!!!!!!!UPGRADE!!!!!!!!!!!!***************************
---tabulka POPULAR, ktora urcuje ci danu hru ma user zaredenu medzi oblubenymi--
CREATE TABLE Popular
(
  id_game NUMBER NOT NULL,
  id_user NUMBER NOT NULL,
  popular VARCHAR(3) DEFAULT 'no',
  PRIMARY KEY(id_game,id_user),
  FOREIGN KEY(id_game)
    REFERENCES Game(id_game),
  FOREIGN KEY(id_user)
    REFERENCES Users(id_user)
);

INSERT INTO Popular(id_game, id_user, popular) VALUES(2, 6,'yes');
INSERT INTO Popular(id_game, id_user, popular) VALUES(3, 6,'yes');
INSERT INTO Popular(id_game, id_user, popular) VALUES(4, 2,'yes');
INSERT INTO Popular(id_game, id_user, popular) VALUES(3, 3,'yes');
INSERT INTO Popular(id_game, id_user, popular) VALUES(1, 5,'yes');

-----------------Vypis oblubenych hier pouzivatela Michal24---------------------
SELECT g.title FROM game g
JOIN popular p ON p.ID_GAME = g.ID_GAME
JOIN users u ON p.ID_USER = u.ID_USER
WHERE p.popular LIKE 'yes' AND u.name LIKE 'Michal24';
*******************************************************************************/



/****************************INSERT INTO SCORE**********************************
----------------------------kvoli ulohe cislo 13--------------------------------
INSERT INTO Score(id_game, id_user, score, playdate) VALUES(2, 6, 247, '22.6.2016');
INSERT INTO Score(id_game, id_user, score, playdate) VALUES(3, 6, 321, '11.6.2016');
INSERT INTO Score(id_game, id_user, score, playdate) VALUES(2, 5, 158, '15.6.2016');
INSERT INTO Score(id_game, id_user, score, playdate) VALUES(3, 5, 598, '10.6.2016');
*/

/******************************ALTER TABLE**************************************
----------------------------kvoli ulohe cislo 13--------------------------------
ALTER TABLE score 
ADD playdate DATE;
*/
/*******************************************************************************
-------------------------------Create Views-------------------------------------
CREATE VIEW Pohlad15 AS
SELECT u.name, COUNT(c.COMMENTS) AS number_of_comments FROM users u
JOIN comments c ON u.ID_USER = c.ID_USER
GROUP BY u.name ORDER BY number_of_comments desc;

CREATE VIEW Pohlad14 AS
SELECT * FROM PomocnyPohlad14 WHERE average_rating = 
(SELECT MAX(average_rating) FROM PomocnyPohlad14 );

CREATE VIEW PomocnyPohlad14 AS
SELECT DISTINCT g.title AS Title, 
AVG(r.rating) AS average_rating,
COUNT(c.comments) AS number_of_comments FROM game g  
JOIN rating r ON r.ID_GAME = g.ID_GAME
JOIN comments c ON g.ID_GAME = c.ID_GAME
GROUP BY g.TITLE ORDER BY average_rating desc;

CREATE VIEW Pohlad13 AS
SELECT u.name FROM users u
JOIN score s ON u.ID_USER = s.ID_USER
WHERE playdate =  (SELECT max(playdate) FROM score);

CREATE VIEW Pohlad12 AS
SELECT u.name, COUNT(s.score) AS played_games, SUM(s.score) AS score FROM users u
JOIN score s ON u.ID_USER = s.ID_USER
GROUP BY u.name;

CREATE VIEW Pohlad11 AS
SELECT * FROM PomocnyPohlad11 WHERE number_of_comments =
(SELECT MAX(number_of_comments) FROM PomocnyPohlad11);

CREATE VIEW PomocnyPohlad11 AS
SELECT g.title, COUNT(c.COMMENTS) AS number_of_comments FROM game g
JOIN comments c ON g.ID_GAME = c.ID_GAME
GROUP BY g.TITLE ORDER BY number_of_comments desc; 

CREATE VIEW Pohlad10 AS
SELECT DISTINCT g.title AS Title, 
AVG(r.rating) AS average_rating, 
COUNT(r.RATING) AS rating_count FROM game g
JOIN rating r ON r.ID_GAME = g.ID_GAME
GROUP BY g.TITLE;

CREATE VIEW Pohlad9 AS
SELECT * FROM game WHERE
adddate =  (SELECT min(adddate) FROM game);

CREATE VIEW Pohlad8 AS
SELECT (SELECT COUNT(title) FROM game) AS Titles, 
(SELECT COUNT(comments) FROM comments) AS Comments, 
(SELECT COUNT(rating) FROM rating) AS Ratings,
(SELECT COUNT(name) FROM users) AS Users FROM DUAL; 

CREATE VIEW Pohlad7 AS
SELECT * FROM users WHERE name  NOT IN(
SELECT DISTINCT u.name FROM users u
LEFT JOIN rating r ON u.ID_USER = r.ID_USER
JOIN game g ON r.ID_GAME = g.ID_GAME
WHERE g.title LIKE 'Minesweeper');

CREATE VIEW Pohlad6 AS
SELECT u.name FROM users u
LEFT JOIN rating r ON u.ID_USER = r.ID_USER
WHERE r.rating IS NULL;

CREATE VIEW Pohlad5 AS
SELECT g.title FROM game g 
LEFT JOIN score s ON g.ID_GAME = s.ID_GAME
WHERE s.SCORE IS NULL;

CREATE VIEW Pohlad4 AS
SELECT name FROM users
WHERE length(name) = (SELECT max(length(name)) FROM users);

CREATE VIEW Pohlad3 AS
SELECT g.title, c.comments, u.name FROM game g 
JOIN comments c ON g.ID_GAME = c.ID_GAME
JOIN users u ON c.ID_USER = u.ID_USER;

CREATE VIEW Pohlad2 AS
SELECT * FROM game;

CREATE VIEW Pohlad1 AS
SELECT name, email, regdate FROM users ORDER BY REGDATE;
*/

/*******************************************************************************
----------------------------------Create Index----------------------------------
CREATE INDEX game_index ON game(title);
CREATE INDEX users_index ON users(name);
*/ 

/*******************************************************************************
----------------------------------Inserts---------------------------------------
INSERT INTO Rating(id_game, id_user, rating) VALUES(1, 1, 4);
INSERT INTO Rating(id_game, id_user, rating) VALUES(2, 1, 5);
INSERT INTO Rating(id_game, id_user, rating) VALUES(3, 1, 2);
INSERT INTO Rating(id_game, id_user, rating) VALUES(1, 2, 3);
INSERT INTO Rating(id_game, id_user, rating) VALUES(4, 2, 1);
INSERT INTO Rating(id_game, id_user, rating) VALUES(7, 2, 1);
INSERT INTO Rating(id_game, id_user, rating) VALUES(5, 3, 5);
INSERT INTO Rating(id_game, id_user, rating) VALUES(3, 3, 5);
INSERT INTO Rating(id_game, id_user, rating) VALUES(2, 4, 1);
INSERT INTO Rating(id_game, id_user, rating) VALUES(4, 4, 4);
INSERT INTO Rating(id_game, id_user, rating) VALUES(1, 5, 2);
INSERT INTO Rating(id_game, id_user, rating) VALUES(4, 5, 3);
INSERT INTO Rating(id_game, id_user, rating) VALUES(7, 6, 4);
INSERT INTO Rating(id_game, id_user, rating) VALUES(1, 6, 4);

INSERT INTO Comments(id_game, id_user, comments) VALUES(1, 1, 'Velmi dobra hra');
INSERT INTO Comments(id_game, id_user, comments) VALUES(2, 1, 'Super hra');
INSERT INTO Comments(id_game, id_user, comments) VALUES(3, 1, 'Nic moc');
INSERT INTO Comments(id_game, id_user, comments) VALUES(1, 2, 'Celkom OK');
INSERT INTO Comments(id_game, id_user, comments) VALUES(4, 2, 'Nuda!');
INSERT INTO Comments(id_game, id_user, comments) VALUES(7, 2, 'Slaba grafika');
INSERT INTO Comments(id_game, id_user, comments) VALUES(5, 3, 'Najlepsia hra v tomto gamestudiu co som hral');
INSERT INTO Comments(id_game, id_user, comments) VALUES(3, 3, 'TOP!!');
INSERT INTO Comments(id_game, id_user, comments) VALUES(2, 4, 'Prepadak');
INSERT INTO Comments(id_game, id_user, comments) VALUES(4, 4, 'Slusna hratelnost');
INSERT INTO Comments(id_game, id_user, comments) VALUES(1, 5, 'Blbost');
INSERT INTO Comments(id_game, id_user, comments) VALUES(4, 5, 'Nic extra');
INSERT INTO Comments(id_game, id_user, comments) VALUES(7, 6, 'Dobra hra');
INSERT INTO Comments(id_game, id_user, comments) VALUES(1, 6, 'Good');

INSERT INTO Score(id_game, id_user, score) VALUES(1, 1, 456);
INSERT INTO Score(id_game, id_user, score) VALUES(2, 1, 432);
INSERT INTO Score(id_game, id_user, score) VALUES(3, 1, 645);
INSERT INTO Score(id_game, id_user, score) VALUES(1, 2, 281);
INSERT INTO Score(id_game, id_user, score) VALUES(4, 2, 947);
INSERT INTO Score(id_game, id_user, score) VALUES(7, 2, 376);
INSERT INTO Score(id_game, id_user, score) VALUES(5, 3, 123);
INSERT INTO Score(id_game, id_user, score) VALUES(3, 3, 635);
INSERT INTO Score(id_game, id_user, score) VALUES(2, 4, 534);
INSERT INTO Score(id_game, id_user, score) VALUES(4, 4, 223);
INSERT INTO Score(id_game, id_user, score) VALUES(1, 5, 778);
INSERT INTO Score(id_game, id_user, score) VALUES(4, 5, 213);
INSERT INTO Score(id_game, id_user, score) VALUES(7, 6, 270);
INSERT INTO Score(id_game, id_user, score) VALUES(1, 6, 333);

INSERT INTO Users(id_user, name, password, email, regdate) VALUES(user_seq.nextval, 'Tomas96', 'heslo1', 'tomas.bortnak@gmail.com', '10.5.2016');
INSERT INTO Users(id_user, name, password, email, regdate) VALUES(user_seq.nextval, 'Brano47', 'heslo2', 'brano47@gmail.com', '10.6.2016');
INSERT INTO Users(id_user, name, password, email, regdate) VALUES(user_seq.nextval, 'Jozi38', 'heslo3', 'jozi38@gmail.com', '3.6.2016');
INSERT INTO Users(id_user, name, password, email, regdate) VALUES(user_seq.nextval, 'Tadeas91', 'heslo4', 'tadeas91@gmail.com', '25.5.2016');
INSERT INTO Users(id_user, name, password, email, regdate) VALUES(user_seq.nextval, 'Jana36', 'heslo5', 'jana36@gmail.com', '21.5.2016');
INSERT INTO Users(id_user, name, password, email, regdate) VALUES(user_seq.nextval, 'Michal24', 'heslo6', 'michal24@gmail.com', '14.5.2016');
INSERT INTO Users(id_user, name, password, email, regdate) VALUES(user_seq.nextval, 'Juraj44', 'heslo7', 'juraj44@gmail.com', '11.5.2016');

INSERT INTO Game(id_game, title, author, adddate, url) VALUES(game_seq.nextval, 'Minesweeper', 'Bortnak', '10.5.2016', 'http://www.freeminesweeper.org/minecore.html');
INSERT INTO Game(id_game, title, author, adddate, url) VALUES(game_seq.nextval, 'Chess', 'Bortnak', '15.5.2016', 'http://www.sparkchess.com/');
INSERT INTO Game(id_game, title, author, adddate, url) VALUES(game_seq.nextval, '15 Puzzle', 'Lukac', '16.6.2016', 'http://migo.sixbit.org/puzzles/fifteen/');
INSERT INTO Game(id_game, title, author, adddate, url) VALUES(game_seq.nextval, 'Agar', 'unknow', '10.6.2016', 'http://agar.io/');
INSERT INTO Game(id_game, title, author, adddate, url) VALUES(game_seq.nextval, 'King of drift', 'Scesnak', '21.5.2016', 'http://www.silvergames.com/king-of-drift');
INSERT INTO Game(id_game, title, author, adddate, url) VALUES(game_seq.nextval, 'Haxball', 'Popadic', '30.5.2016', 'http://www.haxball.com/');
INSERT INTO Game(id_game, title, author, adddate, url) VALUES(game_seq.nextval, 'Tetris', 'unknow', '12.6.2016', 'http://pauzicka.zoznam.sk/hry/oddychove-hry/tetris');
*/
/*******************************************************************************
------------------------------Create Sequences----------------------------------
CREATE SEQUENCE user_seq
  START WITH 1
  INCREMENT BY 1;
  
CREATE SEQUENCE game_seq
  START WITH 1
  INCREMENT BY 1;
*/
/*******************************************************************************
------------------------------Create Tables-------------------------------------
CREATE TABLE Users
(
    id_user NUMBER NOT NULL,
    name VARCHAR(10) NOT NULL,
    password VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    regdate  DATE NOT NULL,
    PRIMARY KEY  (id_user)
);

CREATE TABLE Game 
(
    id_game NUMBER NOT NULL,
    title VARCHAR(20) NOT NULL,
    author VARCHAR(20) NOT NULL,
    adddate  DATE NOT NULL,
    url VARCHAR(100) NOT NULL,
    PRIMARY KEY  (id_game)
);

CREATE TABLE Score
(
  id_game NUMBER NOT NULL,
  id_user NUMBER NOT NULL,
  score NUMBER, CHECK(score>=1 AND score<=5),
  FOREIGN KEY(id_game)
    REFERENCES Game(id_game),
  FOREIGN KEY(id_user)
    REFERENCES Users(id_user)
);

CREATE TABLE Comments
(
  id_game NUMBER NOT NULL,
  id_user NUMBER NOT NULL,
  comments VARCHAR(254),
  FOREIGN KEY(id_game)
    REFERENCES Game(id_game),
  FOREIGN KEY(id_user)
    REFERENCES Users(id_user)
);

CREATE TABLE Rating
(
  id_game NUMBER NOT NULL,
  id_user NUMBER NOT NULL,
  rating NUMBER, CHECK(rating>=1 AND rating <=5),
  PRIMARY KEY(id_game,id_user),
  FOREIGN KEY(id_game)
    REFERENCES Game(id_game),
  FOREIGN KEY(id_user)
    REFERENCES Users(id_user)
);
*******************************************************************************/