DROP TABLE movies;
DROP TABLE directors; --check if this is the right order, once the tables are written--

-- **************************************************************** --
-- ******* Drop table that has the REFERENCES keyword first ******* --
-- ******* Create the same table second *************************** --
-- **************************************************************** --

CREATE TABLE directors (
  id SERIAL PRIMARY KEY, --this means it will increment automatically, and it will keep UNIQUE id numbers--
  name VARCHAR(255),
  nationality VARCHAR(255)
);

CREATE TABLE movies ( --this table creation goes second becasue the second table is referencing the ids of the first table --
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL, 
  year INT NOT NULL, 
  director_id INT REFERENCES directors(id) 
);



INSERT INTO directors (name, nationality) VALUES ('Steven Spielberg', 'American');
INSERT INTO directors (name, nationality) VALUES ('Guillermo del Toro', 'Mexican');
INSERT INTO directors (name, nationality) VALUES ('George Lucas', 'American');


INSERT INTO movies (name, year, director_id) VALUES ('Star Wars IV', 1977, 3);
INSERT INTO movies (name, year, director_id) VALUES ('Star Wars V', 1980, 3);
INSERT INTO movies (name, year, director_id) VALUES ('E.T.', 1982, 1);
INSERT INTO movies (name, year, director_id) VALUES ('Pans Labyrinth', 2006, 2); --what can you do with an apostrophe??--
INSERT INTO movies (name, year, director_id) VALUES ('Schindlers List', 1993, 1); --what can you do with an apostrophe??--

SELECT * FROM directors;
SELECT * FROM movies;
SELECT * FROM movies WHERE director_id = 1;
SELECT * FROM movies WHERE director_id = 2;
SELECT * FROM movies WHERE director_id = 3;






