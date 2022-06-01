view: map {
  dimension: long_lat {
    type: location
    sql_latitude:${TABLE}.latitude ;;
    sql_longitude:${TABLE}.longitude ;;
  }
}
