select 
    s.repo_id,
    s.date,
    s.star_count
from 
    {{ ref('stg_github__stars') }} s
inner join 
    {{ ref('contestants') }} c
    using(repo_id)