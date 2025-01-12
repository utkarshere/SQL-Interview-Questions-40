USE practice;
/* Calculate the average session distance traveled by Google Fit users using GPS data for two scenarios:
 Considering Earth's curvature (Haversine formula).
 Assuming a flat surface.
For each session, use the distance between the highest and lowest step IDs, and ignore sessions with only one step. Calculate and output the average distance for both scenarios and the difference between them.

Formulas:
1. Curved Earth: d=6371×arccos(sin(ϕ1​)×sin(ϕ2​)+cos(ϕ1​)×cos(ϕ2​)×cos(λ2​−λ1​))
2. Flat Surface: d=111×(lat2​−lat1​)2+(lon2​−lon1​)2​*/

CREATE TABLE google_fit_location (user_id VARCHAR(50),session_id INT,step_id INT,day INT,latitude FLOAT,longitude FLOAT,altitude FLOAT);

INSERT INTO google_fit_location (user_id, session_id, step_id, day, latitude, longitude, altitude)VALUES('user_1', 101, 1, 1, 37.7749, -122.4194, 15.0),('user_1', 101, 2, 1, 37.7750, -122.4195, 15.5),('user_1', 101, 3, 1, 37.7751, -122.4196, 16.0),('user_1', 102, 1, 1, 34.0522, -118.2437, 20.0),('user_1', 102, 2, 1, 34.0523, -118.2438, 20.5),('user_2', 201, 1, 1, 40.7128, -74.0060, 5.0),('user_2', 201, 2, 1, 40.7129, -74.0061, 5.5),('user_2', 202, 1, 1, 51.5074, -0.1278, 10.0),('user_2', 202, 2, 1, 51.5075, -0.1279, 10.5),('user_3', 301, 1, 1, 48.8566, 2.3522, 25.0),('user_3', 301, 2, 1, 48.8567, 2.3523, 25.5)