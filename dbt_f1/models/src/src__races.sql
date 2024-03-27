with races as (
    select
      *
    from {{ source('f1', 'races') }}
)

select
  raceId as race_id,
  year as race_year,
  round as round_number,
  circuitId as circuit_id,
  name as race_name,
  date as race_date,
  time as race_time,
  quali_date,
  quali_time,
  sprint_date,
  sprint_time
from races