USE GlobalTrade;
GO
    
CREATE TABLE dbo.Directors (
director_id INT PRIMARY KEY,
name NVARCHAR(100) NOT NULL,
dob DATE NOT NULL,
nationality NVARCHAR(50) NOT NULL
);
GO

INSERT INTO dbo.Directors (director_id, name, dob, nationality)
VALUES
(80, 'Victor Fleming', '1889-02-23', 'American'),
(52, 'Michael Curtiz', '1886-12-24', 'Hungarian'),
(82, 'William Wyler', '1902-07-01', 'American'),
(65, 'Robert Wise', '1914-09-10', 'American'),
(27, 'George Roy Hill', '1922-12-20', 'American'),
(74, 'Stanley Kubrick', '1928-07-26', 'American'),
(22, 'Francis Ford Coppola', '1939-04-07', 'American'),
(81, 'William Friedkin', '1935-08-29', 'American'),
(76, 'Steven Spielberg', '1946-12-18', 'American'),
(54, 'Milos Forman', '1932-02-18', 'Czech-American'),
(88, 'John G. Avildsen', '1964-03-16', 'American'),
(25, 'George Lucas', '1944-05-14', 'American'),
(8, 'Brian De Palma', '1940-09-11', 'American'),
(18, 'David Hand', '1900-01-01', 'American'),
(63, 'Ridley Scott', '1937-11-30', 'British'),
(34, 'James Cameron', '1954-08-16', 'Canadian'),
(84, 'Zack Snyder', '1966-03-01', 'American'),
(29, 'Guillermo del Toro', '1964-10-09', 'Mexican'),
(26, 'George Miller', '1945-03-03', 'Australian'),
(13, 'Christopher Nolan', '1970-07-30', 'British');
GO

SELECT * FROM dbo.Directors;
SELECT * FROM dbo.Movies;
GO
