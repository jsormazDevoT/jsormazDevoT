include: "covid_it_region.view"
view: pop_parameters {
    extends: [covid_it_region]


  filter: current_date_range {
    type: date
    view_label: "_PoP"
    label: "1. Current Date Range"
    description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
    sql: ${period} IS NOT NULL ;;
  }

  parameter: compare_to {
    view_label: "_PoP"
    description: "Select the templated previous period you would like to compare to. Must be used with Current Date Range filter"
    label: "2. Compare To:"
    type: unquoted
    default_value: "Period"
    allowed_value: {
      label: "Previous Period"
      value: "Period"
    }
    allowed_value: {
      label: "Previous Week"
      value: "Week"
    }
    allowed_value: {
      label: "Previous Month"
      value: "Month"
    }
    allowed_value: {
      label: "Previous Quarter"
      value: "Quarter"
    }
    allowed_value: {
      label: "Previous Year"
      value: "Year"
    }

  }

  dimension: days_in_period {
    hidden:  yes
    view_label: "_PoP"
    description: "Gives the number of days in the current period date range"
    type: number
    sql: DATEDIFF(DAY, DATE({% date_start current_date_range %}), DATE({% date_end current_date_range %})) ;;
  }

  dimension: period_2_start {
    hidden:  yes
    view_label: "_PoP"
    description: "Calculates the start of the previous period"
    type: date
    sql:
            {% if compare_to._parameter_value == "Period" %}
            DATEADD(DAY, -${days_in_period}, DATE({% date_start current_date_range %}))
            {% else %}
            DATEADD({% parameter compare_to %}, -1, DATE({% date_start current_date_range %}))
            {% endif %};;
  }

  dimension: period_2_end {
    hidden:  yes
    view_label: "_PoP"
    description: "Calculates the end of the previous period"
    type: date
    sql:
            {% if compare_to._parameter_value == "Period" %}
            DATEADD(DAY, -1, DATE({% date_start current_date_range %}))
            {% else %}
            DATEADD({% parameter compare_to %}, -1, DATEADD(DAY, -1, DATE({% date_end current_date_range %})))
            {% endif %};;
  }

  dimension: day_in_period {
    hidden: yes
    description: "Gives the number of days since the start of each period. Use this to align the event dates onto the same axis, the axes will read 1,2,3, etc."
    type: number
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${date_raw} {% endcondition %}
            THEN DATEDIFF(DAY, DATE({% date_start current_date_range %}), ${date_date}) + 1
            WHEN ${date_date} between ${period_2_start} and ${period_2_end}
            THEN DATEDIFF(DAY, ${period_2_start}, ${date_date}) + 1
            END
        {% else %} NULL
        {% endif %}
        ;;
  }

  dimension: order_for_period {
    hidden: yes
    type: number
    sql:
            {% if current_date_range._is_filtered %}
                CASE
                WHEN {% condition current_date_range %} ${date_raw} {% endcondition %}
                THEN 1
                WHEN ${date_date} between ${period_2_start} and ${period_2_end}
                THEN 2
                END
            {% else %}
                NULL
            {% endif %}
            ;;
  }

  dimension_group: date_in_period {
    description: "Use this as your grouping dimension when comparing periods. Aligns the previous periods onto the current period"
    label: "Current Period"
    type: time
    sql: DATEADD(DAY, ${day_in_period} - 1, DATE({% date_start current_date_range %})) ;;
    view_label: "_PoP"
    timeframes: [
      date,
      hour_of_day,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week_of_year,
      month,
      month_name,
      month_num,
      year]
  }

  dimension: period {
    view_label: "_PoP"
    label: "Period"
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period' or 'Previous Period'"
    type: string
    order_by_field: order_for_period
    sql:
            {% if current_date_range._is_filtered %}
                CASE
                WHEN {% condition current_date_range %} ${date_raw} {% endcondition %}
                THEN 'This {% parameter compare_to %}'
                WHEN ${date_date} between ${period_2_start} and ${period_2_end}
                THEN 'Last {% parameter compare_to %}'
                END
            {% else %}
                NULL
            {% endif %}
            ;;
  }

  dimension: period_filtered_measures {
    hidden: yes
    description: "We just use this for the filtered measures"
    type: string
    sql:
            {% if current_date_range._is_filtered %}
                CASE
                WHEN {% condition current_date_range %} ${date_raw} {% endcondition %} THEN 'this'
                WHEN ${date_date} between ${period_2_start} and ${period_2_end} THEN 'last' END
            {% else %} NULL {% endif %} ;;
  }

  measure: current_period_confirmed {
    view_label: "_PoP"
    type: sum
    sql: ${total_confirmed_cases};;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_confirmed {
    view_label: "_PoP"
    type: sum
    sql: ${total_confirmed_cases};;
    filters: [period_filtered_measures: "last"]
  }

  measure: sales_pop_change {
    view_label: "_PoP"
    label: "Total Sales period-over-period % change"
    type: number
    sql: CASE WHEN ${current_period_confirmed} = 0
                THEN NULL
                ELSE (1.0 * ${current_period_confirmed} / NULLIF(${previous_period_confirmed} ,0)) - 1 END ;;
    value_format_name: percent_2
  }

}
