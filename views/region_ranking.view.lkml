include: "/views/covid_it_region.view.lkml"
view: region_ranking {
  extends: [covid_it_region]

  derived_table: {
    sql: SELECT region_name,
                SUM (deaths) as count
                RANK() over (ORDER BY count DESC) as Rank
         FROM NewDataset.covid_it_region
         GROUP BY 1
        ;;
  }

   dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }

   dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

dimension: rawrank {
  type: number
  sql: ${TABLE}.Rank ;;
}

parameter: MaxRegion_No{
  type: number
}

dimension: Rank {
  type: string
  sql: CASE WHEN ${rawrank}<={% parameter MaxRegion_No %}
    then RIGHT ('00' + CAST(${rawrank} AS VARCHAR),2)
    ELSE 'Other'
    end;;
}

dimension: rank_with_region{
  type:  string
  sql:  CASE WHEN ${Rank}='Other' then 'Other' else ${Rank}|| '-' || ${region_name} end ;;
}
  }
