{% for i in range(10) %}

    select {{ i }} as number {% if not loop.end %} union all {% endif %}

{% endfor %}