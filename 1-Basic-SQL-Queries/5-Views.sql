-- Creates a view.
CREATE VIEW Orders.ActivePurchasesView
AS
SELECT OrderID, 
  CustomerID, 
  OrderDate, 
  ExpectedDeliveryDate, 
  CustomerPurchaseOrderNumber
FROM Orders.Sales
WHERE SalespersonPersonID > 3;
GO

-- Displays the view data.
SELECT * FROM Orders.ActivePurchasesView;

-- Alters the view by adding aliases.
ALTER VIEW Orders.ActivePurchasesView
AS
SELECT OrderID AS 'System Serial Number', 
  CustomerID AS 'Customer Number', 
  OrderDate AS 'Order Date', 
  ExpectedDeliveryDate AS 'Delivery Date', 
  CustomerPurchaseOrderNumber AS 'Order Number'
FROM Orders.Sales
WHERE SalespersonPersonID > 3;
GO

-- Adds SCHEMABINDING.
ALTER VIEW Orders.ActivePurchasesView
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

-- Attempts to remove a referenced column (should give an error).
ALTER TABLE Orders.Sales
DROP COLUMN CustomerID;

-- Deletes the view.
DROP VIEW Orders.ActivePurchasesView;
GO
