USE music;

SELECT
  CONCAT(a.artist_name, ' recorded ', b.album_name) AS Recording
FROM
  artist a
JOIN
  album b ON a.artist_id = b.artist_id;

SELECT artist_name, album_name FROM artist JOIN album ON artist.artist_id = album.artist_id
WHERE artist.artist_id IN (SELECT artist_id FROM album);

SELECT artist.artist_name, album.album_name
FROM artist
JOIN album ON artist.artist_id = album.artist_id
ORDER BY artist.artist_name, album.album_name;

SELECT
  a.album_name,
  t.track_name
FROM
  album a
JOIN
  track t ON a.album_id = t.album_id AND a.artist_id = t.artist_id
ORDER BY
  a.album_name, t.track_name;

SELECT artist.artist_name, album.album_name, track.track_name, track.time, was_played_at.played
FROM track
JOIN was_played_at ON track.track_id = was_played_at.track_id
JOIN album ON track.artist_id = album.artist_id AND track.album_id = album.album_id
JOIN artist ON track.artist_id = artist.artist_id;
