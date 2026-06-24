-- Example of a custom, scalar-valued function that formats a date as readable text
CREATE FUNCTION dbo.fn_LongDate (@FullDate DATETIME)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
DATENAME(WEEKDAY, @FullDate) + ' ' +
CAST(DAY(@FullDate) AS VARCHAR(2)) + ' ' +
DATENAME(MONTH, @FullDate) + ' ' +
DATENAME(YEAR, @FullDate);
END;

-- Applying the function to table data
SELECT name, dbo.fn_LongDate(dob) AS FormattedDOB 
FROM dbo.Actors;

-- Example of modifying the function to include day suffixes (st, nd, rd, th)
ALTER FUNCTION dbo.fn_LongDate (@FullDate DATETIME)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
DATENAME(WEEKDAY, @FullDate) + ' ' +
CAST(DAY(@FullDate) AS VARCHAR(2)) +
CASE
	WHEN DAY(@FullDate) IN (1, 21, 31) THEN 'st'
	WHEN DAY(@FullDate) IN (2, 22) THEN 'nd'
	WHEN DAY(@FullDate) IN (3, 23) THEN 'rd'
	ELSE 'th'
END + ' ' +
DATENAME(MONTH, @FullDate) + ' ' + 
DATENAME(YEAR, @FullDate);
END;

DROP dbo.fn_LongDate;
GO



