/* Expedia, Airbnb
Find the number of rows for each review score earned by 'Hotel Arena'. 
Output the hotel name (which should be 'Hotel Arena'), review score along with the corresponding number of rows with that score for the specified hotel.*/

CREATE TABLE hotel_reviews (hotel_address VARCHAR(255),additional_number_of_scoring INT,review_date DATETIME,average_score FLOAT,
							hotel_name VARCHAR(100),reviewer_nationality VARCHAR(100),negative_review TEXT,
                            review_total_negative_word_counts INT,total_number_of_reviews INT,positive_review TEXT,
                            review_total_positive_word_counts INT,total_number_of_reviews_reviewer_has_given INT,
                            reviewer_score FLOAT,tags VARCHAR(255),days_since_review VARCHAR(50),lat FLOAT,lng FLOAT);

INSERT INTO hotel_reviews (hotel_address, additional_number_of_scoring,review_date, average_score, hotel_name, reviewer_nationality,negative_review,review_total_negative_word_counts, total_number_of_reviews,positive_review,review_total_positive_word_counts, total_number_of_reviews_reviewer_has_given, reviewer_score, tags, days_since_review, lat, lng) VALUES
('123 Main St', 5, '2024-01-01', 8.5, 'Hotel Arena', 'American', 'Noisy room', 3, 200, 'Great staff', 5, 10, 8.0, 'Family stay', '100 days', 40.7128, -74.0060),
('123 Main St', 2, '2024-01-02', 8.5, 'Hotel Arena', 'British', 'Small bathroom', 2, 200, 'Clean room', 6, 5, 9.0, 'Solo traveler', '95 days', 40.7128, -74.0060),
('123 Main St', 3, '2024-01-03', 8.5, 'Hotel Arena', 'Canadian', 'Slow service', 4, 200, 'Nice view', 7, 3, 6.0, 'Couple stay', '90 days', 40.7128, -74.0060);

