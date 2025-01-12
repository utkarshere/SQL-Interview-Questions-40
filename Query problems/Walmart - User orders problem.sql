USE PRACTICE;
/* Walmart
Identify users who started a session and placed an order on the same day. 
For these users, calculate the total number of orders and the total order value for that day. 
Your output should include the user, the session date, the total number of orders, and the total order value for that day. */

CREATE TABLE walmart_sessions(session_id INT, user_id INT, session_date DATETIME);

INSERT INTO walmart_sessions (session_id, user_id, session_date) VALUES (1, 1, '2024-01-01'), (2, 2, '2024-01-02'), (3, 3, '2024-01-05'), (4, 3, '2024-01-05'), (5, 4, '2024-01-03'), (6, 4, '2024-01-03'), (7, 5, '2024-01-04'), (8, 5, '2024-01-04'), (9, 3, '2024-01-05'), (10, 5, '2024-01-04');

CREATE TABLE walmart_order_summary (order_id INT, user_id INT, order_value INT, order_date DATETIME);

INSERT INTO walmart_order_summary (order_id, user_id, order_value, order_date) VALUES (1, 1, 152, '2024-01-01'), (2, 2, 485, '2024-01-02'), (3, 3, 398, '2024-01-05'), (4, 3, 320, '2024-01-05'), (5, 4, 156, '2024-01-03'), (6, 4, 121, '2024-01-03'), (7, 5, 238, '2024-01-04'), (8, 5, 70, '2024-01-04'), (9, 3, 152, '2024-01-05'), (10, 5, 171, '2024-01-04');

