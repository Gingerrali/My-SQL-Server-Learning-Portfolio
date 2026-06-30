CREATE OR ALTER PROCEDURE sp_TotalQuantity (@MinQuantity INT, @OrderLineCount INT OUTPUT)
AS
BEGIN
SELECT @OrderLineCount = COUNT(*) FROM Orders.Orderlines
WHERE Quantity >= @MinQuantity;
END;

DECLARE @Result INT;
EXEC sp_TotalQuantity @MinQuantity = 20,
@OrderLineCount = @Result OUTPUT;
SELECT @Result AS TotalOrderlines;
