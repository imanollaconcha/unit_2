-- 1.Select all the actors with the first name ‘Scarlett’.
USE sakila;
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

-- 2.Films (movies) available for rent and films rented.
SELECT COUNT(rental_id) AS 'Available films' FROM rental
WHERE return_date is not null;

SELECT COUNT(rental_id) AS 'Unavailable films'FROM rental
WHERE return_date is null;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) FROM sakila.film;
SELECT MIN(length) FROM sakila.film;

-- 4.What's the average movie duration expressed in format (hours, minutes)?
SELECT FLOOR(AVG(length)/60)  AS hour, (AVG(length) % 60) AS minutes
 FROM film;
 
-- 5. How many distinct (different) actors' last names are there?
SELECT  COUNT(DISTINCT(last_name)) FROM sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT payment_date FROM sakila.payment
SELECT MAX(payment_date) FROM sakila.payment
SELECT MIN(payment_date) FROM sakila.payment 
SELECT DATEDIFF("2005-02-14", "2005-05-24");

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, dayname(rental_date) AS WeekDay, monthname(rental_date) AS Month FROM rental
LIMIT 20;


-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN weekday(rental_date) < 5 then 'Weekday'
ELSE 'Weekend'
END AS 'day_type'
FROM rental;

-- 9. Get release years.
SELECT DISTINCT release_year FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT title FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11.Get all films which title ends with APOLLO.alter
SELECT title FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
SELECT length FROM film 
ORDER BY length desc  
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT COUNT(special_features) FROM film
WHERE special_features LIKE '%Behind the Scenes%'