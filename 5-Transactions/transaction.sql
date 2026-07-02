DECLARE @Title VARCHAR(50) = 'Star Wars';
DECLARE @Year INT = '1977';
DECLARE @MovieCount INT;

DECLARE @Title VARCHAR(50) = 'Star Wars';
DECLARE @Year INT = '1977';
DECLARE @MovieCount INT;

BEGIN TRANSACTION;
    SELECT @MovieCount = COUNT(*) 
    FROM dbo.Movies
    WHERE title = @Title
    IF @MovieCount > 0
    BEGIN
        PRINT 'The movie already exists in the table. Transaction will be rolled back.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
    INSERT INTO dbo.Movies (movie_id, title, year)
		VALUES (
            ((SELECT MAX(movie_id) FROM dbo.Movies)+1), 
            @Title, @Year);
		COMMIT TRANSACTION;
		PRINT 'The movie has been added successfully!';
	END;

SELECT * FROM dbo.Movies;
DELETE FROM dbo.Movies
WHERE movie_id = 21;

