-- Creates the main table for storing product stock information.
CREATE TABLE dbo.Products (
    ProductID int IDENTITY PRIMARY KEY,
    ProductName nvarchar(50),
    QuantityOnHand int,
    LastRestocked datetime2,
    LastSold datetime2);
GO

-- Creates an audit table that keeps a history of quantity changes for each product.
CREATE TABLE dbo.InventoryAudit (
    AuditLogID int IDENTITY PRIMARY KEY,
    ProductID int,
    EventTimestamp datetime2,
    OldQuantity int,
    NewQuantity int);
GO

--  Creates the warehouse table, used to record incoming stock.
CREATE TABLE WarehouseReceiving (
    ReceiptID int IDENTITY PRIMARY KEY,
    ProductID int,
    QuantityReceived int);
GO

-- Adds the initial products.  
INSERT INTO dbo.Products (ProductName, QuantityOnHand)
VALUES ('Solar Charger', 0), ('Wind Turbine', 0), ('Emergency Radio', 0), ('Rechargable Battery', 0);
GO

-- Records every product quantity change in the audit table.  
CREATE TRIGGER dbo.InventoryChangeLog
ON dbo.Products
AFTER UPDATE
AS
SET NOCOUNT ON;
IF UPDATE(QuantityOnHand)
    INSERT INTO dbo.InventoryAudit (ProductID, EventTimestamp, OldQuantity, NewQuantity)
    VALUES (
        (SELECT Inserted.ProductID FROM Inserted),
        GETDATE(),
        (SELECT Deleted.QuantityOnHand FROM Deleted),
        (SELECT Inserted.QuantityOnHand FROM Inserted)
    );
;
GO

-- Detects whether a product was sold or restocked, then updates the correct timestamp.
CREATE TRIGGER dbo.ProductTimestamps
ON dbo.Products
AFTER UPDATE
AS
SET NOCOUNT ON;
IF (SELECT Inserted.QuantityOnHand FROM Inserted) < (SELECT Deleted.QuantityOnHand FROM Deleted)
    UPDATE dbo.Products
        SET LastSold = GETDATE()
        FROM Inserted
        WHERE Inserted.ProductID = Products.ProductID;
ELSE IF (SELECT Inserted.QuantityOnHand FROM Inserted) > (SELECT Deleted.QuantityOnHand FROM Deleted)
    UPDATE dbo.Products
        SET LastRestocked = GETDATE()
        FROM Inserted
        WHERE Inserted.ProductID = Products.ProductID;
;
GO

-- Updates the product quantity when new stock is received.
CREATE TRIGGER dbo.RestockProducts
ON dbo.WarehouseReceiving
AFTER INSERT
AS
SET NOCOUNT ON;
UPDATE dbo.Products
    SET QuantityOnHand += (SELECT Inserted.QuantityReceived FROM Inserted)
    FROM Inserted
    WHERE Inserted.ProductID = Products.ProductID;
;
GO

-- Tests the first trigger by increasing the product quantity.
UPDATE dbo.Products
SET QuantityOnHand = 20
WHERE ProductID = 3;
GO

SELECT * FROM dbo.Products;
SELECT * FROM dbo.InventoryAudit;
SELECT * FROM dbo.WarehouseReceiving;
GO

-- Tests the second trigger by decreasing the product quantity.
UPDATE dbo.Products
SET QuantityOnHand = 15
WHERE ProductID = 3;
SELECT * FROM dbo.Products;
SELECT * FROM dbo.InventoryAudit;
SELECT * FROM dbo.WarehouseReceiving;
GO

-- Tests the third trigger by adding new stock to the warehouse.  
INSERT INTO dbo.WarehouseReceiving (ProductID, QuantityReceived)
VALUES (2, 20);
SELECT * FROM dbo.Products;
SELECT * FROM dbo.InventoryAudit;
SELECT * FROM dbo.WarehouseReceiving;
GO
