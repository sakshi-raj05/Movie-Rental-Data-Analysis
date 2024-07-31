USE sakila;

/* task1 : the sakila rental store management wants to know the names of all the actors in their movie collection
Display the first names, last names, actor IDs and the details of the last_updated column. */
 
SELECT * FROM actor;
SELECT first_name, last_name, actor_id, last_update FROM actor;


/* task2- a): display the full names of all the actors. */

SELECT * FROM actor;
SELECT concat(first_name ,  ' '  , last_name) AS "full name" FROM actor;

/* task2-b) display the name of the actors along w the count of repeated first names. */
select first_name 'First_name', count(first_name) 'firstname_count' FROM actor group by first_name;

/* task2-c) display the last_name of actors along w the count of repeated first names*/
select last_name 'last_name', count(last_name) 'lastname_count' FROM actor group by last_name;



/* task3 : Display the count of movies grouped by the ratings */
SELECT * FROM film;
SELECT count(title),rating FROM film group by rating;
SELECT title  AS 'movies', rating FROM film WHERE rating = 'G';

/* task4 : Display the average rental rate based on the movie ratings */
SELECT rating, avg(rental_rate) AS 'average rental rate' FROM film group by rating;

/*task5a : Display the movie titles where the replacement cost is up to $9 */
SELECT * FROM film;
SELECT title AS 'movie titles', replacement_cost FROM film WHERE replacement_cost<10 ;

/* task5 :b : display the titles where the replacement cost is between $15 and $20 */
SELECT title AS 'movie titles', replacement_cost FROM film WHERE replacement_cost between 15 AND 20;

/* task5-c- display the movie titles with the highest replacement cost and the lowest rental cost. */
SELECT max(replacement_cost) FROM film;
SELECT min(rental_rate) FROM film;
SELECT title,replacement_cost FROM film WHERE replacement_cost = 29.99;
 SELECT title,rental_rate FROM film WHERE rental_rate = 0.99;

 /* task6 - display all the movies along w the no of actors listed for each movie */
 SELECT * FROM film;
 SELECT * FROM actor;
 
 SELECT film.title AS 'movie names', count(actor.actor_id) AS 'no of actors' FROM film
 INNER JOIN film_actor
 ON film.film_id = film_actor.film_id JOIN actor
 ON film_actor.actor_id = actor.actor_id 
 group by film.title;
 
 /* task7 - Display the movie titles starting with the letters k and q */
 SELECT title AS 'movie titles' FROM film WHERE title LIKE 'K%' OR title LIKE 'Q%';
 
 
 /* task8 - display the first names, last names of all actors who are a part of the movie agent truman*/
 SELECT * FROM film_actor;
 SELECT * FROM actor;
 select * from film;
 
 SELECT first_name, last_name FROM actor where actor_id in 
 (select actor_id from film_actor where film_id in
 (select film_id from film where title = 'AGENT TRUMAN'));
 
 -- task9 - display names of family category movies
  select title Family_Movies, category.name from film join film_category using (film_id)
    join category using (category_id)
    where film_id in
  (Select film_id from film_category where category_id in
 (Select category_id from category where name like 'Family' or name like 'Children'));
  
  /* task 10* :names of most frequently rented movies is desc order */
  
  Select title, count(rental_id) from film 
 join inventory on inventory.film_id = film.film_id 
 join rental on rental.inventory_id = inventory.inventory_id
 group by title 
 order by count(rental_id) desc;
  
-- task11 : calculate and display the no of movies categories whwere average diff b/w rental cost and rate>15 
SELECT * FROM category;
SELECT * FROM film_actor;
SELECT * FROM film;
  
  select category.name as 'category name',count(category.name) as 'number of movie categories' from film join category join film_category
on film.film_id=film_category.film_id and category.category_id=film_category.category_id
group by (category.name) having (select ( avg(replacement_cost) - avg(rental_rate) ) from film)>15;


-- task12 : display the names of the categories and the no of movies per category sorted by no of movies.

SELECT * FROM (select c.name, count(f.film_id) as no_of_movies
FROM film as f
join film_category as fc
on f.film_id = fc.film_id
join category as c
on fc.category_id = c.category_id
group by c.name) as e 
where no_of_movies between 60 and 70;
