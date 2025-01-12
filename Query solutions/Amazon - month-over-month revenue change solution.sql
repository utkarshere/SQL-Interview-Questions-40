WITH monthly_total AS
(
    SELECT
        DATE_FORMAT(created_at, '%Y-%m') AS y_m, 
        SUM(value) AS month_total
    FROM
        sf_transactions
    GROUP BY y_m
),
previous_value AS
(
SELECT 
    y_m,
    month_total,
    LAG(month_total) OVER(ORDER BY y_m) AS previous_revenue
FROM
	monthly_total
)
SELECT y_m,
month_total,
ROUND(
	CASE
		WHEN previous_revenue is NULL THEN NULL
        ELSE ((month_total - previous_revenue)/CAST(previous_revenue AS FLOAT)) * 100
        END, 2
       ) AS percentage_change
FROM
    previous_value
ORDER BY y_m
