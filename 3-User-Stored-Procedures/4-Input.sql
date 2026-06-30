-- Creates a stored procedure to check if a movie exists in a table
CREATE PROCEDURE sp_CheckMovieExists @Title VARCHAR(200)
AS
BEGIN
IF EXISTS (
SELECT 1 FROM Movies
WHERE title = @Title
) RETURN 1;
ELSE RETURN 0;
END;
GO

-- Tests the procedure with an existing movie title
-- Returns 1 if the movie exists
DECLARE @Status INT;
EXEC @Status = sp_CheckMovieExists 'Psycho';
SELECT @Status AS MovieExists;
GO

-- Tests the procedure with a non-existing movie title
-- Returns 0 if the movie does not exist
DECLARE @Status INT;
EXEC @Status = sp_CheckMovieExists '300';
SELECT @Status AS MovieExists;
GO
