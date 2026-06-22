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
