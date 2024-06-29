
--Determine the monthly income
-- List all tables in the public schema
SELECT * 
FROM pg_catalog.pg_tables
WHERE schemaname = 'public';

-- Explore the tables and fill in the correct one
SELECT * 
FROM payment 
LIMIT 10;

-- Prepare the result
SELECT EXTRACT(MONTH FROM payment_date) AS month, 
       SUM(amount) AS total_payment
FROM payment 
GROUP BY month
ORDER BY total_payment;
-------------------------------------------------------------------
--What columns are in your database?
SELECT table_name, column_name
FROM information_schema.columns
where table_schema = 'public';
--------------------------------------------------------------------
--A View of All your columns
-- Create a new view called table_columns
CREATE VIEW table_columns AS
SELECT table_name, 
	   STRING_AGG(column_name, ', ') AS columns
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY table_name;

-- Query the newly created view table_columns
select *
FROM table_columns;
------------------------------------------------------------------
--The average length of films by category
-- Calculate the average_length for each category
SELECT category, 
	   AVG(length) AS average_length
FROM film AS f
-- Join the tables film & category
INNER JOIN category AS c
  ON f.film_id = c.film_id
GROUP BY category
-- Sort the results in ascending order by length
ORDER BY average_length ;
------------------------------------------------------------------
--Which films are most frequently rented?
SELECT title, COUNT(title)
FROM film AS f
INNER JOIN inventory AS i
  ON f.film_id = i.film_id
INNER JOIN rental AS r
  ON i.inventory_id = r.inventory_id
GROUP BY title
ORDER BY count DESC;
-------------------------------------------------------------------
