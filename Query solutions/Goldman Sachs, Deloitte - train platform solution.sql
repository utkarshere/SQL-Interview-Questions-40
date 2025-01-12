WITH events AS (
    SELECT 
        train_id,
        arrival_time AS event_time,
        'arrival' AS event_type
    FROM train_arrivals
    UNION ALL
    SELECT 
        train_id,
        departure_time AS event_time,
        'departure' AS event_type
    FROM train_departures
),
ordered_events AS (
    SELECT 
        event_time,
        event_type,
        ROW_NUMBER() OVER (ORDER BY event_time, event_type = 'departure') AS event_order
    FROM events
),
platform_usage AS (
    SELECT 
        event_time,
        event_type,
        SUM(CASE WHEN event_type = 'arrival' THEN 1 ELSE -1 END) 
        OVER (ORDER BY event_time, event_order) AS platforms_in_use
    FROM ordered_events
)
SELECT MAX(platforms_in_use) AS minimum_platforms_needed
FROM platform_usage;
