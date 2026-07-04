-- Calculates a total using SUM().
SELECT SUM(SalespersonPersonID) AS TotalSales
FROM Orders.Sales;
GO

-- Counts suppliers per payment period.
-- Shows only payment periods used by more than one supplier.
SELECT PaymentDays,
  COUNT(*) AS TotalSuppliers
FROM Orders.Suppliers
GROUP BY PaymentDays
HAVING COUNT(*) > 1
ORDER BY TotalSuppliers DESC;
GO

-- MAX, MIN, AVG aggregate functions example.
SELECT
    MAX(PaymentDays) AS LongestPeriodRemaining,
    MIN(PaymentDays) AS ShortestPeriodRemaining,
    AVG(PaymentDays) AS AverageRemainingTime
FROM Orders.Suppliers;
GO
