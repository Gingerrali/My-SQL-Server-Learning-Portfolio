-- Creates the main and archive tables used by the trigger.
CREATE TABLE dbo.Vendors (
    VendorID int IDENTITY PRIMARY KEY,
    VendorName nvarchar(50)
);
CREATE TABLE dbo.VendorArchive (
    VendorID int PRIMARY KEY,
    VendorName nvarchar(50),
    DateArchived datetime2
);
INSERT INTO dbo.Vendors
VALUES ('KinetEco');
SELECT * FROM dbo.Vendors;
GO

-- Uses an INSTEAD OF trigger to save deleted records in an archive table.
CREATE TRIGGER dbo.ArchiveVendors
ON dbo.Vendors
AFTER DELETE
AS
SET NOCOUNT ON;
INSERT INTO VendorArchive (VendorID, VendorName)
    SELECT deleted.VendorID, deleted.VendorName
    FROM deleted;
UPDATE VendorArchive
    SET DateArchived = GETDATE()
    FROM deleted
    WHERE VendorArchive.VendorID = deleted.VendorID;
;
GO

DELETE FROM dbo.Vendors
WHERE VendorID = 1;
SELECT * FROM dbo.Vendors;
SELECT * FROM dbo.VendorArchive;
GO
