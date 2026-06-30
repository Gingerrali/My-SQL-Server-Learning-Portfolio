CREATE TABLE dbo.ColourAudit (
    AuditID INT IDENTITY PRIMARY KEY,
    ColourName nvarchar(20),
    TimeAdded datetime2);
GO

CREATE TRIGGER dbo.ColourChangeLog
ON dbo.Colours
AFTER INSERT
AS
    INSERT INTO dbo.ColourAudit (ColourName, TimeAdded)
    VALUES (
        (SELECT Inserted.ColourName FROM Inserted),
        GETDATE()
    );
;
GO

EXEC dbo.uspInsertColour 'Neon';
EXEC dbo.uspInsertColour 'Baby Pink';
GO

SELECT * FROM dbo.Colours;
SELECT * FROM dbo.ColourAudit;
GO
