view: covid_it_region {
  sql_table_name: `NewDataset.covid_it_region`
    ;;


  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  parameter: select_measure {
    type: unquoted
    allowed_value: {
      label: "Total Confirmed Cases"
      value: "total_confirmed_cases"
    }
    allowed_value: {
      label: "Total Hospitalized"
      value: "total_hospitalized_patients"
    }
    allowed_value: {
      label: "Total Deaths"
      value: "deaths"
    }
  }

  measure: dynamic_sum {
    type: sum
    sql: ${TABLE}.{% parameter select_measure %} ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

parameter: select_timeframe {
  type: unquoted
  default_value: "date_month"
  allowed_value: {
    value: "date_date"
    label: "Date"
  }
  allowed_value: {
    value: "date_week"
    label: "Week"
  }
  allowed_value: {
    value: "date_month"
    label: "Month"
  }
  allowed_value: {
    value: "date_year"
    label: "Year"
  }
}

  dimension: dynamic_timeframe {
    label_from_parameter: select_timeframe
    type: string
    sql:
    {% if select_timeframe._parameter_value == 'date_date' %}
    ${date_date}
    {% elsif select_timeframe._parameter_value == 'date_week' %}
    ${date_week}
    {% elsif select_timeframe._parameter_value == 'date_year' %}
    ${date_year}
    {% else %}
    ${date_month}
    {% endif %} ;;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: home_confinement_cases {
    type: number
    sql: ${TABLE}.home_confinement_cases ;;
  }

  dimension: hospitalized_patients_intensive_care {
    type: number
    sql: ${TABLE}.hospitalized_patients_intensive_care ;;
  }

  dimension: hospitalized_patients_symptoms {
    type: number
    sql: ${TABLE}.hospitalized_patients_symptoms ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location_geom {
    type: string
    sql: ${TABLE}.location_geom ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: new_current_confirmed_cases {
    type: number
    sql: ${TABLE}.new_current_confirmed_cases ;;
  }

  dimension: new_total_confirmed_cases {
    type: number
    sql: ${TABLE}.new_total_confirmed_cases ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: recovered {
    type: number
    sql: ${TABLE}.recovered ;;
  }

  dimension: region_code {
    hidden: yes
    type: string
    sql: ${TABLE}.region_code ;;
  }

  filter: filter_on_field_to_hide {
    type: string
    sql: {% condition filter_on_field_to_hide %} ${region_code} {% endcondition %} ;;
  }

  dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }

  dimension: tests_performed {
    type: number
    sql: ${TABLE}.tests_performed ;;
  }

  dimension: total_confirmed_cases {
    type: number
    sql: ${TABLE}.total_confirmed_cases ;;
  }

  dimension: total_current_confirmed_cases {
    type: number
    sql: ${TABLE}.total_current_confirmed_cases ;;
  }

  dimension: total_hospitalized_patients {
    type: number
    sql: ${TABLE}.total_hospitalized_patients ;;
  }

  dimension: long_lat {
    type: location
    sql_latitude:${latitude}  ;;
    sql_longitude:${longitude}  ;;
  }

  measure: total_cases {
    type: sum
    sql: ${total_confirmed_cases};;
  }

  measure: count {
    type: count
    drill_fields: [region_name]
  }

measure: total_deaths {
  type: sum
  sql: ${deaths} ;;
}
}
