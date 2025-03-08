
# Netflix Movies and TV Shows Data Analysis 
![netflix_logo](https://github.com/saicharannetha/netflix_mysqlproject/blob/main/logo.png)


## overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. 
## Objectives
Analyze the distribution of content types (movies vs TV shows).

Identify the most common ratings for movies and TV shows.

List and analyze content based on release years, countries, and durations.

Explore and categorize content based on specific criteria and keywords.
## Dataset
The data for this project is sourced from the Kaggle dataset.

Dataset Link:https://www.kaggle.com/datasets/rahulvyasm/netflix-movies-and-tv-shows
## Dependencies
Mysql
## Business Problems and Solutions
1. Count the number of Movies vs TV Shows
```
SELECT
type,count(*) as total_content
FROM netflix_titles
group by type;
```
Objective: Determine the distribution of content types on Netflix.
 
2. Find the most common rating for movies and TV shows
```
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
```
Objective: Identify the most frequently occurring rating for each type of content.

3.List All Movies Released in a Specific Year (e.g., 2020)
```
SELECT * 
FROM netflix_titles
WHERE release_year = 2020;
```
Objective: Retrieve all movies released in a specific year.

4.Find the Top 5 Countries with the Most Content on Netflix
```
SELECT country,COUNT(*) AS content_count
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY content_count DESC
LIMIT 5;
```
Objective: Identify the top 5 countries with the highest number of content items.

5. Identify the Longest Movie
 ```
   select * from netflix_titles
where type='movie' and duration=(select max(duration) from netflix_titles);
```
Objective: Find the movie with the longest duration.

6.Find Content Added in the Last 5 Years
```
SELECT*
FROM netflix_titles
WHERE STR_TO_DATE(date_added, '%M %d, %Y') >= CURDATE() - INTERVAL 5 YEAR;
```
Objective: Retrieve content added to Netflix in the last 5 years.


7. List All TV Shows with More Than 5 Seasons
 ```
   SELECT title, duration from netflix_titles
WHERE type = 'TV Show' AND duration > 5 
order by duration desc;
```
Objective: Identify TV shows with more than 5 seasons.

8. Count the Number of Content Items in Each Genre
```
SELECT listed_in,COUNT(*) AS content_count
FROM netflix_titles
GROUP BY listed_in;
```
Objective: Count the number of content items in each genre.

9. List All Movies that are Documentaries
```
 SELECT * FROM netflix_titles
WHERE listed_in LIKE '%Documentaries';
```
Objective: Retrieve all movies classified as documentaries.


10. Find All Content Without a Director.
 ```
SELECT * FROM netflix
WHERE director IS NULL;
```
Objective: List content that does not have a director.
