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
GO

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
(22, 11, 83, '"The Gu" red shirt XML tag t-shirt (White) XXL', 7, 84, 18.00, 15.000, 84, '2013-01-07 11:00:00', 9, '2013-01-07 11:00:00'),
(23, 12, 14, 'USB food flash drive - fortune cookie', 7, 1, 32.00, 15.000, 1, '2013-01-05 11:00:00', 11, '2013-01-05 11:00:00'),
(24, 12, 41, 'Developer joke mug - (hip, hip, array) (Black)', 7, 3, 13.00, 15.000, 3, '2013-01-05 11:00:00', 11, '2013-01-05 11:00:00'),
(25, 13, 32, 'Developer joke mug - that''s a hardware problem (White)', 7, 2, 13.00, 15.000, 2, '2013-01-14 11:00:00', 6, '2013-01-14 11:00:00'),
(26, 13, 91, '"The Gu" red shirt XML tag t-shirt (Black) XS', 7, 84, 18.00, 15.000, 84, '2013-01-14 11:00:00', 6, '2013-01-14 11:00:00'),
(27, 13, 65, 'RC vintage American toy coupe with remote control (Black) 1/50 scale', 7, 2, 30.00, 15.000, 2, '2013-01-14 11:00:00', 6, '2013-01-14 11:00:00'),
(28, 14, 18, 'DBA joke mug - daaaaaa-ta (White)', 7, 4, 13.00, 15.000, 4, '2013-01-15 11:00:00', 9, '2013-01-15 11:00:00'),
(29, 14, 21, 'DBA joke mug - you might be a DBA if (Black)', 7, 9, 13.00, 15.000, 9, '2013-01-15 11:00:00', 9, '2013-01-15 11:00:00'),
(30, 14, 105, 'Alien officer hoodie (Black) 4XL', 7, 4, 35.00, 15.000, 4, '2013-01-15 11:00:00', 9, '2013-01-15 11:00:00'),
(31, 15, 140, 'Furry animal socks (Pink) L', 10, 96, 5.00, 15.000, 96, '2013-01-21 11:00:00', 15, '2013-01-21 11:00:00'),
(32, 15, 207, 'Permanent marker blue 5mm nib (Blue) 5mm', 7, 120, 2.70, 15.000, 120, '2013-01-21 11:00:00', 15, '2013-01-21 11:00:00'),
(33, 16, 188, '3 kg Courier post bag (White) 300x190x95mm', 7, 150, 0.66, 15.000, 150, '2013-01-24 11:00:00', 12, '2013-01-24 11:00:00'),
(34, 16, 121, 'Dinosaur battery-powered slippers (Green) XL', 7, 3, 32.00, 15.000, 3, '2013-01-24 11:00:00', 12, '2013-01-24 11:00:00'),
(35, 16, 108, 'Superhero action jacket (Blue) XXS', 7, 7, 25.00, 15.000, 7, '2013-01-24 11:00:00', 12, '2013-01-24 11:00:00'),
(36, 16, 46, 'Developer joke mug - a foo walks into a bar (White)', 7, 3, 13.00, 15.000, 3, '2013-01-24 11:00:00', 12, '2013-01-24 11:00:00'),
(37, 16, 218, 'Void fill 300 L bag (White) 300L', 7, 30, 37.50, 15.000, 30, '2013-01-24 11:00:00', 12, '2013-01-24 11:00:00'),
(38, 17, 29, 'DBA joke mug - two types of DBAs (Black)', 7, 6, 13.00, 15.000, 6, '2013-01-21 11:00:00', 15, '2013-01-21 11:00:00'),
(39, 17, 129, 'Plush shark slippers (Gray) XL', 7, 6, 32.00, 15.000, 6, '2013-01-21 11:00:00', 15, '2013-01-21 11:00:00'),
(40, 17, 49, 'Developer joke mug - this code was generated by a tool (Black)', 7, 9, 13.00, 15.000, 9, '2013-01-21 11:00:00', 15, '2013-01-21 11:00:00'),
(41, 17, 102, 'Alien officer hoodie (Black) XL', 7, 2, 35.00, 15.000, 2, '2013-01-21 11:00:00', 15, '2013-01-21 11:00:00'),
(42, 18, 143, 'Halloween zombie mask (Light Brown) M', 7, 72, 18.00, 15.000, 72, '2013-02-16 11:00:00', 12, '2013-02-16 11:00:00'),
(43, 18, 52, 'IT joke mug - keyboard not found … press F1 to continue (White)', 7, 2, 13.00, 15.000, 2, '2013-02-16 11:00:00', 12, '2013-02-16 11:00:00'),
(44, 18, 20, 'DBA joke mug - you might be a DBA if (White)', 7, 4, 13.00, 15.000, 4, '2013-02-16 11:00:00', 12, '2013-02-16 11:00:00'),
(45, 18, 192, 'Black and orange fragile despatch tape 48mmx100m', 7, 72, 4.10, 15.000, 72, '2013-02-16 11:00:00', 12, '2013-02-16 11:00:00'),
(46, 19, 183, 'Shipping carton (Brown) 480x270x320mm', 7, 175, 2.74, 15.000, 175, '2013-03-27 11:00:00', 17, '2013-03-27 11:00:00'),
(47, 19, 153, 'Small sized bubblewrap roll 10m', 7, 10, 4.50, 15.000, 10, '2013-03-27 11:00:00', 17, '2013-03-27 11:00:00'),
(48, 20, 147, 'Halloween skull mask (Gray) M', 7, 120, 18.00, 15.000, 120, '2013-04-05 11:00:00', 17, '2013-04-05 11:00:00'),
(49, 20, 146, 'Halloween skull mask (Gray) S', 7, 84, 18.00, 15.000, 84, '2013-04-05 11:00:00', 17, '2013-04-05 11:00:00'),
(50, 21, 26, 'DBA joke mug - SELECT caffeine FROM mug (White)', 7, 1, 13.00, 15.000, 1, '2013-04-08 11:00:00', 7, '2013-04-08 11:00:00'),
(51, 21, 35, 'Developer joke mug - fun was unexpected at this time (Black)', 7, 6, 13.00, 15.000, 6, '2013-04-08 11:00:00', 7, '2013-04-08 11:00:00'),
(52, 21, 160, '20 mm Double sided bubble wrap 20m', 7, 10, 33.00, 15.000, 10, '2013-04-08 11:00:00', 7, '2013-04-08 11:00:00'),
(53, 21, 141, 'Furry animal socks (Pink) XL', 10, 12, 5.00, 15.000, 12, '2013-04-08 11:00:00', 7, '2013-04-08 11:00:00'),
(54, 21, 190, 'Clear packaging tape 48mmx100m', 7, 60, 3.50, 15.000, 60, '2013-04-08 11:00:00', 7, '2013-04-08 11:00:00'),
(55, 22, 78, '"The Gu" red shirt XML tag t-shirt (White) XS', 7, 60, 18.00, 15.000, 60, '2013-04-25 11:00:00', 6, '2013-04-25 11:00:00'),
(56, 23, 121, 'Dinosaur battery-powered slippers (Green) XL', 7, 1, 32.00, 15.000, 1, '2013-01-05 11:00:00', 11, '2013-01-05 11:00:00'),
(57, 23, 106, 'Alien officer hoodie (Black) 5XL', 7, 5, 35.00, 15.000, 5, '2013-01-05 11:00:00', 11, '2013-01-05 11:00:00'),
(58, 23, 15, 'USB food flash drive - dessert 10 drive variety pack', 9, 9, 240.00, 15.000, 9, '2013-01-05 11:00:00', 11, '2013-01-05 11:00:00'),
(59, 24, 25, 'DBA joke mug - I will get you in order (Black)', 7, 1, 13.00, 15.000, 1, '2013-01-07 11:00:00', 9, '2013-01-07 11:00:00'),
(60, 24, 117, 'Superhero action jacket (Blue) 5XL', 7, 1, 34.00, 15.000, 1, '2013-01-07 11:00:00', 9, '2013-01-07 11:00:00'),
(61, 25, 107, 'Superhero action jacket (Blue) 3XS', 7, 8, 25.00, 15.000, 8, '2013-01-10 11:00:00', 13, '2013-01-10 11:00:00'),
(62, 25, 72, 'Ride on toy sedan car (Pink) 1/12 scale', 7, 10, 230.00, 15.000, 10, '2013-01-10 11:00:00', 13, '2013-01-10 11:00:00'),
(63, 25, 9, 'USB food flash drive - banana', 7, 4, 32.00, 15.000, 4, '2013-01-10 11:00:00', 13, '2013-01-10 11:00:00'),
(64, 26, 181, 'Shipping carton (Brown) 356x229x229mm', 7, 150, 1.14, 15.000, 150, '2013-03-12 11:00:00', 5, '2013-03-12 11:00:00'),
(65, 26, 43, 'Developer joke mug - understanding recursion requires understanding recursion (Black)', 7, 5, 13.00, 15.000, 5, '2013-03-12 11:00:00', 5, '2013-03-12 11:00:00'),
(66, 26, 13, 'USB food flash drive - shrimp cocktail', 7, 6, 32.00, 15.000, 6, '2013-03-12 11:00:00', 5, '2013-03-12 11:00:00'),
(67, 27, 112, 'Superhero action jacket (Blue) L', 7, 2, 30.00, 15.000, 2, '2013-03-14 11:00:00', 15, '2013-03-14 11:00:00'),
(68, 27, 212, 'Large  replacement blades 18mm', 7, 50, 4.30, 15.000, 50, '2013-03-14 11:00:00', 15, '2013-03-14 11:00:00'),
(69, 27, 206, 'Permanent marker black 5mm nib (Black) 5mm', 7, 108, 2.70, 15.000, 108, '2013-03-14 11:00:00', 15, '2013-03-14 11:00:00'),
(70, 27, 90, '"The Gu" red shirt XML tag t-shirt (Black) XXS', 7, 24, 18.00, 15.000, 24, '2013-03-14 11:00:00', 15, '2013-03-14 11:00:00'),
(71, 27, 161, '20 mm Double sided bubble wrap 50m', 7, 100, 108.00, 15.000, 100, '2013-03-14 11:00:00', 15, '2013-03-14 11:00:00'),
(72, 28, 84, '"The Gu" red shirt XML tag t-shirt (White) 3XL', 7, 24, 18.00, 15.000, 24, '2013-04-17 11:00:00', 4, '2013-04-17 11:00:00'),
(73, 28, 9, 'USB food flash drive - banana', 7, 4, 32.00, 15.000, 4, '2013-04-17 11:00:00', 4, '2013-04-17 11:00:00');
GO
    
