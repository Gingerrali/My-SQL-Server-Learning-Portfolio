-- Local tables are temporary and visible in only one session and marked with '#'. 
-- '##' suggests a ... table and gives access to all with access to the server.
-- The table below is an example of a local table that sorts movies under highest revenue.
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
