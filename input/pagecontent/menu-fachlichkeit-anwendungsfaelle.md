### Fachliche Anwendungsfälle

{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}

Die folgenden fachlichen Anwendungsfälle beschreiben – aus Sicht des verordnenden Leistungserbringers – die Schritte zur Verordnung und Bereitstellung eines E‑Rezepts.

#### Übergreifende Vorbedingungen

- Der Leistungserbringer ist gegenüber der TI authentisiert (Institutionsidentität via SMC‑B über IdP/Konnektor).
- Für die QES steht ein freigeschalteter HBA zur Verfügung.
- Der Verordnungsdatensatz wird als KBV-konformes FHIR-Bundle im Primärsystem geführt.

{% for use_case in use_cases %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% endfor %}