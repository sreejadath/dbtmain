{#
{% set my_cool_string = 'Wow! cool!' %}
{% set my_cool_number = 100 %}
{{ my_cool_string }}This is Jinja .. i want to write this {{my_cool_number}} times



{% set my_animals = ['cat', 'dog'] %}
{{ my_animals[0] }}
{{ my_animals[1] }}

{% for animal in my_animals %}

    My fav animal is the {{ animal }}

{% endfor %}



{% set temp = 45 %}
{% if temp < 65 %}
Time for a cappichino
{% else %}
Time for cold bev
{% endif %}



{%- set foods = [ 'carrot', 'apple', 'mango'] -%}
{%- for food in foods -%}
{%- if food == 'hotdog' -%}
    {%- set food_type = 'Snack' -%}
{%- else %}
    {% set food_type = 'Veg' -%}
{%- endif -%}
The humble {{ food }} is my {{ food_type }}
{% endfor %}

#}

{%- set websites_dict = {
    'word' : 'data',
    'speech_part': 'noun',
    'def': 'ifyou know you know'
}
    
-%}
{{ websites_dict['word'] }}