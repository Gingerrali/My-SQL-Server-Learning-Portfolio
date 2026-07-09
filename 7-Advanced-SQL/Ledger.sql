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

INSERT INTO Orders.Accounts VALUES
(1, 'Ruiz', 50.00),
(2, 'Katherine', 100.00),
(3, 'Mica', 80.00),
(4, 'Shannon', 75.00);
GO

UPDATE Orders.Accounts
SET Balance = 60.00 
WHERE CustomerID = 2;
GO

SELECT CustomerID                        
   ,FirstName
   ,Balance
   ,ledger_start_transaction_id
   ,ledger_end_transaction_id
   ,ledger_start_sequence_number
   ,ledger_end_sequence_number
 FROM Orders.Accounts;
 GO

SELECT * FROM Orders.AccountsHistory;
SELECT * FROM Orders.Accounts_Ledger
    ORDER BY ledger_transaction_id, ledger_sequence_number;               
GO
