USE sakila;
-- 1. Write a query to display for each store its store ID, city, and country.

SELECT store_id, city, country
FROM sakila.store s
JOIN sakila.address a
USING (address_id)
JOIN sakila.city c
USING (city_id)
JOIN sakila.country co
USING(country_id);

-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, SUM(amount) AS 'Bussines done'
FROM sakila.store s
JOIN sakila.staff st
USING(store_id)
JOIN sakila.payment p
USING (staff_id)
GROUP BY store_id;

-- 3. Which film categories are longest?

SELECT c.name, AVG(f.length) AS avg_duration
FROM sakila.film f
JOIN sakila.film_category fc
USING (film_id)
JOIN sakila.category c
USING (category_id)
GROUP BY category_id
ORDER BY avg_duration DESC;

-- 4. Display the most frequently rented movies in descending order.

SELECT f.title, COUNT(rental_id) AS rental_times
FROM rental
JOIN sakila.inventory i
USING(inventory_id)
JOIN sakila.film f
USING(film_id)
GROUP BY f.film_id
ORDER BY rental_times DESC;

-- 5. List the top five genres in gross revenue in descending order.
SELECT name, SUM(p.amount) AS Revenue
FROM category
JOIN sakila.film_category f
USING(category_id)
JOIN sakila.inventory i
USING (film_id)
JOIN sakila.rental r
USING(inventory_id)
JOIN sakila.payment p
USING (customer_id)
GROUP BY category_id
ORDER BY Revenue DESC
LIMIT 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT store_id, f.title, COUNT(store_id) AS Num_film
FROM store
JOIN sakila.inventory i
USING (store_id)
JOIN sakila.film f
USING(film_id)
GROUP BY f.title, store_id
HAVING f.title = 'Academy Dinosaur';

-- 7. Get all pairs of actors that worked together.
SELECT * FROM actor;

SELECT fa.actor_id, fb.actor_id, a.first_name, a.last_name
FROM sakila.film_actor fa
JOIN sakila.film_actor fb
ON (fa.film_id = fb.film_id) AND (fa.actor_id <> fb.actor_id);
JOIN sakila.actor a
ON (a.actor_id = fa.actor_id);

SELECT a.actor_id, b.actor_id
FROM film_actor a
JOIN film_actor b
ON (film_id = b.film_id)  AND (a.actor_id <> b.actor_id);

-- 8. Get all pairs of customers that have rented the same film more than 3 times.

-- 9. For each film, list actor that has acted in more films.
SELECT CONCAT(a.first_name,' ', a.last_name) AS Actor, COUNT(film_id) AS Num_films
FROM film
JOIN sakila.film_actor fa
USING(film_id)
JOIN sakila.actor a
USING (actor_id)
GROUP BY actor_id
ORDER BY Num_films DESC;
