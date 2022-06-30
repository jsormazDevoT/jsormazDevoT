connection: "covid_practice"

# include all the views
include: "/views/**/*.view"

datagroup: jelena_covid_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: jelena_covid_default_datagroup

explore: covid_it {
 # conditionally_filter: {
   # filters: [date_date: "3 months"]
  #  unless: [region_code, province_code]
 # }

      join: covid_it_region {
        sql_on: ${covid_it.region_code} = ${covid_it_region.region_code};;
        relationship: one_to_one
        type: left_outer # Could be excluded since left_outer is the default
      }

     join: covid_gov_response {
       sql_on: ${covid_it.region_code}=${covid_gov_response.alpha_3_code} ;;
      relationship: one_to_one
      type: left_outer
     }

}
