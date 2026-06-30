-- Returns all records
SELECT * FROM Orders.Suppliers;
GO

-- Returns first record
SELECT TOP 1 * FROM Orders.Suppliers;
GO

-- Returns first 1000 records
SELECT TOP 1000 * FROM Orders.Suppliers;
GO

-- Uses alias names
SELECT Suppliers.SupplierName,
    Suppliers.SupplierCategoryID AS Category,
    Suppliers.PrimaryContactPersonID AS PrimaryContact,
    Suppliers.AlternateContactPersonID AS SecondaryContact,
    Suppliers.DeliveryMethodID
FROM Orders.Suppliers;
GO

-- Removes duplicates
SELECT DISTINCT TOP 10 PaymentDays 
FROM Orders.Suppliers;
GO

-- Sorts by payment period in ascending order
SELECT TOP 1000 * FROM Orders.Suppliers
ORDER BY PaymentDays ASC;
GO

-- Returns the current system date and time
SELECT GETDATE() AS Today;
GO

-- Generates a random number between 0 and 1
SELECT RAND() AS Random;
GO
