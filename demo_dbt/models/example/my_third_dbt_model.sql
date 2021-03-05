
-- Use the `ref` function to select from other models

select count(*) as count_of_beers--id, id::int4 +7 as plus_7
from {{ ref('my_first_dbt_model') }}
--where id = 1
