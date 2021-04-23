USE sakila;
-- Review the tables in the database.
SHOW FULL TABLES;
-- Explore tables by selecting all columns from each table or using the in built review features for your client.
SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM film_text;
SELECT * FROM inventory;
SELECT * FROM language;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM store;

-- Select one column from a table. Get film titles.
SELECT sakila.film.title FROM sakila.film;

-- Select one column from a table and alias it.
SELECT name as Languaje FROM language;

-- Using the select statements and reviewing how many records are returned.
-- Firts it is the number of the staff.
SELECT count(staff_id) FROM staff;
-- Now it is the number of the sotres.
SELECT count(store_id) FROM store;

-- Bonus: Unique days did customers rent movies in this dataset.
SELECT COUNT(DISTINCT DATE(rental_date)) FROM rental;