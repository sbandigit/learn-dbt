{{config(materialized='table')}}
{{dedupe_lineitem('LINEITEM','L_LINENUMBER','L_SHIPDATE')}}