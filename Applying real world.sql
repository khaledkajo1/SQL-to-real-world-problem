--Review the essentials
SELECT title, description
FROM film AS f
INNER JOIN language AS l
  ON f.language_id = l.language_id
WHERE name IN ('Italian' , 'French')
  AND release_year = 2005 ;

------------------------------------------------------------
--Practice the essentials
SELECT first_name, 
	   last_name, 
       amount 
FROM payment AS p
INNER JOIN customer AS c
  ON p.customer_id = c.customer_id
WHERE active = TRUE
ORDER BY amount DESC;
-------------------------------------------------------------
--Transform numeric & strings
SELECT lower(title) AS title, 
  rental_rate AS original_rate, 
  rental_rate * 0.5 AS sale_rate 
FROM film
-- Filter for films prior to 2006
where release_year < 2006;
--------------------------------------------------------------
--Extract what you need from payment_date
SELECT payment_date,
  EXTRACT(Hour from payment_date) AS payment_hour 
FROM payment;
--------------------------------------------------------
--Aggregating strings
SELECT name, 
	STRING_AGG(title,',') AS film_titles
FROM film AS f
INNER JOIN language AS l
  ON f.language_id = l.language_id
WHERE release_year =2010 AND rating = 'G'
  
GROUP BY name;


