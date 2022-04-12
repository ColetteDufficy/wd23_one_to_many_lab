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



INSERT INTO directors (name, nationality) VALUES ('Steven Spielberg', 75);
INSERT INTO directors (name, nationality) VALUES ('Guillermo del Toro', 57);
INSERT INTO directors (name, nationality) VALUES ('George Lucas', 77);


INSERT INTO movies (name, nationality) VALUES ('Star Wars IV', 1977);
INSERT INTO movies (name, nationality) VALUES ('Star Wars V', 1980);
INSERT INTO movies (name, nationality) VALUES ('E.T.', 1982);
INSERT INTO movies (name, nationality) VALUES ("Pan's Labyrinth", 2006);
INSERT INTO movies (name, nationality) VALUES ("Schindler's List", 1993);

SELECT * FROM directors;
SELECT * FROM movies;




