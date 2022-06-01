view: covid_it {
  sql_table_name: `NewDataset.covid_it`
    ;;

  dimension: confirmed_cases {
    type: number
    sql: ${TABLE}.confirmed_cases ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: province_abbreviation {
    type: string
    sql: ${TABLE}.province_abbreviation ;;
  }

  dimension: province_code {
    type: string
    sql: ${TABLE}.province_code ;;
  }

  dimension: province_name {
    type: string
    sql: ${TABLE}.province_name ;;
  }

  dimension: region_code {
    type: string
    sql: ${TABLE}.region_code ;;
  }

  dimension: long_lat {
    type: location
    sql_latitude:${latitude}  ;;
    sql_longitude:${latitude}  ;;
}

  measure: count {
    type: count
    drill_fields: [name, province_name]
  }

  measure: total_cases {
    type: sum
    sql: sum${confirmed_cases};;
  }
}
