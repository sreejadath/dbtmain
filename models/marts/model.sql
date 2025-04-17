 select
            case 
                when table_type = 'VIEW'
                    then table_type
                else 
                    'TABLE'
            end as drop_type, 
            'DROP ' || drop_type || ' {{ database | upper }}.' || table_schema || '.' || table_name || ';'
        from {{database}}.information_schema.tables
         where table_schema = upper('{{schema}}')
        and last_altered <= current_date - {{ days }} 