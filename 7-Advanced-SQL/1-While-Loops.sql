-- Uses a WHILE loop to count movies for each rating.
DECLARE @Rating INT = 1;
DECLARE @Count INT;
WHILE @Rating <= 5
BEGIN
SELECT @Count = COUNT(*)
FROM dbo.Movies
WHERE rating = @Rating;
SELECT CONCAT('Rating: ', @Count, ' movies') AS RatingScore;
SET @Rating = @Rating + 1;
END
