SELECT * FROM boi_transactions;

SELECT transaction_id
FROM boi_transactions
WHERE year(time_stamp) = 2022 and month(time_stamp) = 12 and (
DAY(time_stamp) in (1,7)
or CAST(time_stamp as time ) <'09:00:00'
or CAST(time_stamp as time ) >'16:00:00'
or DAY(time_stamp) in (25,26) and MONTH(time_stamp) = 12)