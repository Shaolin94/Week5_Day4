CREATE OR REPLACE PROCEDURE insert_film(
    title VARCHAR(50),
    description TEXT,
    release_year INTEGER,
    language_id INTEGER,
    rental_duration INTEGER,
    rental_rate NUMERIC(4,2),
    length INTEGER,
    replacement_cost NUMERIC(5,2),
    rating (pg-13)
) 
AS $$
BEGIN
    INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
    VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;


--Example using stored procedure
CALL insert_film('Drumline ', 'A band looking to compete on a national level with a new drummer', 2023, 1, 3, 14.99, 169, 29.99, 'pg-13');

--View new movie inserted by stored function
SELECT *
FROM film 
ORDER BY film_id DESC
LIMIT 1;





-- PART 2

--Create a Stored Function that will take in a category_id and return the number of
--films in that category

CREATE OR REPLACE FUNCTION get_film_count(num INTEGER)
RETURNS INTEGER
AS $$
	DECLARE film_count INTEGER;
BEGIN
	SELECT COUNT(*) INTO film_count
	FROM   film_category
	WHERE  category_id = num;
	RETURN film_count;
END;


SELECT get_film_count('12');