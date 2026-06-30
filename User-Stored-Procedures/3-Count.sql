-- Creates a stored procedure that counts table records using an OUTPUT parameter
CREATE OR ALTER PROCEDURE sp_TotalQuantity (@MinQuantity INT, @OrderLineCount INT OUTPUT)
AS
BEGIN
SELECT @OrderLineCount = COUNT(*) FROM Orders.Orderlines
WHERE Quantity >= @MinQuantity;
END;

-- Executes the procedure with a sample value
DECLARE @Result INT;
EXEC sp_TotalQuantity @MinQuantity = 20,
@OrderLineCount = @Result OUTPUT;
SELECT @Result AS TotalOrderlines;
