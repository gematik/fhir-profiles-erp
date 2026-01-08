{% assign transformation-rules = site.data['transformation-rules'] %}

Diese Seite beschreibt Anforderungen und Umsetzungsunterstützung für das Mapping von 
- [KBV_FOR_PR_Organization](https://simplifier.net/packages/kbv.ita.for/1.2.1/files/3157102) 
- zum [OrganizationDirectory](https://simplifier.net/packages/de.gematik.fhir.directory/1.0.0/files/2970167).

## Wichtige Punkte beim Mapping der Organization Ressource

Die folgenden Punkte sind relevant für das Mapping der Organization Ressource:
- Telematik-ID, Name und professionOID der Organisation müssen aus dem Accesstoken der Anfrage bezogen werden (F_006b)
- Extensions aus der Adresse werden übernommen (F_007)

## Generelles Mapping des Profils

Die folgende Tabelle stellt generell das Mapping der beiden Profile gegenüber:

{% include StructureMap-KBVPrForOrganizationMap-intro.md %}

## Transformationsregeln

Folgende zusätzliche Anmerkungen und Regeln sind für das Mapping zu umzusetzen:

{% for transformation-rule in transformation-rules %}
{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-prescription" profiles="OrganizationDirectory" level=4 %}
{% endfor %}