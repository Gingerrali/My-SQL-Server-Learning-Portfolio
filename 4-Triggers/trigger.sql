CREATE TABLE dbo.ColourAudit (
    AuditID INT IDENTITY PRIMARY KEY,
    ColourName nvarchar(20),
    TimeAdded datetime2);
GO

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

EXEC dbo.uspInsertColour 'Neon';
EXEC dbo.uspInsertColour 'Baby Pink';
GO

SELECT * FROM dbo.Colours;
SELECT * FROM dbo.ColourAudit;
GO

CREATE TABLE Orders.SalesAudit (
    AuditID INT IDENTITY PRIMARY KEY,
    CustomerID nvarchar(20),
    TimeAdded datetime2);

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

SELECT * FROM Orders.SalesAudit;

EXEC Orders.uspHowManyPurchasesPerCustomer 107;
