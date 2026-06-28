-- I recreated this database, its tables, and data on my own SQL Server instance
-- while following the "Complete Guide to Advanced SQL Server" course.
-- The goal was to follow along with the course and gain hands-on experience 
-- by building everything in my own environment.


CREATE DATABASE GlobalTrade;
GO

USE GlobalTrade;
GO

CREATE SCHEMA Orders;
GO

CREATE TABLE Orders.Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    SupplierCategoryID INT NOT NULL,
    PrimaryContactPersonID INT,
    AlternateContactPersonID INT,
    DeliveryMethodID INT NULL,
    DeliveryCityID INT,
    PostalCityID INT,
    SupplierReference VARCHAR(20),
    BankAccountName VARCHAR(100),
    BankAccountBranch VARCHAR(100),
    BankAccountCode VARCHAR(20),
    BankAccountNumber VARCHAR(30),
    BankInternationalCode VARCHAR(20),
    PaymentDays INT,
    InternalComments VARCHAR(255) NULL,
    PhoneNumber VARCHAR(30),
    FaxNumber VARCHAR(30),
    WebsiteURL VARCHAR(255),
    DeliveryAddressLine1 VARCHAR(100),
    DeliveryAddressLine2 VARCHAR(100),
    DeliveryPostalCode VARCHAR(20),
    PostalAddressLine1 VARCHAR(100),
    PostalAddressLine2 VARCHAR(100),
    PostalPostalCode VARCHAR(20),
    LastEditedBy INT
);
GO

INSERT INTO Orders.Suppliers
(
    SupplierID, SupplierName, SupplierCategoryID,
    PrimaryContactPersonID, AlternateContactPersonID,
    DeliveryMethodID, DeliveryCityID, PostalCityID,
    SupplierReference, BankAccountName, BankAccountBranch,
    BankAccountCode, BankAccountNumber, BankInternationalCode,
    PaymentDays, InternalComments,
    PhoneNumber, FaxNumber, WebsiteURL,
    DeliveryAddressLine1, DeliveryAddressLine2, DeliveryPostalCode,
    PostalAddressLine1, PostalAddressLine2, PostalPostalCode,
    LastEditedBy
)
VALUES
(1, 'A Datum Corporation', 2, 21, 22, 7, 38171, 38171, 'AA20384', 'A Datum Corporation', 'Woodgrove Bank Zionsville', '356981', '8575824136', '25986', 14, NULL, '(847) 555-0100', '(847) 555-0101', 'http://www.adatum.com', 'Suite 10', '183838 Southwest Boulevard', '46077', 'PO Box 1039', 'Surrey', '46077', 1), 
(2, 'Contoso, Ltd.', 2, 23, 24, 9, 13870, 13870, 'B2084020', 'Contoso Ltd', 'Woodgrove Bank Greenbank', '358698', '4587965215', '25868', 7, NULL, '(360) 555-0100', '(360) 555-0101', 'http://www.contoso.com', 'Unit 2', '2934 Night Road', '98253', 'PO Box 1012', 'Jolimont', '98253', 1), 
(3, 'Consolidated Messenger', 6, 25, 26, NULL, 30378, 30378, '209340283', 'Consolidated Messenger', 'Woodgrove Bank San Francisco', '354269', '3254872158', '45698', 30, NULL, '(415) 555-0100', '(415) 555-0101', 'http://www.consolidatedmessenger.com', NULL, '894 Market Day Street', '94101', 'PO Box 1014', 'West Mont', '94101', 1), 
(4, 'Fabrikam, Inc.', 4, 27, 28, 7, 18557, 18557, '293092', 'Fabrikam Inc', 'Woodgrove Bank Lakeview Heights', '789568', '4125863879', '12546', 30, NULL, '(203) 555-0104', '(203) 555-0108', 'http://www.fabrikam.com', 'Level 2', '393999 Woodberg Road', '40351', 'PO Box 301', 'Eaglemont', '40351', 1), 
(5, 'Graphic Design Institute', 2, 29, 30, 10, 18634, 18634, '08803922', 'Graphic Design Institute', 'Woodgrove Bank Lanagan', '563215', '1025869354', '32587', 14, NULL, '(406) 555-0105', '(406) 555-0106', 'http://www.graphicdesigninstitute.com', NULL, '45th Street', '64847', 'PO Box 393', 'Willow', '64847', 1), 
(6, 'Humongous Insurance', 9, 31, 32, NULL, 18656, 18656, '082420938', 'Humongous Insurance', 'Woodgrove Bank Lancing', '325001', '2569874521', '32569', 14, NULL, '(423) 555-0105', '(423) 555-0100', 'http://www.humongousinsurance.com', NULL, '9893 Mount Norris Road', '37770', 'PO Box 94829', 'Boxville', '37770', 1), 
(7, 'Litware, Inc.', 5, 33, 34, 2, 22602, 22602, 'BC0280982', 'Litware Inc', 'Woodgrove Bank Mokelumne Hill', '358769', '3256896325', '21445', 30, NULL, '(209) 555-0108', '(209) 555-0104', 'http://www.litwareinc.com', 'Level 3', '19 Le Church Street', '95245', 'PO Box 20290', 'Jackson', '95245', 1), 
(8, 'Lucerne Publishing', 2, 35, 36, 10, 17161, 17161, 'JQ082304802', 'Lucerne Publishing', 'Woodgrove Bank Jonesborough', '654789', '3254123658', '21569', 30, 'Marcos is not in on Mondays', '(423) 555-0103', '(423) 555-0105', 'http://www.lucernepublishing.com', 'Suite 34', '949482 Miller Boulevard', '37659', 'PO Box 8747', 'Westerfold', '37659', 1), 
(9, 'Nod Publishers', 2, 37, 38, 10, 10346, 10346, 'GL08029802', 'Nod Publishers', 'Woodgrove Bank Elizabeth City', '365985', '2021545878', '48758', 7, NULL, '(252) 555-0100', '(252) 555-0101', 'http://www.nodpublishers.com', 'Level 1', '389 King Street', '27906', 'PO Box 3390', 'Anderson', '27906', 1), 
(10, 'Northwind Electric Cars', 3, 39, 40, 8, 7899, 7899, 'ML0300202', 'Northwind Electric Cars', 'Woodgrove Bank Crandon Lakes', '325447', '3258786987', '36214', 30, NULL, '(201) 555-0105', '(201) 555-0104', 'http://www.northwindelectriccars.com', NULL, '440 New Road', '07860', 'PO Box 30920', 'Arlington', '07860', 1), 
(11, 'Trey Research', 8, 41, 42, NULL, 17277, 17277, '082304822', 'Trey Research', 'Woodgrove Bank Kadoka', '658968', '1254785321', '56958', 7, NULL, '(605) 555-0103', '(605) 555-0101', 'http://www.treyresearch.net', 'Level 43', '9401 Polar Avenue', '57543', 'PO Box 595', 'Port Fairy', '57543', 1), 
(12, 'The Phone Company', 2, 43, 44, 7, 17346, 17346, '237408032', 'The Phone Company', 'Woodgrove Bank Karlstad', '214568', '7896236589', '25478', 30, NULL, '(218) 555-0105', '(218) 555-0105', 'http://www.thephone-company.com', 'Level 83', '339 Toorak Road', '56732', 'PO Box 8337', 'Ferny Wood', '56732', 1), 
(13, 'Woodgrove Bank', 7, 45, 46, NULL, 30378, 30378, '028034202', 'Woodgrove Bank', 'Woodgrove Bank San Francisco', '325698', '2147825698', '65893', 7, 'Only speak to Donald', '(415) 555-0103', '(415) 555-0107', 'http://www.woodgrovebank.com', 'Level 3', '8488 Vienna Boulevard', '94101', 'PO Box 2390', 'Canterbury', '94101', 1);
GO

