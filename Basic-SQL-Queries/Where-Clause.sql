-- Filters records with values greater than a specific number
SELECT * FROM Orders.Sales
WHERE PickedByPersonID > 0;
GO

-- Filters records within a range of values
SELECT * FROM Orders.Sales
WHERE SalespersonPersonID BETWEEN 0 AND 10;
GO

-- Combines several conditions
SELECT OrderID, 
  CustomerID, 
  SalespersonPersonID, 
  OrderDate
FROM Orders.Sales
WHERE SalespersonPersonID BETWEEN 0 AND 10
AND OrderDate = '2013-01-01';
GO

-- Filters records, matching any value from the mentioned
SELECT * FROM Orders.Sales
WHERE SalespersonPersonID IN (2, 7, 8);
GO

-- Returns records that meet either of the conditions mentioned
SELECT * FROM Orders.Suppliers
WHERE SupplierCategoryID = 2
OR SupplierCategoryID = 3;
GO

-- Excludes records that meet a condition mentioned
SELECT * FROM Orders.Suppliers
WHERE NOT SupplierCategoryID = 2;
GO

-- Returns records with NULL values
SELECT OrderID, 
  CustomerID, 
  SalespersonPersonID, 
  BackorderOrderID
FROM Orders.Sales
WHERE BackorderOrderID IS NULL;
GO
