{% macro dedup(table,unique_col,order_by_col)%}
      with ranked as
        (
          select 
          *,
          row_number() over(partition by {{unique_col}} order by {{order_by_col}} desc) as ronw_num
          from
          {{table}}
        )
      select 
      *
      from 
      ranked
      where ronw_num = 1
{%endmacro%}

