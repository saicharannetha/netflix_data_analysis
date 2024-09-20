-- Netflix Data Analysis using SQL
-- Solutions of 15 business problems
-- 1. Count the number of Movies vs TV Shows
SELECT
type,count(*) as total_content
FROM netflix_titles
group by 1;

-- 2. Find the most common rating for movies and TV shows
SELECT 
    type,
    rating AS most_frequent_rating
FROM netflix_titles
GROUP BY type, rating
HAVING COUNT(*) = (
    SELECT MAX(rating_count) 
    FROM (
        SELECT COUNT(*) AS rating_count
        FROM netflix_titles nt
        WHERE nt.type = netflix_titles.type
        GROUP BY rating
    ) AS subquery
);

-- 3. List all movies released in a specific year (e.g., 2020)
select * 
from netflix_titles
where type='movie' and release_year=2020;

-- 4. Find the top 5 countries with the most content on Netflix
SELECT country,COUNT(*) AS content_count
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY content_count DESC
LIMIT 5;

-- 5. Identify the longest movie
select * from netflix_titles
where type='movie' and duration=(select max(duration) from netflix_titles);

-- 6. Find content added in the last 5 years
SELECT*
FROM netflix_titles
WHERE STR_TO_DATE(date_added, '%M %d, %Y') >= CURDATE() - INTERVAL 5 YEAR;
    
-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT *
FROM netflix_titles
WHERE FIND_IN_SET('Rajiv Chilaka', director) > 0;

-- 8. List all TV shows with more than 5 seasons
SELECT title, duration from netflix_titles
WHERE type = 'TV Show' AND duration > 5 
order by duration desc;

-- 9. Count the number of content items in each genre
SELECT listed_in,COUNT(*) AS content_count
FROM netflix_titles
GROUP BY listed_in;

-- 10. List all movies that are documentaries
SELECT * FROM netflix_titles
WHERE listed_in LIKE '%Documentaries';

-- 11. Find all content without a director
SELECT * FROM netflix
WHERE director IS NULL;




