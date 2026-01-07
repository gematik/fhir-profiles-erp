{% assign transformation-rules = site.data['transformation-rules'] %}

tbd


{% for transformation-rule in transformation-rules %}

{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-dispensation" level=3 %}

{% endfor %}