{% assign transformation-rules = site.data['transformation-rules'] %}

Diese Seite beschreibt Anforderungen und Umsetzungsunterstützung für das Mapping von
- KBV Medication (Wirkstoff) (aus dem [KBV_PR_ERP_Bundle](https://simplifier.net/erezept/kbv_pr_erp_bundle))
- zur [EPA Medication](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication.html).

## Wichtige Punkte beim Mapping der Wirkstoff Medication Ressource

Die folgenden Punkte sind relevant für das Mapping der Wirkstoff Medication Ressource:
- `Medication.extension:type` soll nach Möglichkeit erzeugt und korrekt belegt werden (F_020)

## Generelles Mapping des Profils

Die folgende Tabelle stellt generell das Mapping der beiden Profile gegenüber:

{% include StructureMap-KBVPrErpMedicationIngredientMap-intro.md %}

Zur Übersicht der Medication-Mappings siehe:
- [Mapping der Medication Ressource](./mapping-prescription-medication.md)

## Transformationsregeln

Folgende zusätzliche Anmerkungen und Regeln sind für das Mapping zu umzusetzen:

{% for transformation-rule in transformation-rules %}
{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-prescription" profiles="EPA Medication" level=3 %}
{% endfor %}
