-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT *
FROM actor
WHERE last_name = 'Wahlberg'; --Answer IS 2


-- 2. How many payments were made between $3.99 and $5.99?
SELECT count(*)
FROM payment p 
WHERE amount BETWEEN 3.99 AND 5.99; --Answer IS 5,607


-- 3. What films have exactly 7 copies? (search in inventory)
SELECT film_id, count(*)
FROM inventory
GROUP BY film_id
HAVING count(*) = 7;


-- 4. How many customers have the first name ‘Willie’?
SELECT count(*)
FROM customer c 
WHERE first_name = 'Willie'; --Answer IS 2


-- 5. What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id;


-- 6. How many unique district names are there?
SELECT count(DISTINCT district)
FROM address a; --Answer IS 378


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, count(*) AS num_actors
FROM film_actor
GROUP BY film_id
ORDER BY num_actors DESC 
LIMIT 1;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT count(*) 
FROM customer c
WHERE store_id = 1 AND c.last_name LIKE '%es'; --Answer IS 13


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, count(*) 
FROM payment p 
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING count(*) > 250 ;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, count(*) AS num_films
FROM film f 
GROUP BY rating 
ORDER BY num_films DESC;