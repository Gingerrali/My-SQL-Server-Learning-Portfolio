-- Demonstrates error handling using TRY...CATCH.
-- Attempts to insert a new record and returns a custom message for Error 515
-- (NULL values in NOT NULL columns), or a generic message for all other errors.
BEGIN TRY
INSERT INTO Orders.Suppliers (SupplierName) VALUES ('The Walt Disney Company');
END TRY
BEGIN CATCH
    BEGIN IF ERROR_NUMBER() = 515
    PRINT 'Please provide values for all required columns'
	ELSE PRINT 'An unknown error has occured'
	END;
END CATCH;
GO
