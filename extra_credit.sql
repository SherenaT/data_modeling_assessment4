-- Artist Table
-- Select 10 artists in reverse alphabetical order.
SELECT * FROM artist
ORDER BY name DESC
LIMIT 10

-- Select all artists that start with the word ‘Black’.
SELECT * FROM artist
WHERE name LIKE 'Black%'

-- Select all artists that contain the word ‘Black’.
SELECT * FROM artist
WHERE name LIKE '%Black%'

-- Employee Table
-- Find the birthdate for the youngest employee.
SELECT first_name, last_name, birth_date FROM employee
WHERE birth_date = (SELECT MAX(birth_date) FROM employee)

-- Find the birthdate for the oldest employee.
SELECT first_name, last_name, birth_date FROM employee
WHERE birth_date = (SELECT MIN(birth_date) FROM employee)

-- Invoice Table
-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT (billing_state) FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ')

-- Get the average total of the orders.
SELECT AVG(total) FROM invoice

-- More Join Queries
-- Get all playlist_track track_ids where the playlist name is Music.
SELECT * FROM playlist_track pt
JOIN playlist p
ON p.playlist_id = pt.playlist_id
WHERE name = 'Music'

-- Get all track names for playlist_id 5.
SELECT t.name, pt.playlist_id FROM track t
JOIN playlist_track pt
ON pt.track_id = t.track_id
WHERE playlist_id = 5


-- Get all track names and the playlist name that they’re on ( 2 joins ).
SELECT t.name, playlist.name, playlist_track.playlist_id, playlist_track.track_id
FROM track t
JOIN playlist_track ON playlist_track.track_id = t.track_id
JOIN playlist ON playlist.playlist_id = playlist_track.playlist_id

-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
SELECT g.name AS "Genre Name", a.title AS "Album Title"
FROM genre g
JOIN  track t ON t.genre_id = g.genre_id
JOIN  album a ON t.album_id = a.album_id
WHERE g.name = 'Alternative & Punk'