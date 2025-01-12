WITH SessionMinMax AS (
    SELECT 
        user_id,
        session_id,
        day,
        MIN(CASE WHEN step_id = (SELECT MIN(step_id) 
                                 FROM google_fit_location AS sub 
                                 WHERE sub.user_id = gfl.user_id 
                                   AND sub.session_id = gfl.session_id 
                                   AND sub.day = gfl.day) THEN latitude END) AS start_lat,
        MIN(CASE WHEN step_id = (SELECT MIN(step_id) 
                                 FROM google_fit_location AS sub 
                                 WHERE sub.user_id = gfl.user_id 
                                   AND sub.session_id = gfl.session_id 
                                   AND sub.day = gfl.day) THEN longitude END) AS start_lon,
        MAX(CASE WHEN step_id = (SELECT MAX(step_id) 
                                 FROM google_fit_location AS sub 
                                 WHERE sub.user_id = gfl.user_id 
                                   AND sub.session_id = gfl.session_id 
                                   AND sub.day = gfl.day) THEN latitude END) AS end_lat,
        MAX(CASE WHEN step_id = (SELECT MAX(step_id) 
                                 FROM google_fit_location AS sub 
                                 WHERE sub.user_id = gfl.user_id 
                                   AND sub.session_id = gfl.session_id 
                                   AND sub.day = gfl.day) THEN longitude END) AS end_lon
    FROM 
        google_fit_location gfl
    WHERE 
        latitude IS NOT NULL AND longitude IS NOT NULL
    GROUP BY 
        user_id, session_id, day
    HAVING 
        COUNT(DISTINCT step_id) > 1
), Distances AS
(
SELECT
    user_id,
    session_id,
    day,
    (6371 * ACOS(
        SIN(RADIANS(start_lat)) * SIN(RADIANS(end_lat)) + 
        COS(RADIANS(start_lat)) * COS(RADIANS(end_lat)) * COS(RADIANS(end_lon - start_lon))
    )) AS distance_curved,
    (SQRT(POWER(end_lat - start_lat, 2) + POWER(end_lon - start_lon, 2)) * 111) AS distance_flat
FROM
    SessionMinMax
)
SELECT
	ROUND(AVG(distance_curved),6) AS avg_distance_curved,
    ROUND(AVG(distance_flat),6) AS avg_distance_flat,
    ROUND(AVG(distance_curved) - AVG(distance_flat),6) AS difference
FROM
	Distances