with cte as 
 (select customer_id, user_id , count(*) as cnt 
 from mfact_events 
 where client_id = 'desktop' and user_id not in (select user_id from mfact_events where client_id <> 'desktop')
 group by customer_id, user_id)
 
select customer_id , count(distinct user_id) as desktop_only_user
from cte
group by customer_id
order by desktop_only_user desc
limit 1