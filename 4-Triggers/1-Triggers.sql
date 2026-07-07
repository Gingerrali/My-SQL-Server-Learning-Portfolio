-- Creates an audit table to store inserted records.
CREATE TABLE dbo.ColourAudit (
    AuditID INT IDENTITY PRIMARY KEY,
    ColourName nvarchar(20),
    TimeAdded datetime2);
GO

-- Automatically logs newly inserted records into the audit table.
CREATE TRIGGER dbo.ColourChangeLog
ON dbo.Colours
AFTER INSERT, UPDATE
AS
    INSERT INTO dbo.ColourAudit (ColourName, TimeAdded)
    VALUES (
        (SELECT Inserted.ColourName FROM Inserted),
        GETDATE()
    );
;
GO

-- Sample inserts to test the trigger.
EXEC dbo.uspInsertColour 'Neon';
EXEC dbo.uspInsertColour 'Baby Pink';
GO

-- Verifies that the trigger logged the inserted records.
SELECT * FROM dbo.Colours;
SELECT * FROM dbo.ColourAudit;
GO

-- Creates an audit table that tracks stored procedure executions.
CREATE TABLE Orders.SalesAudit (
    AuditID INT IDENTITY PRIMARY KEY,
    CustomerID INT,
    TimeAdded datetime2);
GO

-- Stored procedure that retrieves customer information and triggers automatic audit logging.
CREATE OR ALTER PROCEDURE Orders.uspHowManyPurchasesPerCustomer (@Customer AS INT)
AS 
SELECT CustomerID, CustomerName
FROM Orders.Customers
WHERE CustomerID = @Customer;
SELECT CustomerID, SalespersonPersonID
FROM Orders.Sales
WHERE CustomerID = @Customer;
INSERT INTO Orders.SalesAudit (CustomerID, TimeAdded)
VALUES (@Customer, GETDATE()
);
GO

-- Executes the procedure using a sample CustomerID.
EXEC Orders.uspHowManyPurchasesPerCustomer 107;
GO

-- Checks if the trigger logged the execution successfully.
SELECT * FROM Orders.SalesAudit;
GO

