-- An example of a transaction that rolls back if a system error occurs.
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

EXEC uspAddMovie '21', 'The Godfather', '1972';
