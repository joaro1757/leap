select 
    s.repo_id,
    s.date,
    s.count as star_count
from 
    {{ source('github', 'github_stars') }} s