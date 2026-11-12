select
    r.tool,
    count(*) as events,
    avg(f.is_weekend) as weekend_share
from
    {{ ref('fct_events') }} f
inner join
    {{ ref('dim_repos') }} r
    using (repo_id)
where
    f.is_bot = 0
group by 
    all
order by
    weekend_share desc