with championship_results as (
    select
      *
    from {{ ref("int__driver_standings_by_years") }}
)

select
  race_year,
  driver_id,
  name_code,
  first_name,
  last_name,
  max(points) as total_points
from championship_results
group by 1,2,3,4,5