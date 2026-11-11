select 
    e.id,
    e.created_at_timestamp,
    e.type,
    e.actor_id,
    e.actor_login,
    e.repo_id,
    e.payload_action,
    e.load_date,
    endswith(e.actor_login, '[bot]')::int as is_bot,
    (dayofweekiso(e.created_at_timestamp) in (6,7))::int as is_weekend,
    (month(e.created_at_timestamp) = 12 and day(e.created_at_timestamp) between 24 and 26)::int as is_christmas
from 
    {{ ('stg_github__events') }} e
inner join 
    {{ ('contestants') }} c
    using(repo_id)