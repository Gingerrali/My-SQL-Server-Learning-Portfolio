USE GlobalTrade;
GO

CREATE TABLE dbo.Actors (
    actor_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    nationality VARCHAR(50)
);
GO

INSERT INTO dbo.Actors (actor_id, name, dob, nationality)
VALUES
(1, 'Adriana Caselotti', '1964-03-16', 'American'),
(10, 'Arnold Schwarzenegger', '1947-07-30', 'Austrian/American'),
(100, 'Meryl Streep', '1949-06-22', 'American'),
(101, 'Michael Keaton', '1951-09-05', 'American'),
(102, 'Michael B. Jordan', '1987-02-09', 'American'),
(103, 'Mike Myers', '1963-05-25', 'Canadian'),
(104, 'Miles Teller', '1987-02-20', 'American'),
(105, 'Morgan Freeman', '1937-06-01', 'American'),
(106, 'Neve Campbell', '1973-10-03', 'Canadian'),
(107, 'Olivia Newton-John', '1948-09-26', 'Australian'),
(108, 'Orlando Bloom', '1900-01-01', 'N/A'),
(109, 'Orson Welles', '1915-05-06', 'American'),
(11, 'Barry Humphries', '1900-01-01', 'N/A'),
(110, 'Paige O''Hara', '1956-05-10', 'American'),
(111, 'Patrick Swayze', '1952-08-18', 'American'),
(112, 'Paul Newman', '1925-01-26', 'American'),
(113, 'Paul Walker', '1973-09-12', 'American'),
(114, 'Paxton Whitehead', '1900-01-01', 'N/A'),
(115, 'Rami Malek', '1981-05-12', 'American'),
(116, 'Randy Quaid', '1950-10-01', 'American'),
(117, 'Rex Harrison', '1900-01-01', 'N/A'),
(118, 'Richard Gere', '1949-08-31', 'American'),
(119, 'Robin Williams', '1951-07-21', 'American'),
(12, 'Bill Murray', '1950-09-21', 'American'),
(120, 'Robin Wright', '1966-04-08', 'American'),
(121, 'Robert Armstrong', '1890-11-20', 'American'),
(122, 'Robert Downey Jr.', '1965-04-04', 'American'),
(123, 'Robert Redford', '1936-08-18', 'American'),
(124, 'Robby Benson', '1956-01-21', 'American'),
(125, 'Rod Steiger', '1900-01-01', 'N/A'),
(126, 'Roger Moore', '1900-01-01', 'N/A'),
(127, 'Ronnie Howard', '1900-01-01', 'N/A'),
(128, 'Russell Crowe', '1964-04-07', 'New Zealander'),
(129, 'Ryan Gosling', '1980-11-12', 'Canadian'),
(13, 'Bill Skarsgård', '1990-08-09', 'Swedish'),
(130, 'Ryan Reynolds', '1976-10-23', 'Canadian'),
(131, 'Sam Neill', '1947-09-14', 'New Zealander'),
(132, 'Sam Worthington', '1976-08-02', 'Australian'),
(133, 'Sandra Bullock', '1964-07-26', 'American'),
(134, 'Scarlett Johansson', '1984-11-22', 'American');
GO

SELECT * FROM dbo.Actors;

CREATE TABLE Orders.OrderLines (
    OrderLineID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    StockItemID INT NOT NULL,
    Description NVARCHAR(100) NOT NULL,
    PackageTypeID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    TaxRate DECIMAL(5,3) NOT NULL,
    PickedQuantity INT NOT NULL,
    PickingCompletedWhen DATETIME2 NOT NULL,
    LastEditedBy INT NOT NULL,
    LastEditedWhen DATETIME2 NOT NULL
);
GO

INSERT INTO Orders.OrderLines
VALUES
(1, 5, 164, '32 mm Double sided bubble wrap 50m', 7, 50, 112.00, 15.000, 50, '2013-01-02 11:00:00', 4, '2013-01-02 11:00:00'),
(2, 1, 67, 'Ride on toy sedan car (Black) 1/12 scale', 7, 10, 230.00, 15.000, 10, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(3, 2, 50, 'Developer joke mug - old C developers never die (White)', 7, 9, 13.00, 15.000, 9, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(4, 6, 89, '"The Gu" red shirt XML tag t-shirt (Black) 3XS', 7, 72, 18.00, 15.000, 72, '2013-01-02 11:00:00', 4, '2013-01-02 11:00:00'),
(5, 6, 171, '32 mm Anti static bubble wrap (Blue) 10m', 7, 90, 32.00, 15.000, 90, '2013-01-02 11:00:00', 4, '2013-01-02 11:00:00'),
(6, 2, 10, 'USB food flash drive - chocolate bar', 7, 9, 32.00, 15.000, 9, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(7, 7, 167, '10 mm Anti static bubble wrap (Blue) 50m', 7, 50, 99.00, 15.000, 50, '2013-01-02 11:00:00', 4, '2013-01-02 11:00:00'),
(8, 7, 219, 'Void fill 400 L bag (White) 400L', 7, 80, 50.00, 15.000, 80, '2013-01-02 11:00:00', 4, '2013-01-02 11:00:00'),
(9, 3, 114, 'Superhero action jacket (Blue) XXL', 7, 3, 30.00, 15.000, 3, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(10, 7, 72, 'Ride on toy sedan car (Pink) 1/12 scale', 7, 9, 230.00, 15.000, 9, '2013-01-02 11:00:00', 4, '2013-01-02 11:00:00'),
(11, 4, 206, 'Permanent marker black 5mm nib (Black) 5mm', 7, 96, 2.70, 15.000, 96, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(12, 4, 130, 'Furry gorilla with big eyes slippers (Black) S', 7, 5, 32.00, 15.000, 5, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(13, 4, 50, 'Developer joke mug - old C developers never die (White)', 7, 2, 13.00, 15.000, 2, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(14, 5, 128, 'Plush shark slippers (Gray) L', 7, 4, 32.00, 15.000, 4, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(15, 8, 100, '"The Gu" red shirt XML tag t-shirt (Black) 6XL', 7, 72, 18.00, 15.000, 72, '2013-01-02 11:00:00', 4, '2013-01-02 11:00:00'),
(16, 8, 151, 'Pack of 12 action figures (male)', 9, 8, 16.00, 15.000, 8, '2013-01-02 11:00:00', 4, '2013-01-02 11:00:00'),
(17, 5, 121, 'Dinosaur battery-powered slippers (Green) XL', 7, 3, 32.00, 15.000, 3, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(18, 5, 155, 'Large sized bubblewrap roll 50m', 7, 20, 24.00, 15.000, 20, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(19, 6, 150, 'Pack of 12 action figures (variety)', 9, 4, 16.00, 15.000, 4, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(20, 6, 40, 'Developer joke mug - (hip, hip, array) (White)', 7, 6, 13.00, 15.000, 6, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00'),
(21, 6, 126, 'Plush shark slippers (Gray) S', 7, 9, 32.00, 15.000, 9, '2013-01-01 11:00:00', 3, '2013-01-01 11:00:00');
GO
    
SELECT * FROM Orders.OrderLines;
