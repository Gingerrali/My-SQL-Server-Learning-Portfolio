-- Creates a stored procedure that inserts a new record using an INPUT parameter.
CREATE OR ALTER PROCEDURE dbo.uspInsertColour (@Colour AS nvarchar(100))
AS
    DECLARE @ColourID INT
    SET @ColourID = (SELECT MAX(ColourID) FROM dbo.Colours)+1;
    INSERT INTO dbo.Colours (ColourID, ColourName, LastEditedBy)
        VALUES (@ColourID, @Colour, 1);
    SELECT * FROM dbo.Colours
        WHERE ColourID = @ColourID
        ORDER BY ColourID DESC;
;
GO

-- Executes the procedure with sample INPUT values.
EXEC dbo.uspInsertColour 'Neon';
EXEC dbo.uspInsertColour 'Baby Pink';
GO

-- Checks the updated table.
SELECT * FROM dbo.Colours;
GO

-- Creates a new stored procedure that removes the last record.
CREATE OR ALTER PROCEDURE dbo.uspRemoveLastColour
AS
    DELETE FROM dbo.Colours
    WHERE ColourID = (SELECT MAX(ColourID) FROM dbo.Colours);
;
GO
