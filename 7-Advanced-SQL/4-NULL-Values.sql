CREATE TABLE Birthdays (
    PersonName nvarchar(100) NOT NULL,
    Birthday date NOT NULL DEFAULT '1/1/1111')
INSERT INTO Birthdays (PersonName)
VALUES ('Bethany');
INSERT INTO Birthdays (PersonName, Birthday)
VALUES ('Jin', '5/17/1982');
GO

SELECT * FROM Birthdays;
DROP TABLE Birthdays;




Тук, някои от показателите в DeliveryMethodID са NULL стойности, за да ги заменим със стойност 1 примерно, пишем: 
SELECT SupplierID,
       SupplierName,
       ISNULL(DeliveryMethodID, 1)
FROM Orders.Suppliers;
GO
