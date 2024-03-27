with drivers as (
    select
      *
    from {{ source('f1', 'drivers') }} 
)

select
  driverId as driver_id,
  driverRef as driver_ref,
  number as driver_number,
  code as name_code,
  forename as first_name,
  surname as last_name,
  dob as birthday,
  nationality
from drivers