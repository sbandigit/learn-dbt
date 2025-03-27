{% macro dedupe_lineitem(table,unique_col,order_by_col)%}
    with ranked as (
        select
         *,
         row_number() over(
            partition by {{unique_col}}
            order by {{order_by_col}}
         ) as rownum
        from
         {{table}}
    )
    select
     *
    from
     ranked 
    where
     rownum = 1
{%endmacro%}