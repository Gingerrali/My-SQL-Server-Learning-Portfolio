CREATE TABLE Orders.TaxID (
    CustomerID INT NOT NULL PRIMARY KEY CLUSTERED,
    TaxID VARCHAR (50) NOT NULL)
WITH 
(
 LEDGER = ON (APPEND_ONLY = ON)
);
GO

INSERT INTO Orders.TaxID VALUES
(1, '000-12-3456'),
(2, '123-45-6789'),
(3, '987-65-4321'),
(4, '001-02-0345');
GO

UPDATE Orders.TaxID
SET TaxID = '999-99-9999'
WHERE CustomerID = 3;
GO

DELETE FROM Orders.TaxID					    
WHERE CustomerID = 3;
GO

DROP TABLE Orders.TaxID;
GO

ако опитаме да изтрием цялата таблица, ще изглежда изтрита, но ще всъщност ще се премести в архив 
(в Drpped Ledger Tables)
