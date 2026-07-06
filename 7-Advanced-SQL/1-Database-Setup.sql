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

INSERT INTO dbo.Movies
(movie_id, title, year, revenue_generated, runtime, rating, short_description, director_id, studio_id, genre_id)
VALUES
(22, 'Ghostbusters', 1984, 282200000, 105, 3.0, 'Ghostbusters is a comedy film released in 1984.', 31, 1, 5),
(23, 'Back to the Future', 1985, 388800000, 116, 4.0, 'Back to the Future is a sci-fi film released in 1985.', 8, 17, 13),
(24, 'Top Gun', 1986, 357300000, 110, 1.0, 'Top Gun is an action film released in 1986.', 79, 12, 1),
(25, 'Die Hard', 1988, 140700000, 132, 3.0, 'Die Hard is an action film released in 1988.', 23, 21, 1),
(26, 'Platoon', 1986, 138500000, 120, 1.0, 'Platoon is a war film released in 1986.', 56, 11, 18),
(27, 'Rain Man', 1988, 354800000, 133, 1.0, 'Rain Man is a drama film released in 1988.', 4, 18, 7),
(28, 'Batman', 1989, 411600000, 126, 3.0, 'Batman is a superhero film released in 1989.', 77, 19, 16),
(29, 'Beverly Hills Cop', 1984, 316400000, 105, 3.0, 'Beverly Hills Cop is a comedy film released in 1984.', 47, 12, 5),
(30, 'Jurassic Park', 1993, 1033000000, 127, 4.0, 'Jurassic Park is a sci-fi film released in 1993.', 76, 17, 13),
(31, 'Terminator 2: Judgment Day', 1991, 520900000, 137, 4.0, 'Terminator 2: Judgment Day is a sci-fi film released in 1991.', 34, 16, 13),
(32, 'Titanic', 1997, 2147000000, 195, 2.0, 'Titanic is a romance film released in 1997.', 34, 12, 12),
(33, 'Toy Story', 1995, 373600000, 81, 3.0, 'Toy Story is an animation film released in 1995.', 68, 20, 3),
(34, 'Forrest Gump', 1994, 678200000, 142, 4.0, 'Forrest Gump is a drama film released in 1994.', 8, 12, 7),
(35, 'Independence Day', 1996, 817400000, 145, 2.0, 'Independence Day is a sci-fi film released in 1996.', 67, 21, 13),
(36, 'The Matrix', 1999, 466600000, 136, 4.0, 'The Matrix is a sci-fi film released in 1999.', 44, 19, 13),
(37, 'Saving Private Ryan', 1998, 481800000, 169, 4.0, 'Saving Private Ryan is a war film released in 1998.', 76, 3, 18),
(38, 'Home Alone', 1990, 477100000, 103, 1.0, 'Home Alone is a comedy film released in 1990.', 11, 21, 5),
(39, 'Pulp Fiction', 1994, 213900000, 154, 4.0, 'Pulp Fiction is a crime film released in 1994.', 61, 9, 6),
(40, 'The Lion King', 1994, 968500000, 88, 4.0, 'The Lion King is an animation film released in 1994.', 66, 20, 3),
(41, 'The Shawshank Redemption', 1994, 58300000, 142, 5.0, 'The Shawshank Redemption is a drama film released in 1994.', 21, 1, 7),
(42, 'Pretty Woman', 1990, 463400000, 119, 1.0, 'Pretty Woman is a romance film released in 1990.', 49, 15, 12),
(43, 'Aladdin', 1992, 504100000, 90, 1.0, 'Aladdin is an animation film released in 1992.', 8, 20, 3),
(44, 'Mission: Impossible', 1996, 457700000, 110, 2.0, 'Mission: Impossible is an action film released in 1996.', 8, 12, 1),
(45, 'Gladiator', 2000, 457600000, 155, 1.0, 'Gladiator is an action film released in 2000.', 63, 3, 1),
(46, 'The Lord of the Rings: The Fellowship of the Ring', 2001, 897700000, 178, 4.0, 'The Lord of the Rings: The Fellowship of the Ring is a fantasy film released in 2001.', 59, 10, 9),
(47, 'Harry Potter and the Sorcerer''s Stone', 2001, 1002000000, 152, 1.0, 'Harry Potter and the Sorcerer''s Stone is a fantasy film released in 2001.', 11, 19, 9),
(48, 'Spider-Man', 2002, 821700000, 121, 2.0, 'Spider-Man is a superhero film released in 2002.', 8, 1, 16),
(49, 'Pirates of the Caribbean: The Curse of the Black Pearl', 2003, 654300000, 143, 2.0, 'Pirates of the Caribbean: The Curse of the Black Pearl is an adventure film released in 2003.', 92, 20, 2),
(50, 'Finding Nemo', 2003, 940300000, 100, 3.0, 'Finding Nemo is an animation film released in 2003.', 17, 20, 3),
(51, 'Shrek 2', 2004, 928700000, 93, 3.0, 'Shrek 2 is an animation film released in 2004.', 2, 3, 3),
(52, 'The Departed', 2006, 291500000, 151, 3.0, 'The Departed is a crime film released in 2006.', 48, 19, 6),
(53, 'The Dark Knight', 2008, 1005000000, 152, 5.0, 'The Dark Knight is a superhero film released in 2008.', 13, 19, 16),
(54, 'Iron Man', 2008, 585800000, 126, 1.0, 'Iron Man is a superhero film released in 2008.', 90, 12, 16),
(55, 'Twilight', 2008, 393600000, 122, 1.0, 'Twilight is a romance film released in 2008.', 9, 14, 12),
(56, 'Mamma Mia!', 2008, 609800000, 108, 1.0, 'Mamma Mia! is a musical film released in 2008.', 60, 17, 11),
(57, 'Avatar', 2009, 2147000000, 162, 1.0, 'Avatar is a sci-fi film released in 2009.', 34, 21, 13),
(58, 'The Hangover', 2009, 467500000, 100, 1.0, 'The Hangover is a comedy film released in 2009.', 78, 19, 5),
(59, 'The Lord of the Rings: The Return of the King', 2003, 1142000000, 201, 4.0, 'The Lord of the Rings: The Return of the King is a fantasy film released in 2003.', 59, 10, 9),
(60, 'Transformers', 2007, 709700000, 144, 1.0, 'Transformers is an action film released in 2007.', 51, 3, 1),
(61, 'The Avengers', 2012, 1518800000, 143, 1.0, 'The Avengers is an action film released in 2012.', 40, 8, 1),
(62, 'Skyfall', 2012, 1108600000, 143, 1.0, 'Skyfall is a spy film released in 2012.', 71, 7, 15),
(63, 'The Hunger Games', 2012, 694400000, 142, 2.0, 'The Hunger Games is a sci-fi film released in 2012.', 23, 6, 13),
(64, 'Frozen', 2013, 1280000000, 102, 3.0, 'Frozen is an animation film released in 2013.', 37, 20, 3),
(65, 'Gravity', 2013, 723200000, 91, 2.0, 'Gravity is a sci-fi film released in 2013.', 18, 19, 13),
(66, 'Guardians of the Galaxy', 2014, 773300000, 121, 3.0, 'Guardians of the Galaxy is a sci-fi film released in 2014.', 35, 8, 13),
(67, 'Furious 7', 2015, 1516000000, 137, 2.0, 'Furious 7 is an action film released in 2015.', 36, 17, 1),
(68, 'Jurassic World', 2015, 1671700000, 124, 2.0, 'Jurassic World is a sci-fi film released in 2015.', 59, 17, 13),
(69, 'Inception', 2010, 829900000, 148, 4.0, 'Inception is a sci-fi film released in 2010.', 13, 19, 13),
(70, 'Deadpool', 2016, 783100000, 108, 2.0, 'Deadpool is an action film released in 2016.', 3, 21, 1),
(71, 'Wonder Woman', 2017, 821800000, 141, 3.0, 'Wonder Woman is a superhero film released in 2017.', 43, 19, 16),
(72, 'Jumanji: Welcome to the Jungle', 2017, 962500000, 119, 3.0, 'Jumanji: Welcome to the Jungle is an adventure film released in 2017.', 33, 1, 2),
(73, 'Black Panther', 2018, 1347100000, 134, 4.0, 'Black Panther is a superhero film released in 2018.', 23, 8, 16),
(74, 'Bohemian Rhapsody', 2018, 903700000, 134, 1.0, 'Bohemian Rhapsody is a biographical film released in 2018.', 9, 21, 4),
(75, 'Incredibles 2', 2018, 1243000000, 118, 1.0, 'Incredibles 2 is an animation film released in 2018.', 7, 20, 3),
(76, 'Joker', 2019, 1074000000, 122, 4.0, 'Joker is a crime film released in 2019.', 78, 19, 6),
(77, 'Avengers: Endgame', 2019, 2147000000, 181, 5.0, 'Avengers: Endgame is an action film released in 2019.', 3, 8, 1),
(78, 'Captain Marvel', 2019, 1128300000, 123, 2.0, 'Captain Marvel is a superhero film released in 2019.', 2, 8, 16),
(79, 'Top Gun: Maverick', 2022, 1493000000, 130, 4.0, 'Top Gun: Maverick is an action film released in 2022.', 41, 12, 1),
(80, 'Avatar: The Way of Water', 2022, 2147000000, 192, 2.0, 'Avatar: The Way of Water is a sci-fi film released in 2022.', 34, 21, 13),
(81, 'Apocalypse Now', 1979, 150000000, 153, 1.0, 'Apocalypse Now is a war film released in 1979.', 22, 18, 18),
(82, 'Citizen Kane', 1941, 1600000, 119, 1.0, 'Citizen Kane is a drama film released in 1941.', 57, 13, 7),
(83, 'King Kong', 1933, 5300000, 100, 1.0, 'King Kong is an adventure film released in 1933.', 50, 13, 2),
(84, 'Goldfinger', 1964, 125000000, 110, 1.0, 'Goldfinger is a spy film released in 1964.', 63, 18, 15);
GO

SELECT * FROM dbo.Directors;
SELECT * FROM dbo.Movies;
GO
