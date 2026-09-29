SELECT type,
       COUNT(*) AS total_titles,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_cleaned), 2) AS percentage
FROM netflix_cleaned
GROUP BY type;

SELECT CAST(year_added AS INTEGER) AS year_added,
       COUNT(*) AS titles_added
FROM netflix_cleaned
WHERE year_added IS NOT NULL
GROUP BY CAST(year_added AS INTEGER)
ORDER BY year_added;

SELECT country,
       COUNT(*) AS total_titles
FROM netflix_cleaned
WHERE country <> 'Unknown'
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

SELECT listed_in,
       COUNT(*) AS total_titles
FROM netflix_cleaned
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;

SELECT rating,
       COUNT(*) AS total_titles
FROM netflix_cleaned
GROUP BY rating
ORDER BY total_titles DESC;

SELECT ROUND(AVG(CAST(REPLACE(duration, ' min', '') AS INTEGER)), 1) AS avg_movie_minutes
FROM netflix_cleaned
WHERE type = 'Movie';