CREATE TABLE dbo.Colours (
    ColourID INT PRIMARY KEY,
    ColourName NVARCHAR(20),
    LastEditedBy INT
);
GO

INSERT INTO dbo.Colours (ColourID, ColourName, LastEditedBy)
VALUES
(1, 'Azure', 1),
(2, 'Beige', 1),
(3, 'Black', 1),
(4, 'Blue', 1),
(5, 'Charcoal', 1),
(6, 'Chartreuse', 1),
(7, 'Cyan', 1),
(8, 'Dark Brown', 1),
(9, 'Dark Green', 1),
(10, 'Fuchsia', 1);
GO
