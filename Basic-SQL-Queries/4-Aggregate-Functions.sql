-- Calculates a total using SUM()
SELECT SUM(SalespersonPersonID) AS TotalSales
FROM Orders.Sales;
GO

-- Counts suppliers per payment period
-- Shows only payment periods used by more than one supplier
SELECT PaymentDays,
  COUNT(*) AS TotalSuppliers
FROM Orders.Suppliers
GROUP BY PaymentDays
HAVING COUNT(*) > 1
ORDER BY TotalSuppliers DESC;
GO
