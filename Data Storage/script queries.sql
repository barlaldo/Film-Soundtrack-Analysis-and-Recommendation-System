-- Dato il nome dell'album otteniamo le canzoni e alcune caratteristiche
SELECT song_title, artists, danceability, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, duration_ms
FROM songs_features
WHERE album_title == 'Moana'

-- Dammi le canzoni che hanno speechiness più alta
SELECT *
FROM songs_features
WHERE speechiness > 0.9

-- Dammi una media del valore energy ogni album
SELECT  album_title, avg(energy)
FROM  songs_features
GROUP BY album_title

-- Dammi l'album che presenta media di danceability più alta
SELECT album_title, max(avg_danceability)
FROM (SELECT album_title, avg(danceability) AS avg_danceability
				FROM songs_features
				GROUP BY album_title)  AS maxDanceability

-- Dammi title e overview dei film che presentano una popularity > 50
SELECT title, overview, popularity
FROM films
WHERE popularity > 50

-- Dammi title e overview del film che presenta tra le loro colonne sonore la media di duration_ms più alta
SELECT title, overview, max(avg_duration_ms)
FROM (SELECT title, overview, avg(duration_ms) AS avg_duration_ms
				FROM films JOIN songs_features ON films.title = songs_features.album_title
				GROUP BY title) AS maxDuration_ms
				
-- Dammi la media  di energy per i film (divisi per genere)
SELECT genres, avg(energy)
FROM films_in_depth join songs_features on films_in_depth.title = songs_features.album_title
GROUP BY genres
