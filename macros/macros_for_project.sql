{% macro concat(col1,col2) %}
    {{col1}} || ' ' || {{col2}}
{% endmacro %} 

{% macro gender(gender) %}
    iff({{ gender }} = 'M', 'Male', 'Female')
{% endmacro %}

{% macro get_date_key(date_column) %}
(
    SELECT ANY_VALUE(date_key)
    FROM {{ source('raw','dates') }}
    WHERE date_value = {{ date_column }}
)
{% endmacro %}