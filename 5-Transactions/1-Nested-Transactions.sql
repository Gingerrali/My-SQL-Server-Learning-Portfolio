BEGIN TRANSACTION;
EXEC dbo.uspInsertColour 'Lemongrass Green';
SAVE TRANSACTION SavePointOne;
EXEC dbo.uspInsertColour 'Galaxy Purple';
ROLLBACK TRANSACTION SavePointOne;
COMMIT TRANSACTION;
