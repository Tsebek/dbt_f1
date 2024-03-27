with driver_stands as (
    select 
      *
    from {{ source('f1', 'driver_standings') }}
)

select
  driverStandingsId as driver_stands_id,
  raceId as race_id,
  driverId as driver_id,
  points,
  position,
  wins
from driver_stands