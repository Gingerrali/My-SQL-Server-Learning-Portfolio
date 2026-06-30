USE GlobalTrade;
GO
    
CREATE TABLE dbo.Colours (
    ColourID INT PRIMARY KEY,
    ColourName NVARCHAR(20),
    LastEditedBy INT
);
GO

INSERT INTO dbo.Colours (ColourID, ColourName, LastEditedBy)
VALUES
(1, 'Azure', 1),
(2, 'Beige', 1),
(3, 'Black', 1),
(4, 'Blue', 1),
(5, 'Charcoal', 1),
(6, 'Chartreuse', 1),
(7, 'Cyan', 1),
(8, 'Dark Brown', 1),
(9, 'Dark Green', 1),
(10, 'Fuchsia', 1);
GO

CREATE TABLE dbo.Movies (
    movie_id INT PRIMARY KEY,
    title NVARCHAR(100),
    year INT,
    revenue_generated BIGINT,
    runtime INT,
    rating DECIMAL(2,1),
    short_description NVARCHAR(255),
    director_id INT,
    studio_id INT,
    genre_id INT
);
GO

INSERT INTO dbo.Movies (movie_id, title, year, revenue_generated, runtime, rating, short_description, director_id, studio_id, genre_id)
VALUES
(1, 'Gone with the Wind', 1939, 198676000, 221, 4.0, 'Gone with the Wind is a drama film released in 1939.', 80, 7, 7),
(2, 'Casablanca', 1942, 10500000, 102, 1.0, 'Casablanca is a romance film released in 1942.', 52, 19, 12),
(3, 'Ben-Hur', 1959, 122700000, 212, 1.0, 'Ben-Hur is an epic film released in 1959.', 82, 7, 8),
(4, 'The Sound of Music', 1965, 286200000, 174, 1.0, 'The Sound of Music is a musical film released in 1965.', 65, 12, 11),
(5, 'Butch Cassidy and the Sundance Kid', 1969, 102300000, 110, 1.0, 'Butch Cassidy and the Sundance Kid is a western film released in 1969.', 27, 12, 19),
(6, 'The Wizard of Oz', 1939, 29700000, 102, 1.0, 'The Wizard of Oz is a fantasy film released in 1939.', 80, 7, 9),
(7, 'Psycho', 1960, 50000000, 109, 1.0, 'Psycho is a horror film released in 1960.', 1, 12, 10),
(8, 'Snow White and the Seven Dwarfs', 1937, 418200000, 83, 1.0, 'Snow White and the Seven Dwarfs is an animation film released in 1937.', 18, 13, 3),
(9, 'The Graduate', 1967, 105000000, 106, 1.0, 'The Graduate is a comedy film released in 1967.', 53, 4, 5),
(10, '2001: A Space Odyssey', 1968, 146000000, 149, 4.0, '2001: A Space Odyssey is a sci-fi film released in 1968.', 74, 7, 13),
(11, 'The Godfather', 1972, 246100000, 175, 5.0, 'The Godfather is a crime film released in 1972.', 22, 12, 6),
(12, 'The Exorcist', 1973, 441300000, 122, 4.0, 'The Exorcist is a horror film released in 1973.', 81, 19, 10),
(13, 'Jaws', 1975, 470700000, 124, 4.0, 'Jaws is a thriller film released in 1975.', 76, 17, 17),
(14, 'One Flew Over the Cuckoo''s Nest', 1975, 109000000, 133, 4.0, 'One Flew Over the Cuckoo''s Nest is a drama film released in 1975.', 54, 18, 7),
(15, 'Rocky', 1976, 225000000, 120, 4.0, 'Rocky is a sports drama film released in 1976.', 88, 18, 14),
(16, 'Star Wars', 1977, 775400000, 121, 4.0, 'Star Wars is a sci-fi film released in 1977.', 25, 21, 13),
(17, 'Grease', 1978, 396300000, 110, 3.0, 'Grease is a musical film released in 1978.', 8, 12, 11),
(18, 'Superman', 1978, 300500000, 143, 3.0, 'Superman is a superhero film released in 1978.', 18, 19, 16),
(19, 'Alien', 1979, 104900000, 117, 4.0, 'Alien is a sci-fi film released in 1979.', 63, 21, 13),
(20, 'E.T. the Extra-Terrestrial', 1982, 792900000, 115, 4.0, 'E.T. the Extra-Terrestrial is a science fiction film released in 1982.', 76, 17, 13);
GO