CREATE TABLE Orders.Sales (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    SalespersonPersonID INT,
    PickedByPersonID INT NULL,
    ContactPersonID INT,
    BackorderOrderID INT NULL,
    OrderDate DATE,
    ExpectedDeliveryDate DATE,
    CustomerPurchaseOrderNumber INT,
    IsUndersupplyBackordered BIT,
    Comments NVARCHAR(255) NULL,
    DeliveryInstructions NVARCHAR(255) NULL,
    InternalComments NVARCHAR(255) NULL,
    PickingCompletedWhen DATETIME2,
    LastEditedBy INT,
    LastEditedWhen DATETIME2
);
GO

INSERT INTO Orders.Sales
(
    OrderID,
    CustomerID,
    SalespersonPersonID,
    PickedByPersonID,
    ContactPersonID,
    BackorderOrderID,
    OrderDate,
    ExpectedDeliveryDate,
    CustomerPurchaseOrderNumber,
    IsUndersupplyBackordered,
    Comments,
    DeliveryInstructions,
    InternalComments,
    PickingCompletedWhen,
    LastEditedBy,
    LastEditedWhen
)
VALUES
(1, 100, 2, NULL, 3032, 45, '2013-01-01', '2013-01-02', 12126, 1, NULL, NULL, NULL, '2013-01-01 12:00:00', 7, NULL),
(2, 101, 8, NULL, 3003, 46, '2013-01-01', '2013-01-02', 15342, 1, NULL, NULL, NULL, '2013-01-01 12:00:00', 7, NULL),
(3, 102, 7, NULL, 1209, 47, '2013-01-01', '2013-01-02', 12211, 1, NULL, NULL, NULL, '2013-01-01 12:00:00', 7, NULL),
(4, 103, 16, 3, 1113, NULL, '2013-01-01', '2013-01-02', 17129, 1, NULL, NULL, NULL, '2013-01-01 11:00:00', 3, NULL),
(5, 104, 3, NULL, 3105, 48, '2013-01-01', '2013-01-02', 10369, 1, NULL, NULL, NULL, '2013-01-01 12:00:00', 7, NULL),
(6, 105, 13, 3, 3176, NULL, '2013-01-01', '2013-01-02', 13383, 1, NULL, NULL, NULL, '2013-01-01 11:00:00', 3, NULL),
(7, 106, 8, NULL, 2349, 49, '2013-01-01', '2013-01-02', 17913, 1, NULL, NULL, NULL, '2013-01-01 12:00:00', 7, NULL),
(8, 107, 7, NULL, 3164, 50, '2013-01-01', '2013-01-02', 14518, 1, NULL, NULL, NULL, '2013-01-01 12:00:00', 7, NULL),
(9, 108, 7, NULL, 1153, 51, '2013-01-01', '2013-01-02', 17577, 1, NULL, NULL, NULL, '2013-01-01 12:00:00', 7, NULL),
(10, 109, 20, NULL, 1381, 52, '2013-01-01', '2013-01-02', 18030, 1, NULL, NULL, NULL, '2013-01-01 12:00:00', 7, NULL);
GO
