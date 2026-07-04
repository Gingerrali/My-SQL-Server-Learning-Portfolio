-- Sample input values used to test the transaction.
DECLARE @Title VARCHAR(50) = 'Star Wars';
DECLARE @Year INT = '1977';
DECLARE @MovieCount INT;

-- Changing the input values will produce different transaction results.
-- Run only one set of input values at a time.
DECLARE @Title VARCHAR(50) = 'Iron Man 3';
DECLARE @Year INT = '2013';
DECLARE @MovieCount INT;

-- The transaction validates duplicate records before inserting new values.
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

-- Shows the table content.
SELECT * FROM dbo.Movies;
GO

-- Removes the last record from the table.
DELETE FROM dbo.Movies
WHERE movie_id = 21;
GO

