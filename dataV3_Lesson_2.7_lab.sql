-- Lab 2.07
USE sakila;
SELECT * FROM category;
SELECT * FROM film_category;
SELECT * FROM film;


-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name as genre_name, COUNT(DISTINCT fc.film_id) AS 'Number of films'
FROM sakila.film_category fc
JOIN sakila.category c
USING (category_id)
GROUP BY fc.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT staff_id, SUM(amount) AS 'Total amount'
FROM sakila.payment p
WHERE DATE(payment_date) BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY p.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT actor_id, COUNT(film_id) AS num_films
FROM film_actor
GROUP BY actor_id
ORDER BY num_films DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT customer_id AS 'Customer', COUNT(rental_id) AS 'Number of films'
FROM rental
GROUP BY customer_id
ORDER BY customer_id ASC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address 
FROM sakila.staff s
JOIN sakila.address a
USING (address_id);

-- 6. List each film and the number of actors who are listed for that film.
SELECT title, COUNT(DISTINCT actor_id) AS 'Number of actors'
FROM film
JOIN film_actor
USING(film_id)
GROUP BY film_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.first_name AS Name, c.last_name AS 'Last name' , SUM(p.amount) AS 'Spend amount'
FROM sakila.payment p
JOIN sakila.customer c
USING (customer_id)
GROUP BY p.customer_id;


-- 8. List number of films per category.
SELECT c.name AS 'Genre name', COUNT(DISTINCT fc.film_id) AS 'Number of films'
FROM sakila.film_category fc
JOIN sakila.category c
USING (category_id)
GROUP BY fc.category_id;
