SELECT * FROM hotel_reviews;

SELECT
	hotel_name, reviewer_score, row_number() OVER(PARTITION BY reviewer_score) AS row_num
FROM
	hotel_reviews
WHERE hotel_name = 'Hotel Arena'