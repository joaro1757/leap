select 
    r.repo_id,
    r.repo_name
from 
    {{ ref('stg_github__repos') }} r
qualify
    row_number () over (partition by r.repo_id order by r.last_seen desc, r.first_seen desc) = 1