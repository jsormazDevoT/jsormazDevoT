view: covid_gov_response {
  sql_table_name: `my-sandbox-349912.NewDataset.covid_gov_response`
    ;;

  dimension: alpha_3_code {
    type: string
    description: "3-letter alpha code abbreviation of the country/region. See `bigquery-public-data.utility_us.country_code_iso` for more details"
    sql: ${TABLE}.alpha_3_code ;;
  }

  dimension: cancel_public_events {
    type: string
    description: "C3 - Ordinal scale record cancellations of public events;0- No measures 1 - Recommend cancelling 2 - Require cancelling No data - blank"
    sql: ${TABLE}.cancel_public_events ;;
  }

  dimension: cancel_public_events_flag {
    type: string
    description: "Are C3 actions targeted at specific areas or general:0 - Targeted 1- General No data - blank"
    sql: ${TABLE}.cancel_public_events_flag ;;
  }

  dimension: cancel_public_events_notes {
    type: string
    description: "Additional details about C3 policy actions"
    sql: ${TABLE}.cancel_public_events_notes ;;
  }

  dimension: close_public_transit {
    type: string
    description: "C5 - Ordinal scale to record closing of public transportation; 0 - No measures 1 - Recommend closing (or significantly reduce volume/route/means of transport available) 2 - Require closing (or prohibit most citizens from using it)"
    sql: ${TABLE}.close_public_transit ;;
  }

  dimension: close_public_transit_flag {
    type: string
    description: "Are C5 actions targeted at specific areas or general:0 - Targeted 1- General No data - blank"
    sql: ${TABLE}.close_public_transit_flag ;;
  }

  dimension: close_public_transit_notes {
    type: string
    description: "Additional details about C5 policy actions"
    sql: ${TABLE}.close_public_transit_notes ;;
  }

  dimension: confirmed_cases {
    type: number
    description: "Number of confirmed COVID-19 cases"
    sql: ${TABLE}.confirmed_cases ;;
  }

  dimension: contact_tracing {
    type: string
    description: "H3 - Ordinal scale record if governments doing contact tracing; 0 - No contact tracing 1 - Limited contact tracing - not done for all cases 2 - Comprehensive contact tracing - done for all cases No data"
    sql: ${TABLE}.contact_tracing ;;
  }

  dimension: contact_tracing_notes {
    type: string
    description: "Additional details about H3 policy actions"
    sql: ${TABLE}.contact_tracing_notes ;;
  }

  dimension: country_name {
    type: string
    description: "Name of the country"
    sql: ${TABLE}.country_name ;;
  }

  dimension_group: date {
    type: time
    description: "Date of the measured policy action status"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: deaths {
    type: number
    description: "Number of confirmed COVID-19 deaths"
    sql: ${TABLE}.deaths ;;
  }

  dimension: debt_contract_relief {
    type: string
    description: "E2 - Record if govt. is freezing financial obligations (eg stopping loan repayments preventing services like water from stopping or banning evictions)"
    sql: ${TABLE}.debt_contract_relief ;;
  }

  dimension: debt_contract_relief_notes {
    type: string
    description: "Additional details about E2 policy actions"
    sql: ${TABLE}.debt_contract_relief_notes ;;
  }

  dimension: emergency_healthcare_investment {
    type: number
    description: "H4 - Short-term spending on e.g hospitals masks etc in USD; Record monetary value in USD of new short-term spending on health. If none enter 0. No data - blank Please use the exchange rate of the date you are coding not the current date."
    sql: ${TABLE}.emergency_healthcare_investment ;;
  }

  dimension: emergency_healthcare_investment_notes {
    type: string
    description: "Additional details about H4 policy actions"
    sql: ${TABLE}.emergency_healthcare_investment_notes ;;
  }

  dimension: fiscal_measures {
    type: number
    description: "E3 - What economic stimulus policies are adopted (in USD); Record monetary value USD of fiscal stimuli including spending or tax cuts NOT included in S10 (see below) -If none enter 0 No data - blank Please use the exchange rate of the date you are coding not the current date."
    sql: ${TABLE}.fiscal_measures ;;
  }

  dimension: fiscal_measures_notes {
    type: string
    description: "Additional details about E3 policy actions"
    sql: ${TABLE}.fiscal_measures_notes ;;
  }

  dimension: income_support {
    type: string
    description: "E1 - Ordinal scale record if the government is covering the salaries or providing direct cash payments universal basic income or similar of people who lose their jobs or cannot work. (Includes payments to firms if explicitly linked to payroll/ salaries)"
    sql: ${TABLE}.income_support ;;
  }

  dimension: income_support_flag {
    type: string
    description: "Sector scope of E1 actions;  0 - formal sector workers only 1 - transfers to informal sector workers too No data - blank"
    sql: ${TABLE}.income_support_flag ;;
  }

  dimension: income_support_notes {
    type: string
    description: "Additional details about E1 policy actions"
    sql: ${TABLE}.income_support_notes ;;
  }

  dimension: international_support {
    type: number
    description: "E4 - Announced offers of COVID-19 related aid spending to other countries (in USD);  Record monetary value announced if additional to previously announced spending -if none enter 0 No data - blank Please use the exchange rate of the date you are coding not the current date."
    sql: ${TABLE}.international_support ;;
  }

  dimension: international_support_notes {
    type: string
    description: "Additional details about E4 policy actions"
    sql: ${TABLE}.international_support_notes ;;
  }

  dimension: international_travel_controls {
    type: string
    description: "C8 - Ordinal scale record of restrictions on international travel; 0 - No measures 1 - Screening 2 - Quarantine arrivals from high-risk regions 3 - Ban on high-risk regions 4 - Total border closure No data - blank"
    sql: ${TABLE}.international_travel_controls ;;
  }

  dimension: international_travel_controls_notes {
    type: string
    description: "Additional details about C8 policy actions"
    sql: ${TABLE}.international_travel_controls_notes ;;
  }

  dimension: misc_wildcard {
    type: string
    description: "M1 - Record policy announcements that do not fit anywhere else"
    sql: ${TABLE}.misc_wildcard ;;
  }

  dimension: misc_wildcard_notes {
    type: string
    description: "Additional details about M1 policy actions"
    sql: ${TABLE}.misc_wildcard_notes ;;
  }

  dimension: public_information_campaigns {
    type: string
    description: "H1 - Ordinal scale record presence of public info campaigns;  0 -No COVID-19 public information campaign 1 - public officials urging caution about COVID-19 2 - coordinated public information campaign (e.g. across traditional and social media) No data - blank"
    sql: ${TABLE}.public_information_campaigns ;;
  }

  dimension: public_information_campaigns_flag {
    type: string
    description: "Sector scope of H1 actions;  0 - formal sector workers only 1 - transfers to informal sector workers too No data - blank"
    sql: ${TABLE}.public_information_campaigns_flag ;;
  }

  dimension: public_information_campaigns_notes {
    type: string
    description: "Additional details about H1 policy actions"
    sql: ${TABLE}.public_information_campaigns_notes ;;
  }

  dimension: region_code {
    type: string
    description: "Code of the region within the country"
    sql: ${TABLE}.region_code ;;
  }

  dimension: region_name {
    type: string
    description: "Name of the region within the country"
    sql: ${TABLE}.region_name ;;
  }

  dimension: restrictions_on_gatherings {
    type: string
    description: "C4 - Ordinal scale to record the cut-off size for bans on private gatherings;  0 - No restrictions 1 - Restrictions on very large gatherings (the limit is above 1000 people) 2 - Restrictions on gatherings between 100-1000 people 3 - Restrictions on gatherings between 10-100 people 4 - Restrictions on gatherings of less than 10 people No data - blank"
    sql: ${TABLE}.restrictions_on_gatherings ;;
  }

  dimension: restrictions_on_gatherings_flag {
    type: string
    description: "Are C4 actions targeted at specific areas or general:0 - Targeted 1- General No data - blank"
    sql: ${TABLE}.restrictions_on_gatherings_flag ;;
  }

  dimension: restrictions_on_gatherings_notes {
    type: string
    description: "Additional details about C4 policy actions"
    sql: ${TABLE}.restrictions_on_gatherings_notes ;;
  }

  dimension: restrictions_on_internal_movement {
    type: string
    description: "C7 - Ordinal scale of restrictions on internal movement;  0 - No measures 1 - Recommend closing (or significantly reduce volume/route/means of transport) 2 - Require closing (or prohibit most people from using it)"
    sql: ${TABLE}.restrictions_on_internal_movement ;;
  }

  dimension: restrictions_on_internal_movement_flag {
    type: string
    description: "Are C7 actions targeted at specific areas or general:0 - Targeted 1- General No data - blank"
    sql: ${TABLE}.restrictions_on_internal_movement_flag ;;
  }

  dimension: restrictions_on_internal_movement_notes {
    type: string
    description: "Additional details about C7 policy actions"
    sql: ${TABLE}.restrictions_on_internal_movement_notes ;;
  }

  dimension: school_closing {
    type: string
    description: "C1 - Ordinal scale record closings of schools and universities; 0 - No measures 1 - recommend closing 2 - Require closing (only some levels or categories eg just high school or just public schools) 3 - Require closing all levels No data - blank"
    sql: ${TABLE}.school_closing ;;
  }

  dimension: school_closing_flag {
    type: string
    description: "Are C1 actions targeted at specific areas or general:0 - Targeted 1- General No data - blank"
    sql: ${TABLE}.school_closing_flag ;;
  }

  dimension: school_closing_notes {
    type: string
    description: "Additional details about C1 policy actions"
    sql: ${TABLE}.school_closing_notes ;;
  }

  dimension: stay_at_home_requirements {
    type: string
    description: "C6 - Ordinal scale record of orders to “shelter-in- place” and otherwise confine to home."
    sql: ${TABLE}.stay_at_home_requirements ;;
  }

  dimension: stay_at_home_requirements_flag {
    type: string
    description: "Are C6 actions targeted at specific areas or general:0 - Targeted 1- General No data - blank\"\""
    sql: ${TABLE}.stay_at_home_requirements_flag ;;
    }

    dimension: stay_at_home_requirements_notes {
    type: string
    description: "Additional details about C6 policy actions"
    sql: ${TABLE}.stay_at_home_requirements_notes ;;
  }

  dimension: stringency_index {
    type: number
    description: "Used after April 28 2020. Nine-point aggregation of the eight containment and closure indicators as well as H1 (public information campaigns). It reports a number between 0 to 100 that reflects the overall stringency of the governments response. This is a measure of how many of the these nine indicators (mostly around social isolation) a government has acted upon and to what degree."
    sql: ${TABLE}.stringency_index ;;
  }

  dimension: testing_policy {
    type: string
    description: "H2 - Ordinal scale record of who can get tested;  0 – No testing policy 1 – Only those who both (a) have symptoms AND (b) meet specific criteria (eg key workers admitted to hospital came into contact with a known case returned from overseas) 2 – testing of anyone showing COVID-19 symptoms 3 – open public testing (eg “drive through” testing available to asymptomatic people) No data Nb we are looking for policies about testing for having an infection (PCR tests) - not for policies about testing for immunity (antibody tests)."
    sql: ${TABLE}.testing_policy ;;
  }

  dimension: testing_policy_notes {
    type: string
    description: "Additional details about H2 policy actions"
    sql: ${TABLE}.testing_policy_notes ;;
  }

  dimension: vaccine_investment {
    type: number
    description: "H5 - Announced public spending on vaccine development in USD; Record monetary value in USD of new short-term spending on health. If none enter 0. No data - blank Please use the exchange rate of the date you are coding not the current date."
    sql: ${TABLE}.vaccine_investment ;;
  }

  dimension: vaccine_investment_notes {
    type: string
    description: "Additional details about H5 policy actions"
    sql: ${TABLE}.vaccine_investment_notes ;;
  }

  dimension: workplace_closing {
    type: string
    description: "C2 - Ordinal scale record closings of workplace; 0 - No measures 1 - recommend closing (or work from home) 2 - require closing (or work from home) for some sectors or categories of workers 3 - require closing (or work from home) all-but-essential workplaces (eg grocery stores doctors) No data - blank"
    sql: ${TABLE}.workplace_closing ;;
  }

  dimension: workplace_closing_flag {
    type: string
    description: "Are C2 actions targeted at specific areas or general:0 - Targeted 1- General No data - blank"
    sql: ${TABLE}.workplace_closing_flag ;;
  }

  dimension: workplace_closing_notes {
    type: string
    description: "Additional details about C2 policy actions"
    sql: ${TABLE}.workplace_closing_notes ;;
  }

  measure: count {
    type: count
    drill_fields: [country_name, region_name]
  }
}
