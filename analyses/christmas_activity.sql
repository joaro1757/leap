with daily as (
    select 
        f.repo_id,
        f.created_at_timestamp::date as date,
        max(f.is_christmas) as is_christmas,
        count(*) as events
    from 
        {{ ref('fct_events') }} f
    where 
        f.is_bot = 0
    group by 
        all
)

select 
    r.tool,
    avg(iff(d.is_christmas = 1, d.events, null)) as events_per_christmas_day,
    avg(iff(d.is_christmas = 0, d.events, null)) as events_per_normal_day,
    events_per_christmas_day / events_per_normal_day as christmas_ratio
from 
    daily d
inner join 
    {{ ref('dim_repos') }} r
    using (repo_id)
group by 
    all 
order by 
    christmas_ratio desc