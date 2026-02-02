{% assign transformation-rules = site.data['transformation-rules'] %}

Diese Seite beschreibt Anforderungen und Umsetzungsunterstützung für das Mapping von
- KBV Medication (aus dem [KBV_PR_ERP_Bundle](https://simplifier.net/erezept/kbv_pr_erp_bundle))
- zur [EPA Medication](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication.html).

## Wichtige Punkte beim Mapping der Medication Ressource

Die folgenden Punkte sind relevant für das Mapping der Medication Ressource:
- Bei Rezepturen mit PZN-codierten Wirkstoffen sind zusätzliche `contained` Medications anzulegen und in `Medication.ingredient.itemReference` zu referenzieren (F_017)
- `Medication.extension:type` soll nach Möglichkeit erzeugt und korrekt belegt werden (F_020)

## Generelles Mapping des Profils

Die folgende Tabelle stellt generell das Mapping der beiden Profile gegenüber:

{% include StructureMap-EPAMedicationMap-intro.md %}

Die folgenden Unterseiten beschreiben die Mappings der verschiedenen KBV-Medication-Profile zu EPA Medication im Detail:

- [Mapping der PZN Medication](./mapping-prescription-medication-pzn.html)
- [Mapping der Wirkstoff Medication](./mapping-prescription-medication-ingredient.html)
- [Mapping der Rezeptur Medication](./mapping-prescription-medication-compounding.html)
- [Mapping der Freitext Medication](./mapping-prescription-medication-freetext.html)

## Transformationsregeln

Folgende zusätzliche Anmerkungen und Regeln sind für das Mapping zu umzusetzen:

{% for transformation-rule in transformation-rules %}
{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-prescription" profiles="EPA Medication" level=3 %}
{% endfor %}
