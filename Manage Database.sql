-- Create a new table called oscars
CREATE TABLE oscars (
    title VARCHAR,
    award VARCHAR
);

-- Insert the data into the oscars table
INSERT INTO oscars (title, award)
VALUES
('TRANSLATION SUMMER', 'Best Film'),
('DORADO NOTTING', 'Best Film'),
('MARS ROMAN', 'Best Film'),
('CUPBOARD SINNERS', 'Best Film'),
('LONELY ELEPHANT', 'Best Film');
-- Confirm the table was created and is populated
SELECT * 
FROM oscars;
-------------------------------------------
-- Create a new table named family_films using this query
create table family_films as 
SELECT *
FROM film
WHERE rating IN ('G', 'PG');
----------------------------------------------
-- Increase rental_rate by one dollar for R-rated movies
UPDATE film
SET rental_rate = rental_rate + 1
WHERE rating = 'R';
-----------------------------------------------------
--Updated based on other tables
update film
set rental_rate = rental_rate - 1
where film_id in
  (SELECT film_id from actor AS a
   INNER JOIN film_actor AS f
      ON a.actor_id = f.actor_id
   WHERE last_name IN ('WILLIS', 'CHASE', 'WINSLET', 'GUINESS', 'HUDSON'));
---------------------------------------------------------
-- Delete films that cost most than 25 dollars
delete from film
where replacement_cost >25
-------------------------------------------------------
-- Use the list of film_id values to DELETE all R & NC-17 rated films from inventory.
DELETE FROM inventory
WHERE film_id IN (
  SELECT film_id FROM film
  WHERE rating IN ('R', 'NC-17')
);

-- Delete records from the `film` table that are either rated as R or NC-17.
DELETE FROM film
WHERE rating IN ('R', 'NC-17');
