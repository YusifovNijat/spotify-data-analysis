DROP TABLE IF EXISTS spotify_tracks;

CREATE TABLE spotify_tracks (
    genre TEXT,
    artist_name TEXT,
    track_name TEXT,
    track_id TEXT,
    popularity INTEGER,
    acousticness NUMERIC,
    danceability NUMERIC,
    duration_ms INTEGER,
    energy NUMERIC,
    instrumentalness NUMERIC,
    key TEXT,
    liveness NUMERIC,
    loudness NUMERIC,
    mode TEXT,
    speechiness NUMERIC,
    tempo NUMERIC,
    time_signature TEXT,
    valence NUMERIC
);

TRUNCATE TABLE spotify_tracks;