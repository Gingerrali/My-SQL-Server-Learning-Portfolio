-- Creates a database-level DDL trigger that blocks all ALTER Table statements.
CREATE OR ALTER TRIGGER PreventTableChanges
ON DATABASE
FOR ALTER_TABLE
AS
PRINT 'A trigger is cancelling all ALTER TABLE statements.';
ROLLBACK;
GO



-- Creates a server-level DDL trigger that blocks all table DDL statements.
CREATE OR ALTER TRIGGER PreventTableChanges
ON ALL SERVER
FOR DDL_TABLE_EVENTS
AS
PRINT 'A trigger is cancelling all table DDL statements.';
ROLLBACK;
GO

-- Deletes the server-level DDL trigger.
DROP TRIGGER PreventTableChanges
ON ALL SERVER;
GO
