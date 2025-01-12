/* Apple, Microsoft
Write a query that returns the number of unique users per client per month. */

CREATE TABLE fact_events (id INT PRIMARY KEY,time_id DATETIME,user_id VARCHAR(20),customer_id VARCHAR(50),client_id VARCHAR(20),event_type VARCHAR(50),event_id INT);

INSERT INTO fact_events (id, time_id, user_id, customer_id, client_id, event_type, event_id) VALUES
(1, '2020-02-28', '3668-QPYBK', 'Sendit', 'desktop', 'message sent', 3),
(2, '2020-02-28', '7892-POOKP', 'Connectix', 'mobile', 'file received', 2),
(3, '2020-04-03', '9763-GRSKD', 'Zoomit', 'desktop', 'video call received', 7),
(4, '2020-04-02', '9763-GRSKD', 'Connectix', 'desktop', 'video call received', 7),
(5, '2020-02-06', '9237-HQITU', 'Sendit', 'desktop', 'video call received', 7),
(6, '2020-02-27', '8191-XWSZG', 'Connectix', 'desktop', 'file received', 2),
(7, '2020-04-03', '9237-HQITU', 'Connectix', 'desktop', 'video call received', 7),
(8, '2020-03-01', '9237-HQITU', 'Connectix', 'mobile', 'message received', 4),
(9, '2020-04-02', '4190-MFLUW', 'Connectix', 'mobile', 'video call received', 7),
(10, '2020-04-21', '9763-GRSKD', 'Sendit', 'desktop', 'file received', 2);

