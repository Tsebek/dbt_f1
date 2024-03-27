with drivers_total_wins as (
    select
      race_year,
      driver_id,
      name_code,
      first_name,
      last_name,
      max(wins) as total_wins
    from {{ ref("int__driver_standings_by_years") }}
    group by 1,2,3,4,5
),

ranked_drivers as (
    select
      dtw.*,
      dense_rank() over(partition by race_year order by total_wins desc) as wins_rank
    from drivers_total_wins as dtw
)

select
  race_year,
  driver_id,
  name_code,
  first_name,
  last_name,
  total_wins
from ranked_drivers
where 1=1
  and wins_rank = 1