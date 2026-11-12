select 
    r.tool,
    date_trunc('month', s.date) as month,
    sum(s.star_count) as stars_gained,
    sum(stars_gained) over (partition by r.tool order by month) as stars_total
from 
    {{ ref('fct_repo_stars_daily') }} s
inner join 
    {{ ref('dim_repos') }} r
    using(repo_id)
group by 
    all 
order by 
    month,
    r.tool