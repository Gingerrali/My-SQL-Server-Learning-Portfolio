-- Demonstrates custom error handling using THROW.
-- Validates the transaction before updating both accounts.
-- Rolls back the transaction and returns a custom error if a validation fails.
CREATE OR ALTER PROCEDURE dbo.TransferFunds (@FromAccount AS INT, @ToAccount AS INT, @Amount AS decimal(10,2))
AS
BEGIN TRY
BEGIN TRANSACTION;
    BEGIN IF (SELECT AccountID FROM dbo.BankAccounts WHERE AccountID = @FromAccount) IS NULL
        THROW 51000, 'The sending account does not exist', 1;
    END;
    BEGIN IF NOT EXISTS (SELECT AccountID FROM dbo.BankAccounts WHERE AccountID = @ToAccount)
        THROW 52000, 'The receiving account does not exist', 1;
    END;
    BEGIN IF (SELECT Balance FROM dbo.BankAccounts WHERE AccountID = @FromAccount) - @Amount < 0
        THROW 53000, 'The sending account balance is too low to perform the transfer.', 1;
    END;

    UPDATE dbo.BankAccounts
        SET Balance -= @Amount
        WHERE AccountID = @FromAccount;
    UPDATE dbo.BankAccounts
        SET Balance += @Amount
        WHERE AccountID = @ToAccount;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'ERROR: ' + ERROR_MESSAGE()
END CATCH;
;
GO

-- Tests different scenarios and custom THROW error messages.
EXEC dbo.TransferFunds '3', '1', '100.00';
GO
EXEC dbo.TransferFunds '4', '1', '100.00';
GO
EXEC dbo.TransferFunds '3', '5', '100.00';
GO
EXEC dbo.TransferFunds '3', '1', '300.00';
GO
