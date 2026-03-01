SELECT COUNT(*) FROM spotify_tracks;

SELECT * FROM spotify_tracks LIMIT 5;

SELECT 
    COUNT(*) FILTER (WHERE popularity IS NULL) AS null_popularity,
    COUNT(*) FILTER (WHERE danceability IS NULL) AS null_danceability,
    COUNT(*) FILTER (WHERE energy IS NULL) AS null_energy,
    COUNT(*) FILTER (WHERE tempo IS NULL) AS null_tempo
FROM spotify_tracks;

SELECT 
    MIN(popularity) AS min_popularity,
    MAX(popularity) AS max_popularity
FROM spotify_tracks;

SELECT 
    MIN(duration_ms) AS min_duration,
    MAX(duration_ms) AS max_duration
FROM spotify_tracks;

SELECT track_id, COUNT(*)
FROM spotify_tracks
GROUP BY track_id
HAVING COUNT(*) > 1;

SELECT DISTINCT time_signature
FROM spotify_tracks
ORDER BY time_signature;