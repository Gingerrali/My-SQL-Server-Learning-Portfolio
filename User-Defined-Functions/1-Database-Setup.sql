-- 
CREATE TABLE dbo.Actors (
    actor_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    nationality VARCHAR(50)
);

INSERT INTO dbo.Actors (actor_id, name, dob, nationality)
VALUES
(1, 'Adriana Caselotti', '1964-03-16', 'American'),
(10, 'Arnold Schwarzenegger', '1947-07-30', 'Austrian/American'),
(100, 'Meryl Streep', '1949-06-22', 'American'),
(101, 'Michael Keaton', '1951-09-05', 'American'),
(102, 'Michael B. Jordan', '1987-02-09', 'American'),
(103, 'Mike Myers', '1963-05-25', 'Canadian'),
(104, 'Miles Teller', '1987-02-20', 'American'),
(105, 'Morgan Freeman', '1937-06-01', 'American'),
(106, 'Neve Campbell', '1973-10-03', 'Canadian'),
(107, 'Olivia Newton-John', '1948-09-26', 'Australian'),
(108, 'Orlando Bloom', '1900-01-01', 'N/A'),
(109, 'Orson Welles', '1915-05-06', 'American'),
(11, 'Barry Humphries', '1900-01-01', 'N/A'),
(110, 'Paige O''Hara', '1956-05-10', 'American'),
(111, 'Patrick Swayze', '1952-08-18', 'American'),
(112, 'Paul Newman', '1925-01-26', 'American'),
(113, 'Paul Walker', '1973-09-12', 'American'),
(114, 'Paxton Whitehead', '1900-01-01', 'N/A'),
(115, 'Rami Malek', '1981-05-12', 'American'),
(116, 'Randy Quaid', '1950-10-01', 'American'),
(117, 'Rex Harrison', '1900-01-01', 'N/A'),
(118, 'Richard Gere', '1949-08-31', 'American'),
(119, 'Robin Williams', '1951-07-21', 'American'),
(12, 'Bill Murray', '1950-09-21', 'American'),
(120, 'Robin Wright', '1966-04-08', 'American'),
(121, 'Robert Armstrong', '1890-11-20', 'American'),
(122, 'Robert Downey Jr.', '1965-04-04', 'American'),
(123, 'Robert Redford', '1936-08-18', 'American'),
(124, 'Robby Benson', '1956-01-21', 'American'),
(125, 'Rod Steiger', '1900-01-01', 'N/A'),
(126, 'Roger Moore', '1900-01-01', 'N/A'),
(127, 'Ronnie Howard', '1900-01-01', 'N/A'),
(128, 'Russell Crowe', '1964-04-07', 'New Zealander'),
(129, 'Ryan Gosling', '1980-11-12', 'Canadian'),
(13, 'Bill Skarsgård', '1990-08-09', 'Swedish'),
(130, 'Ryan Reynolds', '1976-10-23', 'Canadian'),
(131, 'Sam Neill', '1947-09-14', 'New Zealander'),
(132, 'Sam Worthington', '1976-08-02', 'Australian'),
(133, 'Sandra Bullock', '1964-07-26', 'American'),
(134, 'Scarlett Johansson', '1984-11-22', 'American');

SELECT * FROM dbo.Actors;
