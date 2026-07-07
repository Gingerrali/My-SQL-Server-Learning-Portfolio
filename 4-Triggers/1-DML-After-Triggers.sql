-- Creates an audit table to store inserted records.
CREATE TABLE dbo.ColourAudit (
    AuditID INT IDENTITY PRIMARY KEY,
    ColourName nvarchar(20),
    TimeAdded datetime2);
GO

-- Automatically logs newly inserted records into the audit table.
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


    
-- Creates the main and archive tables used by the trigger.
CREATE TABLE dbo.Vendors (
    VendorID int IDENTITY PRIMARY KEY,
    VendorName nvarchar(50)
);
CREATE TABLE dbo.VendorArchive (
    VendorID int PRIMARY KEY,
    VendorName nvarchar(50),
    DateArchived datetime2
);
INSERT INTO dbo.Vendors
VALUES ('KinetEco');
SELECT * FROM dbo.Vendors;
GO

-- Creates an AFTER DELETE trigger to save deleted records in an archive table.
CREATE TRIGGER dbo.ArchiveVendors
ON dbo.Vendors
AFTER DELETE
AS
SET NOCOUNT ON;
INSERT INTO VendorArchive (VendorID, VendorName)
    SELECT deleted.VendorID, deleted.VendorName
    FROM deleted;
UPDATE VendorArchive
    SET DateArchived = GETDATE()
    FROM deleted
    WHERE VendorArchive.VendorID = deleted.VendorID;
;
GO

-- Tests the trigger and verifies the archive table.
DELETE FROM dbo.Vendors
WHERE VendorID = 1;
SELECT * FROM dbo.Vendors;
SELECT * FROM dbo.VendorArchive;
GO
