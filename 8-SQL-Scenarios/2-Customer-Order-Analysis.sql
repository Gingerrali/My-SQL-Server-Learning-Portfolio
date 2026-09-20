-- Scenario:
-- The company needs a customer order analysis to identify
-- the most active customers and those generating the highest revenue,
-- then to categorize customers based on their total revenue.

-- Displays the tables used for the analysis
SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.OrderLines;
GO

-- Creates a query that analyzes customers' total orders, purchased quantities, and total revenue.
SELECT Customers.CustomerID, 
  CustomerName AS Name, 
  COUNT(DISTINCT Orders.OrderID) AS TotalOrders,
  SUM(Orderlines.Quantity) AS TotalQuantityPurchased,
  SUM((Orderlines.Quantity)*(Orderlines.UnitPrice)) AS TotalRevenue
FROM Sales.Customers
INNER JOIN Sales.Orders
  ON Sales.Customers.CustomerID = Sales.Orders.CustomerID
INNER JOIN Sales.OrderLines
  ON Sales.Orders.OrderID = Sales.Orderlines.OrderID
GROUP BY Customers.CustomerID,
  Customers.CustomerName
ORDER BY TotalRevenue DESC;
GO
