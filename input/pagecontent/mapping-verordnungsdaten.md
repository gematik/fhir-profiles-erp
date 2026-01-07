{% assign transformation-rules = site.data['transformation-rules'] %}

Diese Seite beschreibt wie das [KBV_Bundle]() zu den [Provide_Prescription_Parameters]() gemappt wird.

Ziel ist es, die für die Übertragung an den ePA Medication Service notwendigen Daten aus dem KBV_Bundle zu extrahieren und in die Provide_Prescription_Parameters Struktur zu überführen.


{% for transformation-rule in transformation-rules %}

{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-prescription" level=3 %}

{% endfor %}