SELECT * FROM Orders.OrderLines;
GO

CREATE TABLE Orders.Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    BillToCustomerID INT,
    CustomerCategoryID INT,
    BuyingGroupID INT,
    PrimaryContactPersonID INT,
    AlternateContactPersonID INT,
    DeliveryMethodID INT,
    DeliveryCityID INT,
    PostalCityID INT,
    PaymentDays INT,
    PhoneNumber NVARCHAR(30),
    DeliveryAddressLine1 NVARCHAR(100),
    DeliveryAddressLine2 NVARCHAR(100),
    DeliveryPostalCode NVARCHAR(20),
    PostalAddressLine NVARCHAR(100),
    PostalPostalCode NVARCHAR(20),
);
GO

INSERT INTO Orders.Customers
VALUES
(100,'Tailspin Toys (Head Office)',1,3,1,1001,1002,3,19586,19586,7,'(308) 555-0100','Shop 38','1877 Mittal Road','90410','PO Box 8975','90410'),
(101,'Tailspin Toys (Sylvanite, MT)',1,3,1,1003,1004,3,33475,33475,7,'(406) 555-0100','Shop 245','705 Dita Lane','90216','PO Box 259','90216'),
(102,'Tailspin Toys (Peeples Valley, AZ)',1,3,1,1005,1006,3,26483,26483,7,'(480) 555-0100','Unit 217','1970 Khandke Road','90205','PO Box 3648','90205'),
(103,'Tailspin Toys (Medicine Lodge, KS)',1,3,1,1007,1008,3,21692,21692,7,'(316) 555-0100','Suite 164','967 Riutta Boulevard','90152','PO Box 5065','90152'),
(104,'Tailspin Toys (Gasport, NY)',1,3,1,1009,1010,3,12748,12748,7,'(212) 555-0100','Unit 176','1674 Skujins Boulevard','90261','PO Box 6294','90261'),
(105,'Tailspin Toys (Jessie, ND)',1,3,1,1011,1012,3,17054,17054,7,'(701) 555-0100','Shop 196','483 Raut Lane','90298','PO Box 571','90298'),
(106,'Tailspin Toys (Frankewing, TN)',1,3,1,1013,1014,3,12152,12152,7,'(423) 555-0100','Shop 27','904 Kellnerova Street','90761','PO Box 5684','90761'),
(107,'Tailspin Toys (Bow Mar, CO)',1,3,1,1015,1016,3,3673,3673,7,'(303) 555-0100','Shop 282','752 Shaker Doust Boulevard','90484','PO Box 614','90484'),
(108,'Tailspin Toys (Netcong, NJ)',1,3,1,1017,1018,3,23805,23805,7,'(201) 555-0100','Shop 33','25 Kasesalu Street','90129','PO Box 8369','90129'),
(109,'Tailspin Toys (Wimbledon, ND)',1,3,1,1019,1020,3,37403,37403,7,'(701) 555-0100','Unit 67','372 Joo Lane','90061','PO Box 8702','90061'),
(110,'Tailspin Toys (Devault, PA)',1,3,1,1021,1022,3,8987,8987,7,'(215) 555-0100','Unit 250','1432 Pullela Street','90185','PO Box 2676','90185');
GO
    
SELECT * FROM Orders.Customers;
GO
