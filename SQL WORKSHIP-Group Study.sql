
SELECT name, Composer
FROM tracks;


SELECT *
FROM tracks;

SELECT DISTINCT Composer
FROM tracks;

SELECT DISTINCT AlbumId, MediaTypeId
FROM tracks;

SELECT name, TrackId
FROM tracks
WHERE Composer = "Jorge Ben"

SELECT *
FROM invoices
WHERE Total  > 25;

SELECT *
FROM invoices
WHERE total < 15
LIMIT 5;

SELECT *
FROM invoices
WHERE total > 10
ORDER By total DESC
LIMIT 2;

SELECT*
FROM invoices
WHERE not BillingCountry = 'CANADA'
ORDER BY total ASC
LIMIT 10;

SELECT InvoiceId, CustomerId, total
FROM invoices
ORDER BY CustomerId, total DESC;

SELECT name
FROM tracks
WHERE name LIKE 'B%' AND name LIKE '%s';

SELECT InvoiceDate
FROM invoices
WHERE InvoiceDate between '2008-01-01' AND '2012-01-01'
ORDER BY InvoiceDate DESC
LIMIT 1; 

SELECT FirstName, LastName
FROM customers
WHERE country IN ('Belgium', 'Norway')

SELECT Composer, Name
FROM tracks
where Composer LIKE '%Zappa';

SELECT COUNT(*)
FROM tracks;

SELECT count(*)
FROM invoices;

SELECT count(DISTINCT Composer)
FROM tracks;

SELECT AlbumId,
COUNT(*) AS number_of_tracks
FROM tracks
GROUP BY AlbumId
ORDER BY number_of_tracks DESC; 


SELECT Name, MIN(Milliseconds)
FROM tracks;

SELECT Name, MAX(Milliseconds)
FROM tracks;

SELECT *
FROM tracks
WHERE Milliseconds < (SELECT AVG (Milliseconds) FROM tracks);

SELECT Composer, COUNT (*)
FROM tracks
Group BY Composer;
-------------------------------------
SELECT Composer, COUNT (Composer)
FROM tracks
Group BY Composer;
-----------------------------------------
SELECT Composer, COUNT (Composer)
FROM tracks
WHERE Composer IS NOT NULL
Group BY Composer;

SELECT tracks.name, genres.Name
FROM tracks 
JOIN genres
On tracks.GenreId = genres.GenreId;
------------------------------------------------------
SELECT t.name, g.name
FROM tracks t
JOIN genres g
On t.GenreId = g.Genreld;

SELECT*
from artists
LEFT JOIN albums
On albums.ArtistId = artists.ArtistId


SELECT tracks.AlbumId, albums.Title, 
MIN(tracks.Milliseconds) AS min_duration 
FROM tracks
JOIN albums
ON tracks.AlbumId = albums.AlbumId 
GROUP BY tracks.AlbumId, albums.Title 
ORDER BY min_duration DESC;
 
SELECT albums.Title, 
SUM(tracks.Milliseconds) AS total_duration 
FROM tracks
JOIN albums 
ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId
HAVING total_duration > 3600000 
ORDER BY total_duration DESC;


SELECT Trackid, Name, Albumid 
FROM tracks
WHERE albumid IN (
					SELECT AlbumId
					FROM albums
					WHERE Title 
					IN ('Prenda Minha', 'Heart of the Night', 'Out Of Exile'));



