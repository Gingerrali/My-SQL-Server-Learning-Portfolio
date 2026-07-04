-- Demonstrates error handling using TRY and CATCH
-- Attempts to insert a new record
-- Error 515 is a system-defined error for NULL values in NOT NULL columns
-- Displays a custom message instead of the default system error
-- Returns a generic message for all other errors
BEGIN TRY
INSERT INTO Orders.Suppliers (SupplierName) VALUES ('The Walt Disney Company');
END TRY
BEGIN CATCH
    BEGIN IF ERROR_NUMBER() = 515
    PRINT 'Please provide values for all required columns'
	ELSE PRINT 'An unknown error has occured'
	END;
END CATCH;
