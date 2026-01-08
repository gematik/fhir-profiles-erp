{% assign transformation-rules = site.data['transformation-rules'] %}

Diese Seite beschreibt Anforderungen und Umsetzungsunterstützung für das Mapping vom 
- [KBV_ERP_PR_Bundle](https://simplifier.net/packages/kbv.ita.erp/1.4.0/files/3113155) 
- zum [EPAOpProvidePrescriptionERPInputParameters](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-op-provide-prescription-erp-input-parameters.html).

## Wichtige Punkte beim Mapping

Die folgenden Punkte sind relevant für das Mapping der Bundle Ressource:
- Parameters.prescriptionId wird aus der Bundle.identifier.value übernommen
- Parameters.authoredOn wird aus MedicationRequest.authoredOn übernommen
- Die Ressourcen werden entsprechend der Mappings der jeweiligen Ressource gemappt

## Generelles Mapping des Profils

Die folgende Tabelle stellt generell das Mapping der beiden Profile gegenüber:

{% include StructureMap-KBVPrErpBundleMap-intro.md %}

## Transformationsregeln

Folgende zusätzliche Anmerkungen und Regeln sind für das Mapping zu umzusetzen:

{% for transformation-rule in transformation-rules %}
{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-prescription" profiles="EPAOpProvidePrescriptionERPInputParameters" level=4 %}
{% endfor %}