SELECT TOP (1000) [ColourID]
      ,[ColourName]
      ,[LastEditedBy]
  FROM [GlobalTrade].[dbo].[Colours]

  CREATE TABLE dbo.ColourAudit (
    AuditID INT IDENTITY PRIMARY KEY,
    ColourName nvarchar(20),
    TimeAdded datetime2);
GO

SELECT * FROM dbo.ColourAudit;

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


EXEC dbo.uspInsertColour 'Neon';
EXEC dbo.uspInsertColour 'Baby Pink';
GO

SELECT * FROM dbo.Colours;
