/*A table named “famous” has two columns called user id and follower id. 
It represents each user ID has a particular follower ID. 
Then, find the famous percentage of each user. 
Famous Percentage = number of followers a user has / total number of users on the platform*/

USE PRACTICE;
CREATE TABLE famous (user_id INT, follower_id INT);
INSERT INTO famous VALUES
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3), 
(11, 7), (12, 8), (13, 5), (13, 10), 
(14, 12), (14, 3), (15, 14), (15, 13);

