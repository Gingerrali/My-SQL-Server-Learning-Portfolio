BEGIN TRY
INSERT INTO Orders.Suppliers (SupplierName) VALUES ('The Walt Disney Company');
END TRY
BEGIN CATCH
    BEGIN IF ERROR_NUMBER() = 515
    PRINT 'Please provide values for all required columns'
	ELSE PRINT 'An unknown error has occured'
	END;
END CATCH;
