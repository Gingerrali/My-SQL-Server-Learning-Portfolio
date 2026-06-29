-- Example of a table-valued function that returns the latest sales details for the specified customer
-- Uses INNER JOINs to combine data from multiple tables
CREATE OR ALTER FUNCTION fn_SaleStatistics (@CustomerID AS INT)
RETURNS TABLE
AS RETURN
SELECT
    Orders.Sales.OrderID AS 'Order Number',
    Orders.Sales.CustomerID AS 'Customer Number',
    Orders.Customers.CustomerName AS 'Customer Name',
    Orders.Sales.OrderDate AS 'Order Date',
    Orders.Sales.ExpectedDeliveryDate AS 'Delivery Date',
    Orders.OrderLines.OrderLineID AS 'Line Number',
    Orders.OrderLines.Description AS 'Product Description'
FROM Orders.Sales
    INNER JOIN Orders.OrderLines ON Sales.OrderID = OrderLines.OrderID
    INNER JOIN Orders.Customers ON Sales.CustomerID = Customers.CustomerID
WHERE Sales.OrderID =
    (SELECT TOP 1 Sales.OrderID
     FROM Orders.Sales
     WHERE Sales.CustomerID = @CustomerID
     ORDER BY Sales.OrderID DESC)
;
GO

-- Executes the function for a sample customer
SELECT * FROM fn_SaleStatistics(104);
GO

-- Deletes the function
DROP FUNCTION dbo.fn_SaleStatistics;
GO
