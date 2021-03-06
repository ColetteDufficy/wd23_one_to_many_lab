DROP TABLE movies;
DROP TABLE directors; 

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
  director_id INT REFERENCES directors(id) -- this is vital - to allow the movies to refer back to the directors table--
);



INSERT INTO directors (name, nationality) VALUES ('Steven Spielberg', 'American');
INSERT INTO directors (name, nationality) VALUES ('Guillermo del Toro', 'Mexican');
INSERT INTO directors (name, nationality) VALUES ('George Lucas', 'American');

INSERT INTO movies (name, year, director_id) VALUES ('Star Wars IV', 1977, 3);
INSERT INTO movies (name, year, director_id) VALUES ('Star Wars V', 1980, 3);
INSERT INTO movies (name, year, director_id) VALUES ('E.T.', 1982, 1);
INSERT INTO movies (name, year, director_id) VALUES ('Pan''s Labyrinth', 2006, 2); --add in an extra apostrophe to include the title's apostrophe--
INSERT INTO movies (name, year, director_id) VALUES ('Schindler''s List', 1993, 1); --add in an extra apostrophe to include the title's apostrophe--

SELECT * FROM directors;
SELECT * FROM movies;
SELECT * FROM movies WHERE director_id = 1;
SELECT * FROM movies WHERE director_id = 2;
SELECT * FROM movies WHERE director_id = 3;

--what if u didnt know who the director was eg his id number???--
SELECT * FROM directors WHERE name = 'Steven Spielberg'; -- this gives me the id of 1--
SELECT * FROM movies WHERE director_id = 1;



--=============================================================--
DROP TABLE IF EXISTS bank_accounts;
DROP TABLE IF EXISTS customers; 
DROP TABLE IF EXISTS account_types;


CREATE TABLE account_types ( --this table had to be created first, otherwsie, customer table cudnt form otself without the data)
  id SERIAL PRIMARY KEY, --this means it will increment automatically, and it will keep UNIQUE id numbers--
  account_type VARCHAR(255)
  );

CREATE TABLE customers (
  id SERIAL PRIMARY KEY, --this means it will increment automatically, and it will keep UNIQUE id numbers--
  name VARCHAR(255),
  dob VARCHAR(255)
);

CREATE TABLE bank_accounts ( --why do i need this table???????? --
  id SERIAL PRIMARY KEY,
  balance INT,
  account_type_id INT REFERENCES account_types(id),
  customer_id INT REFERENCES customers(id) 
);

INSERT INTO account_types (account_type) VALUES ('Current Account');
INSERT INTO account_types (account_type) VALUES ('Savings Account');

INSERT INTO customers (name, dob) VALUES ('Mark Hamil', '25-09-1951');
INSERT INTO customers (name, dob) VALUES ('Harrison Ford', '13-07-1942');
INSERT INTO customers (name, dob) VALUES ('Carrie Fisher', '21-10-1956');

INSERT INTO bank_accounts (balance, account_type_id, customer_id) VALUES (100, 1, 1);
INSERT INTO bank_accounts (balance, account_type_id, customer_id) VALUES (2000, 1, 2);


SELECT * FROM customers;
SELECT * FROM account_types;

SELECT * FROM bank_accounts WHERE customer_id = 1;
SELECT * FROM bank_accounts WHERE customer_id = 2;



