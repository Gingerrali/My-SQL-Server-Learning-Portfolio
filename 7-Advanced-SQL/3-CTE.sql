-- Creates CTEs (temporary tables) used only within a query.
-- This example joins two CTEs to combine their data.
WITH EarlyFilms AS (
SELECT director_id, title, year 
FROM dbo.Movies
WHERE year < 2000
),
Recentfilms AS (SELECT director_id, title, year 
FROM dbo.Movies
WHERE year >= 2000
)
SELECT d.name AS Director, e.title AS EarlyFilm, e.year AS EarlyYear, r.title AS RecentFilm, r.year AS RecentYear
FROM EarlyFilms e
JOIN RecentFilms r ON e.director_id = r.director_id
JOIN dbo.Directors d ON e.director_id = d.director_id;
GO
