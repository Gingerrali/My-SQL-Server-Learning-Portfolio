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

-- Filters the analysis to show only customers with more than 5 orders and a total revenue above 5000.
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
HAVING COUNT(DISTINCT Sales.OrderID) > 5
  AND SUM(Orderlines.Quantity * Orderlines.UnitPrice) > 5000
ORDER BY TotalRevenue DESC;
GO

-- Uses a CTE to calculate each customer's total orders, purchased quantities, and total revenue,
-- then joins the result with the Customers table to display the customer name.
-- Categorizes customers based on their total revenue.
WITH CustomerSales AS (
  SELECT CustomerID,
  COUNT(DISTINCT Sales.OrderID) AS TotalOrders,
  SUM(Orderlines.Quantity) AS TotalQuantityPurchased,
  SUM((Orderlines.Quantity)*(Orderlines.UnitPrice)) AS TotalRevenue
FROM Orders.Sales
INNER JOIN Orders.OrderLines
  ON Orders.Sales.OrderID = Orders.Orderlines.OrderID
GROUP BY Sales.CustomerID
)
  SELECT CustomerSales.CustomerID, 
  CustomerName, 
  TotalOrders, 
  TotalQuantityPurchased, 
  TotalRevenue,
  CASE WHEN TotalRevenue >= 5000 THEN 'VIP'
  WHEN TotalRevenue >= 2000 THEN 'HighValue'
  WHEN TotalRevenue >= 1000 THEN 'Regular'
  ELSE 'LowValue'
  END AS CustomerCategory
  FROM CustomerSales
  JOIN Orders.Customers
    ON CustomerSales.CustomerID = Orders.Customers.CustomerID
  ORDER BY TotalRevenue DESC;
GO

-- Creates a temporary table to store customers with a total revenue above 10000.
-- Displays the results from the highest to the lowest total revenue.
CREATE TABLE #TopCustomers (
    CustomerID INT, CustomerName VARCHAR(50), TotalOrders INT, TotalQuantityPurchased INT, TotalRevenue decimal(10,2)
);
INSERT INTO #TopCustomers (CustomerID, CustomerName, TotalOrders, TotalQuantityPurchased, TotalRevenue)
  SELECT Customers.CustomerID, 
    CustomerName, 
    COUNT(DISTINCT Sales.OrderID),
    SUM(Orderlines.Quantity),
    SUM((Orderlines.Quantity)*(Orderlines.UnitPrice))
  FROM Orders.Customers
  INNER JOIN Orders.Sales
    ON Orders.Customers.CustomerID = Orders.Sales.CustomerID
  INNER JOIN Orders.OrderLines
    ON Orders.Sales.OrderID = Orders.Orderlines.OrderID
  GROUP BY Customers.CustomerID,
    Customers.CustomerName
  HAVING SUM(Orderlines.Quantity * Orderlines.UnitPrice) > 10000;
GO

SELECT * FROM #TopCustomers
ORDER BY TotalRevenue DESC;
GO

-- Creates a stored procedure that returns only customers meeting the specified minimum total revenue.
CREATE OR ALTER PROCEDURE Orders.GetCustomersByRevenue (@MinimumRevenue decimal(10,2))
AS
BEGIN
SELECT * FROM #TopCustomers
WHERE TotalRevenue >= @MinimumRevenue;
END;
GO

EXEC Orders.GetCustomersByRevenue
    @MinimumRevenue = 11000;
GO


