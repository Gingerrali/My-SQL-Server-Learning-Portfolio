CREATE TABLE Orders.Stock (
    StockItemID INT PRIMARY KEY,
    StockItemName NVARCHAR(100),
    ColourID INT,
    Brand NVARCHAR(20),
    Size NVARCHAR(20),
    MarketingComments NVARCHAR(100)
);
INSERT INTO Orders.Stock (StockItemID, StockItemName, ColourID, MarketingComments)
VALUES (1, 'USB missile launcher', 9, 'Complete with 12 projectiles');
INSERT INTO Orders.Stock (StockItemID, StockItemName, ColourID)
VALUES (2, 'Office cube periscope', 3);
INSERT INTO Orders.Stock (StockItemID, StockItemName, Brand, Size)
VALUES (3, 'RC toy sedan car with remote control', 'Northwind', '1/50 scale');
INSERT INTO Orders.Stock (StockItemID, StockItemName, Size, MarketingComments)
VALUES (4, 'Big wheel monster truck', '1/12 scale', 'Suits child to 20 kg');
GO

SELECT Stock.StockItemID,
    Stock.StockItemName,
    Colours.ColourName,
    Stock.Brand,
    Stock.Size,
    COALESCE (ColourName, Brand, Size) AS ColourBrandSize,
    MarketingComments,
    CASE
        WHEN (ColourName IS NOT NULL) THEN CONCAT('Colour is ', ColourName)
        WHEN (Brand IS NOT NULL) THEN CONCAT('Brand is ', Brand)
        WHEN (Size IS NOT NULL) THEN CONCAT('Size is ', Size)
        ELSE 'No Information Available'
        END AS CatalogDescription
FROM Orders.Stock LEFT JOIN dbo.Colours
    ON Stock.ColourID = Colours.ColourID
ORDER BY StockItemId;
GO
