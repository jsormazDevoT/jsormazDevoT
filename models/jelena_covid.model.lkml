connection: "covid_practice"

# include all the views
include: "/views/**/*.view"

datagroup: jelena_covid_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: jelena_covid_default_datagroup

explore: covid_it {}
