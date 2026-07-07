-- Creates the table used in this example.
CREATE TABLE dbo.AccountsPayable (
    AccountID int PRIMARY KEY,
    AccountNumber nvarchar(20)
);
INSERT INTO dbo.AccountsPayable 
VALUES (1, '98016'), (2, '32408'), (3, '32984');
GO

-- Uses an INSTEAD OF DELETE trigger to block record deletion.
CREATE OR ALTER TRIGGER dbo.AccountsDelete
ON dbo.AccountsPayable
INSTEAD OF DELETE
AS
PRINT 'Deletes are currently blocked by a trigger. Disable the trigger first.'
ROLLBACK
;
GO

-- Attempts to delete a record to test the trigger.
DELETE FROM dbo.AccountsPayable
WHERE AccountID = 1;
GO
