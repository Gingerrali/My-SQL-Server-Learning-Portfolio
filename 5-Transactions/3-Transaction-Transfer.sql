-- Creates a table with sample data for the transaction example.
CREATE TABLE dbo.BankAccounts (
    AccountID INT PRIMARY KEY,
    Balance decimal(10,2)
);
INSERT INTO dbo.BankAccounts
VALUES (1, 100.00), (2, 200.00), (3, 300.00);
GO

-- Shows the initial account balances.
SELECT * FROM dbo.BankAccounts;
GO

-- Creates a stored procedure that transfers funds between two accounts.
-- The transaction updates both account balances as a single operationn.
CREATE OR ALTER PROCEDURE dbo.TransferFunds (@FromAccount AS INT, @ToAccount AS INT, @Amount AS decimal(10,2))
AS
BEGIN TRANSACTION;
UPDATE dbo.BankAccounts
    SET Balance -= @Amount
    WHERE AccountID = @FromAccount;
UPDATE dbo.BankAccounts
    SET Balance += @Amount
    WHERE AccountID = @ToAccount;
COMMIT TRANSACTION;

-- Executes the transaction and displays the updated balances.
EXEC dbo.TransferFunds 1, 3, 50.00;
SELECT * FROM dbo.BankAccounts;
