-- DROP TABLE movies;
-- DROP TABLE directors; --check if this is the right order, once the tables are written--

-- -- **************************************************************** --
-- -- ******* Drop table that has the REFERENCES keyword first ******* --
-- -- ******* Create the same table second *************************** --
-- -- **************************************************************** --

-- CREATE TABLE directors (
--   id SERIAL PRIMARY KEY, --this means it will increment automatically, and it will keep UNIQUE id numbers--
--   name VARCHAR(255),
--   nationality VARCHAR(255)
-- );

-- CREATE TABLE movies ( --this table creation goes second becasue the second table is referencing the ids of the first table --
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(255) NOT NULL, 
--   year INT NOT NULL, 
--   director_id INT REFERENCES directors(id) 
-- );



-- INSERT INTO directors (name, nationality) VALUES ('Steven Spielberg', 'American');
-- INSERT INTO directors (name, nationality) VALUES ('Guillermo del Toro', 'Mexican');
-- INSERT INTO directors (name, nationality) VALUES ('George Lucas', 'American');

-- --what if u didnt know who the director was eg his id number???--
-- INSERT INTO movies (name, year, director_id) VALUES ('Star Wars IV', 1977, 3);
-- INSERT INTO movies (name, year, director_id) VALUES ('Star Wars V', 1980, 3);
-- INSERT INTO movies (name, year, director_id) VALUES ('E.T.', 1982, 1);
-- INSERT INTO movies (name, year, director_id) VALUES ('Pans Labyrinth', 2006, 2); --what can you do with an apostrophe??--
-- INSERT INTO movies (name, year, director_id) VALUES ('Schindlers List', 1993, 1); --what can you do with an apostrophe??--

-- SELECT * FROM directors;
-- SELECT * FROM movies;
-- SELECT * FROM movies WHERE director_id = 1;
-- SELECT * FROM movies WHERE director_id = 2;
-- SELECT * FROM movies WHERE director_id = 3;



--=============================================================--
DROP TABLE IF EXISTS bank_accounts;
DROP TABLE IF EXISTS customers; 
DROP TABLE IF EXISTS account_types;


CREATE TABLE account_types (
  id SERIAL PRIMARY KEY, --this means it will increment automatically, and it will keep UNIQUE id numbers--
  type VARCHAR(255)
  );

CREATE TABLE customers (
  id SERIAL PRIMARY KEY, --this means it will increment automatically, and it will keep UNIQUE id numbers--
  name VARCHAR(255),
  dob VARCHAR(255),
  account_type_id INT REFERENCES account_types(id)
);

CREATE TABLE bank_accounts ( --this table creation goes second becasue the second table is referencing the ids of the first table --
  id SERIAL PRIMARY KEY,
  account_type_id INT REFERENCES account_types(id),
  customer_id INT REFERENCES customers(id) 
);

INSERT INTO account_types (type) VALUES ('Current');
INSERT INTO account_types (type) VALUES ('Savings');

INSERT INTO customers (name, dob, account_type_id) VALUES ('Mark Hamil', '25-09-1951', 1);
INSERT INTO customers (name, dob, account_type_id) VALUES ('Harrison Ford', '13-07-1942', 2);
INSERT INTO customers (name, dob, account_type_id) VALUES ('Carrie Fisher', '21-10-1956', 1);


SELECT * FROM customers;
SELECT * FROM account_types;

-- SELECT account_type_id FROM bank_accounts WHERE customer_id = 1;--


