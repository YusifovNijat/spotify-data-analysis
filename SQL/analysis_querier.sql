SELECT 
    genre,
    COUNT(*) AS total_tracks,
    ROUND(AVG(popularity),2) AS avg_popularity,
    ROUND(MAX(popularity),2) AS max_popularity
FROM spotify_tracks
GROUP BY genre
ORDER BY avg_popularity DESC
LIMIT 10;


SELECT 
    CASE 
        WHEN energy < 0.2 THEN 'Very Low Energy'
        WHEN energy < 0.4 THEN 'Low Energy'
        WHEN energy < 0.6 THEN 'Medium Energy'
        WHEN energy < 0.8 THEN 'High Energy'
        ELSE 'Very High Energy'
    END AS energy_category,
    ROUND(AVG(popularity),2) AS avg_popularity,
    COUNT(*) AS track_count
FROM spotify_tracks
GROUP BY energy_category
ORDER BY avg_popularity DESC;

SELECT 
    artist_name,
    COUNT(*) AS tracks,
    ROUND(AVG(popularity),2) AS avg_popularity
FROM spotify_tracks
GROUP BY artist_name
HAVING COUNT(*) > 20
ORDER BY avg_popularity DESC
LIMIT 10;

SELECT
    percentile_cont(0.25) WITHIN GROUP (ORDER BY popularity) AS p25,
    percentile_cont(0.50) WITHIN GROUP (ORDER BY popularity) AS median,
    percentile_cont(0.75) WITHIN GROUP (ORDER BY popularity) AS p75,
    percentile_cont(0.90) WITHIN GROUP (ORDER BY popularity) AS p90
FROM spotify_tracks;

SELECT
    CASE
        WHEN duration_ms < 120000 THEN 'Under 2 min'
        WHEN duration_ms < 180000 THEN '2-3 min'
        WHEN duration_ms < 240000 THEN '3-4 min'
        WHEN duration_ms < 300000 THEN '4-5 min'
        ELSE 'Over 5 min'
    END AS duration_category,
    ROUND(AVG(popularity),2) AS avg_popularity,
    COUNT(*) AS tracks
FROM spotify_tracks
GROUP BY duration_category
ORDER BY avg_popularity DESC;

SELECT
    genre,
    CASE 
        WHEN energy < 0.6 THEN 'Low/Medium'
        ELSE 'High'
    END AS energy_group,
    ROUND(AVG(popularity),2) AS avg_popularity,
    COUNT(*) AS tracks
FROM spotify_tracks
GROUP BY genre, energy_group
ORDER BY avg_popularity DESC
LIMIT 15;


SELECT *
FROM (
    SELECT 
        genre,
        artist_name,
        track_name,
        popularity,
        NTILE(10) OVER (PARTITION BY genre ORDER BY popularity DESC) AS popularity_decile
    FROM spotify_tracks
) ranked
WHERE popularity_decile = 1
ORDER BY genre, popularity DESC;