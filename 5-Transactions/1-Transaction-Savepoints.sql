-- Uses savepoints to roll back part of a transaction while preserving previous changes
BEGIN TRANSACTION;
EXEC dbo.uspInsertColour 'Lemongrass Green';
SAVE TRANSACTION SavePointOne;
EXEC dbo.uspInsertColour 'Galaxy Purple';
ROLLBACK TRANSACTION SavePointOne;
COMMIT TRANSACTION;
