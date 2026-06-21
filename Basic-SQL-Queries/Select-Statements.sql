SELECT * FROM Orders.Suppliers;
GO

SELECT TOP 1 * FROM Orders.Suppliers;
GO

SELECT TOP 1000 * FROM Orders.Suppliers;
GO

SELECT Suppliers.SupplierName,
    Suppliers.SupplierCategoryID AS Category,
    Suppliers.PrimaryContactPersonID AS PrimaryContact,
    Suppliers.AlternateContactPersonID AS SecondaryContact,
    Suppliers.DeliveryMethodID
FROM Orders.Suppliers;

SELECT GETDATE() AS Today;
GO
    
SELECT RAND() AS Random;
GO
