/*
Instructions
- In the table actor, which are the actors whose last names are not repeated? For
 example if you would sort the data in the table actor by last_name, 
 you would see that there is Christian Arkoyd, Kirsten Arkoyd, 
 and Debbie Arkoyd. These three actors have the same last name. 
 So we do not want to include this last name in our output. 
 Last name "Astaire" is present only one time with actor "Angelina Astaire",
 hence we would want this in our output list.
 
- Which last names appear more than once? We would use the same 
logic as in the previous question but this time we want to include 
the last names of the actors where the last name was present more than 
once

- Using the rental table, find out how many rentals 
were processed by each employee.

- Using the film table, find out how many films were released each year.

- Using the film table, find out for each rating how many films were there.

- the average lengths to two decimal places

 - Which kind of movies (rating) have a mean duration of more than two hours?

- Rank films by length (filter out the rows that have nulls or 0s 
in length column). In your output, only select the columns title,
 length, and the rank.


*/

/*
In the table actor, which are the actors whose last names are not repeated? 
For example if you would sort the data in the table actor by last_name, 
 you would see that there is Christian Arkoyd, Kirsten Arkoyd, 
 and Debbie Arkoyd. These three actors have the same last name. 
 So we do not want to include this last name in our output. 
 Last name "Astaire" is present only one time with actor "Angelina Astaire",
 hence we would want this in our output list.
*/

SELECT distinct(last_name)
FROM sakila.actor
ORDER BY last_name
LIMIT 60;


/*
- Which last names appear more than once? We would use the same 
logic as in the previous question but this time we want to include 
the last names of the actors where the last name was present more than 
once
*/

SELECT last_name, COUNT(last_name)
FROM sakila.actor
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


/*
- Using the rental table, find out how many rentals 
were processed by each employee.
*/

SELECT staff_id, count(rental_id)
FROM sakila.rental
GROUP BY staff_id;


-- Using the film table, find out how many films were released each year.

SELECT DISTINCT(release_year), COUNT(title)
FROM sakila.film
GROUP BY release_year;

-- the average lengths to two decimal places

SELECT ROUND(AVG(length),2)
FROM sakila.film;

-- Which kind of movies (rating) have a mean duration of more than two hours?


SELECT DISTINCT(Rating)
FROM sakila.film
WHERE length > 2;

/*
- Rank films by length (filter out the rows that have nulls or 0s 
in length column). In your output, only select the columns title,
 length, and the rank.

*/

SELECT title, length, rating
FROM sakila.film
WHERE length is not null
ORDER BY title;
