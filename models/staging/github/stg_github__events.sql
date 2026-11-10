-- what happened, when, who did it, and to which repo.
select 
    e.id,
    e.created_at_timestamp,
    e.type,
    e.actor_id,
    e.actor_login,
    e.repo_id,
    e.repo_name,
    e.payload_action,
    e.load_date::date as load_date
from 
    {{ source('github', 'github_events') }} e