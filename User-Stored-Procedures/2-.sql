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

EXEC dbo.uspInsertColour 'Neon';
EXEC dbo.uspInsertColour 'Baby Pink';
GO

SELECT * FROM dbo.Colours;
GO

DELETE FROM dbo.Colours
WHERE ColourName = 'Neon';
GO
