
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

/*
with source_data as (

    select 1 as id
    union all
    select null as id

)


with source_data2 as (

    select * from report.data

)

*/

with source_beers as (

    select id as beer_id,upper(name) as beer_name, upper(tagline) as beer_tagline, upper(first_brewed)  as beer_first_brewed, abv as beer_abv   from report.stg_beers

),

 source_beers_food_pairing as (

    select *  from report.stg_beers_food_pairing

),

joined_beer as (
select * from
 source_beers, source_beers_food_pairing where source_beers.beer_id= source_beers_food_pairing.id
)

select * from joined_beer

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
