SELECT * FROM Orders.Sales
WHERE PickedByPersonID > 0;
GO
  
SELECT * FROM Orders.Sales
WHERE SalespersonPersonID BETWEEN 0 AND 10;
GO
  
SELECT OrderID, 
  CustomerID, 
  SalespersonPersonID, 
  OrderDate
FROM Orders.Sales
WHERE SalespersonPersonID BETWEEN 0 AND 10
AND OrderDate = '2013-01-01';
GO

SELECT * FROM Orders.Sales
WHERE SalespersonPersonID IN (2, 7, 8);
GO
  
SELECT * FROM Orders.Suppliers
WHERE SupplierCategoryID = 2
OR SupplierCategoryID = 3;
GO

SELECT * FROM Orders.Suppliers
WHERE NOT SupplierCategoryID = 2;
GO
