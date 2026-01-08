{% assign transformation-rules = site.data['transformation-rules'] %}

Diese Seite beschreibt Anforderungen und Umsetzungsunterstützung für das Mapping von
- KBV MedicationRequest (aus dem [KBV_PR_ERP_Bundle](https://simplifier.net/erezept/kbv_pr_erp_bundle))
- zur [EPA MedicationRequest](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication-request.html).

## Wichtige Punkte beim Mapping der MedicationRequest Ressource

Die folgenden Punkte sind relevant für das Mapping der MedicationRequest Ressource:
- `MedicationRequest.subject.identifier` wird aus der Patienten-KVNR befüllt (F_010)

## Generelles Mapping des Profils

Die folgende Tabelle stellt generell das Mapping der beiden Profile gegenüber:

{% include StructureMap-KBVPrErpPrescriptionMap-intro.md %}

## Transformationsregeln

Folgende zusätzliche Anmerkungen und Regeln sind für das Mapping zu umzusetzen:

{% for transformation-rule in transformation-rules %}
{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-prescription" profiles="EPA MedicationRequest" level=4 %}
{% endfor %}
