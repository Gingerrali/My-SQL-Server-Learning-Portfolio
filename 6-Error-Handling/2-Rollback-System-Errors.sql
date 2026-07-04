-- Demonstrates a transaction that rolls back when an error of any kind occurs.
CREATE PROCEDURE uspAddMovie @MovieID CHAR(8), @Title VARCHAR(125), @Year INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO dbo.Movies (movie_id, title, year)
VALUES (@MovieID, @Title, @Year);
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRANSACTION;
		PRINT 'Transaction failed!';
		RETURN;
	END
	COMMIT TRANSACTION;
	PRINT 'Movie added successfully!';
	END;
GO

-- Tests transaction rollback with a duplicate @Movie_ID.
EXEC uspAddMovie '21', 'The Godfather', '1972';
GO
