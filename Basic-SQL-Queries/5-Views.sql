-- Creating the view
CREATE VIEW Orders.OrdersView
AS
SELECT OrderID, 
  CustomerID, 
  OrderDate, 
  ExpectedDeliveryDate, 
  CustomerPurchaseOrderNumber
FROM Orders.Sales
WHERE SalespersonPersonID > 3;
GO

-- Checking the results from the view
SELECT * FROM Orders.OrdersView;

-- Altering the view by adding aliases
ALTER VIEW Orders.OrdersView
AS
SELECT OrderID AS 'System Serial Number', 
  CustomerID AS 'Customer Number', 
  OrderDate AS 'Order Date', 
  ExpectedDeliveryDate AS 'Delivery Date', 
  CustomerPurchaseOrderNumber AS 'Order Number'
FROM Orders.Sales
WHERE SalespersonPersonID > 3;
GO

-- Forbid to change the table, referencing the view
ALTER VIEW Orders.OrdersView
WITH SCHEMABINDING
AS
SELECT OrderID AS 'System Serial Number', 
  CustomerID AS 'Customer Number', 
  OrderDate AS 'Order Date', 
  ExpectedDeliveryDate AS 'Delivery Date', 
  CustomerPurchaseOrderNumber AS 'Order Number'
FROM Orders.Sales
WHERE SalespersonPersonID > 3;
GO

-- Alteration should not be allowed, as table part of a view with schemabinding
ALTER TABLE Orders.Sales
DROP COLUMN CustomerID;
