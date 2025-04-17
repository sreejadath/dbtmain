{%- macro grant_select1(schema=target.schema,role=target.role) -%}
    {%- set sql -%}
        grant usage on schema {{ schema }} to role {{ role }} ;
        grant select on all table in {{ schema }} to role {{ role }} ;
        grant select on all views in {{ schema }} to role {{ role }} ;
    {%- endset -%}

    {{ log('Granting view privilage to role ' ~ target.role ~ ' on schema  ' ~ target.schema, info = True ) }}
    {% do run_query(sql) %}
    {{ log('Privileges granted', info=True) }}

{%- endmacro -%}