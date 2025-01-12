SELECT * FROM hotel_address;

SELECT hotel_name, average_score
FROM
(
SELECT hotel_name, average_score, DENSE_RANK() OVER (ORDER BY average_score DESC) AS ranking
FROM
hotel_address
) AS sub
WHERE
ranking <=3