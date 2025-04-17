{% macro clean_stale_models1(database=target.database, schema= target.schema, days=7, dry_run = True) %}
    {% set drop_querys %}
        select
            case 
                when table_type = 'VIEW'
                    then table_type
                else 
                    'TABLE'
            end as drop_type, 
            'DROP ' || drop_type || ' {{ database | upper }}.' || table_schema || '.' || table_name || ';'
        from {{database}}.information_schema.tables
        where  last_altered <= current_date - {{ days }} 
    {% endset %}

    {{ log('preparing Queries', info=True) }}
    {% set querys = run_query(drop_querys).columns[1].values() %}

    {{ log('starting loop for deleting objects', info=True) }}
    {% for drop_query in querys %}
        {% if dry_run==True %}
            {{ log(drop_query, info=True) }}
        {% endif %}
    {% endfor %}

{% endmacro %}