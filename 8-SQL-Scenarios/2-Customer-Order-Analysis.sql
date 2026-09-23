-- Scenario:
-- The company needs a customer order analysis to identify
-- the most active customers and those generating the highest revenue,
-- then to categorize customers based on their total revenue.

-- Displays the tables used for the analysis
SELECT * FROM Orders.Customers;
SELECT * FROM Orders.Sales;
SELECT * FROM Orders.OrderLines;
GO

-- Creates a query that analyzes customers' total orders, purchased quantities, and total revenue.
SELECT Customers.CustomerID, 
  CustomerName AS Name, 
  COUNT(DISTINCT Sales.OrderID) AS TotalOrders,
  SUM(Orderlines.Quantity) AS TotalQuantityPurchased,
  SUM((Orderlines.Quantity)*(Orderlines.UnitPrice)) AS TotalRevenue
FROM Orders.Customers
INNER JOIN Orders.Sales
  ON Orders.Customers.CustomerID = Orders.Sales.CustomerID
INNER JOIN Orders.OrderLines
  ON Orders.Sales.OrderID = Orders.Orderlines.OrderID
GROUP BY Customers.CustomerID,
  Customers.CustomerName
ORDER BY TotalRevenue DESC;
GO
