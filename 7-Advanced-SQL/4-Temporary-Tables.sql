-- Creates a local temporary table (#) available only in the current session;
-- global temporary tables (##) can also be created, and are shared across the server.
-- This example temporarily stores movie revenue data for reporting purposes.
CREATE TABLE #MovieRevenues (
    Movie_id INT, Title VARCHAR(200), RevenueGenerated INT
);
GO

INSERT INTO #MovieRevenues (Movie_id, Title, RevenueGenerated)
SELECT movie_id, title, revenue_generated FROM dbo.Movies
ORDER BY revenue_generated DESC;
GO

SELECT TOP 10  * FROM #MovieRevenues
ORDER BY RevenueGenerated DESC;
GO


    
-- Creates a table variable (@) available only within the current batch.    
DECLARE @EuropeanDirectors TABLE (
    director_id CHAR(10), 
    name VARCHAR(100), 
    dob DATE, 
    nationality VARCHAR(40)
);
GO
