-- Uses DEFAULT values when no value is provided for a NOT NULL column.
CREATE TABLE Birthdays (
    PersonName nvarchar(100) NOT NULL,
    Birthday date NOT NULL DEFAULT '1/1/1111')
INSERT INTO Birthdays (PersonName)
VALUES ('Bethany');
INSERT INTO Birthdays (PersonName, Birthday)
VALUES ('Jin', '5/17/1982');
GO

-- Displays the inserted data and deletes the table.
SELECT * FROM Birthdays;
DROP TABLE Birthdays;
GO


    
-- Uses ISNULL to replace NULL values with 1.
SELECT SupplierID,
       SupplierName,
       ISNULL(DeliveryMethodID, 1)
FROM Orders.Suppliers;
GO


    
-- Replaces NULL values with a default text.
SELECT Customers.CustomerName,
       Customers.CustomerCategoryID,
       ISNULL(Sales.Comments, 'No Comments') AS Comments
FROM Orders.Customers
    LEFT JOIN Orders.Sales
    ON Customers.CustomerID = Sales.CustomerID;
