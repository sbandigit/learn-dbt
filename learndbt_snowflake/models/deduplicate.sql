{{config(materialized="table")}}
{{dedup("ORDERS","O_ORDERKEY","O_ORDERDATE")}}
