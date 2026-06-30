CREATE PROCEDURE sp_CheckMovieExists @Title VARCHAR(200)
AS
BEGIN
IF EXISTS (
SELECT 1 FROM Movies
WHERE title = @Title
) RETURN 1;
ELSE RETURN 0;
END;

DECLARE @Status INT;
EXEC @Status = sp_CheckMovieExists 'Psycho';
SELECT @Status AS MovieExists;

DECLARE @Status INT;
EXEC @Status = sp_CheckMovieExists '300';
SELECT @Status AS MovieExists;
