-- Scenario:
-- This project analyses current stock levels, warehouse replenishments,
-- and inventory movements to identify stock risks and track inventory changes over time.
SELECT * FROM dbo.Products;
SELECT * FROM dbo.WarehouseReceiving;
SELECT * FROM dbo.InventoryAudit;


Таск 1 решение
-- Classifies products based on their current stock levels
-- and sorts them by quantity in ascending order.
SELECT ProductID,
ProductName,
QuantityOnHand,
LastRestocked,
CASE WHEN QuantityOnHand = 0 THEN 'Out of stock'
WHEN QuantityOnHand BETWEEN 1 AND 10 THEN 'Low stock'
WHEN QuantityOnHand > 10 THEN 'In stock'
END AS StockStatus
FROM dbo.Products
ORDER BY QuantityOnHand ASC;
GO

-- решение на 2
WITH ProductReplenishment AS (
    SELECT 
        Products.ProductID,
        ProductName, 
        QuantityOnHand,
        ISNULL(SUM(WarehouseReceiving.QuantityReceived), 0) AS TotalQuantityReceived
    FROM dbo.Products
    LEFT JOIN dbo.WarehouseReceiving
        ON Products.ProductID = WarehouseReceiving.ProductID
    GROUP BY 
        Products.ProductID,
        ProductName, 
        QuantityOnHand
)
SELECT * FROM ProductReplenishment;
GO

-- reshenie 3
SELECT ProductName,
EventTimestamp,
OldQuantity,
NewQuantity,
NewQuantity - OldQuantity AS QuantityDifference,
CASE WHEN NewQuantity > OldQuantity THEN 'Stock Increase'
WHEN NewQuantity < OldQuantity THEN 'Stock Decrease'
ELSE 'No Change'
END AS MovementType
FROM dbo.InventoryAudit
INNER JOIN dbo.Products
ON InventoryAudit.ProductID = Products.ProductID
ORDER BY EventTimestamp DESC;
GO

-- reshenie 4
WITH InventorySummary AS (
    SELECT ProductID,
    COUNT(EventTimestamp) AS InventoryEvents,
    SUM(CASE 
    WHEN NewQuantity > OldQuantity
    THEN NewQuantity - OldQuantity
    END) AS TotalQuantityAdded,
    SUM(CASE 
    WHEN NewQuantity < OldQuantity
    THEN OldQuantity - NewQuantity
    END) AS TotalQuantityRemoved,
    SUM(NewQuantity - OldQuantity) AS NetQuantityChange
    FROM dbo.InventoryAudit
    GROUP BY ProductID
    )
    SELECT ProductName, 
    ISNULL(InventoryEvents, 0) AS InventoryEvents,
    ISNULL(TotalQuantityAdded, 0) AS TotalQuantityAdded,
    ISNULL(TotalQuantityRemoved, 0) AS TotalQuantityRemoved,
    ISNULL(NetQuantityChange, 0) AS NetQuantityChange
    FROM InventorySummary
    RIGHT JOIN dbo.Products
    ON InventorySummary.ProductID = Products.ProductID;
    GO
