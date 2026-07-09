-- The following examples demonstrate SQL Server Ledger, which uses blockchain 
-- technology to help verify that data has not been modified without authorization.

-- Creates an updatable ledger table that allows data to be updated 
-- while automatically saving every previous version of the data.
CREATE TABLE Orders.Accounts (
    CustomerID INT NOT NULL PRIMARY KEY CLUSTERED,
    FirstName VARCHAR (50) NOT NULL,
    Balance DECIMAL (10,2) NOT NULL)
WITH 
(
 SYSTEM_VERSIONING = ON (HISTORY_TABLE = Orders.AccountsHistory),
 LEDGER = ON
);
GO

-- Adds sample customer accounts.    
INSERT INTO Orders.Accounts VALUES
(1, 'Ruiz', 50.00),
(2, 'Katherine', 100.00),
(3, 'Mica', 80.00),
(4, 'Shannon', 75.00);
GO

-- Updates the balance to demonstrate how the ledger records the change.
UPDATE Orders.Accounts
SET Balance = 60.00 
WHERE CustomerID = 2;
GO

-- Displays the current data, and adds system-generated ledger columns
-- that automatically track the history of each record.
SELECT CustomerID                        
   ,FirstName
   ,Balance
   ,ledger_start_transaction_id
   ,ledger_end_transaction_id
   ,ledger_start_sequence_number
   ,ledger_end_sequence_number
 FROM Orders.Accounts;
 GO

-- Shows the history table with previous record versions
-- and the ledger table with all recorded data changes.
SELECT * FROM Orders.AccountsHistory;
SELECT * FROM Orders.Accounts_Ledger
    ORDER BY ledger_transaction_id, ledger_sequence_number;               
GO

-- Bonus: Creates a database with the ledger feature enabled.
CREATE DATABASE LedgerDB
WITH LEDGER = ON;
GO
