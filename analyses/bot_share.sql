select 
    r.tool,
    count(*) as events,
    avg(f.is_bot) as bot_share
from 
    {{ ref('fct_events') }} f
inner join 
    {{ ref('dim_repos') }} r
    using(repo_id)
group by 
    all 
order by 
    bot_share desc