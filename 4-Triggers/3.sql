CREATE OR ALTER TRIGGER PreventTableChanges
ON DATABASE
FOR ALTER_TABLE
AS
PRINT 'A trigger is cancelling all ALTER TABLE statements.';
ROLLBACK;
GO

CREATE OR ALTER TRIGGER PreventTableChanges
ON ALL SERVER
FOR DDL_TABLE_EVENTS
AS
PRINT 'A trigger is cancelling all table DDL statements.';
ROLLBACK;
GO

DROP TRIGGER PreventTableChanges
ON ALL SERVER;
