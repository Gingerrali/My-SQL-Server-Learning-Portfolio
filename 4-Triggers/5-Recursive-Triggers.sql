-- Enables recursive trigger execution for the current database.
ALTER DATABASE GlobalTrade
SET RECURSIVE_TRIGGERS ON;
GO

-- Creates a sample table.
CREATE TABLE dbo.Numbers (
    RowID INT IDENTITY PRIMARY KEY,
    RowValue INT);
GO

-- Recursive AFTER INSERT trigger that automatically inserts new rows
-- until the specified limit is reached.
CREATE TRIGGER dbo.RecursiveExample
ON dbo.Numbers
AFTER INSERT
AS
BEGIN
IF (SELECT TOP 1 Inserted.RowValue FROM Inserted) < 20
    INSERT INTO dbo.Numbers (RowValue)
    VALUES ((SELECT TOP 1 Inserted.RowValue FROM Inserted)+1)
ELSE PRINT 'Trigger Recursion Completed'
END
;
GO

-- Starts the recursive trigger and displays the generated rows.
INSERT INTO dbo.Numbers (RowValue)
VALUES (1);
SELECT * FROM dbo.Numbers;
GO

-- Disables recursive trigger execution for the current database.
ALTER DATABASE GlobalTrade
SET RECURSIVE_TRIGGERS OFF;
GO
