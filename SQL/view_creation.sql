CREATE OR REPLACE VIEW spotify_analysis_view AS
SELECT
    genre,
    artist_name,
    track_name,
    popularity,
    duration_ms / 60000.0 AS duration_minutes,
    energy,
    danceability,
    valence,
    tempo
FROM spotify_tracks;

CREATE OR REPLACE VIEW spotify_kpis AS
SELECT
    COUNT(*) AS total_tracks,
    ROUND(AVG(popularity),2) AS avg_popularity,
    ROUND(AVG(duration_ms)/60000.0,2) AS avg_duration_minutes,
    ROUND(AVG(energy),2) AS avg_energy,
    ROUND(AVG(danceability),2) AS avg_danceability
FROM spotify_tracks;

CREATE OR REPLACE VIEW spotify_enriched AS
SELECT
    genre,
    artist_name,
    track_name,
    popularity,
    duration_ms / 60000.0 AS duration_minutes,
    energy,
    danceability,
    valence,
    tempo,
    
    CASE
        WHEN popularity >= 63 THEN 'Top 10%'
        WHEN popularity >= 55 THEN 'Top 25%'
        WHEN popularity >= 43 THEN 'Above Median'
        ELSE 'Below Median'
    END AS popularity_segment,

    CASE
        WHEN duration_ms < 120000 THEN 'Under 2 min'
        WHEN duration_ms < 180000 THEN '2-3 min'
        WHEN duration_ms < 240000 THEN '3-4 min'
        WHEN duration_ms < 300000 THEN '4-5 min'
        ELSE 'Over 5 min'
    END AS duration_category,

    CASE
        WHEN energy < 0.6 THEN 'Low/Medium Energy'
        ELSE 'High Energy'
    END AS energy_category

FROM spotify_tracks;