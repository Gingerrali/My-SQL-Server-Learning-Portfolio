-- Creates an append-only ledger table where existing records
-- cannot be changed or deleted.
CREATE TABLE Orders.TaxID (
    CustomerID INT NOT NULL PRIMARY KEY CLUSTERED,
    TaxID VARCHAR (50) NOT NULL)
WITH 
(
 LEDGER = ON (APPEND_ONLY = ON)
);
GO

-- Adds sample records to the table.    
INSERT INTO Orders.TaxID VALUES
(1, '000-12-3456'),
(2, '123-45-6789'),
(3, '987-65-4321'),
(4, '001-02-0345');
GO

-- Attempts to update a record, which is not allowed
-- in an append-only ledger table, and returns an error.
UPDATE Orders.TaxID
SET TaxID = '999-99-9999'
WHERE CustomerID = 3;
GO

-- Attempts to delete a record, which also returns an error.
DELETE FROM Orders.TaxID					    
WHERE CustomerID = 3;
GO

-- Attempts to drop the table. The table appears to be deleted, but SQL server
-- automatically archives it in Dropped Ledger Tables.
DROP TABLE Orders.TaxID;
GO
