{% assign transformation-rules = site.data['transformation-rules'] %}

Diese Seite beschreibt Anforderungen und Umsetzungsunterstützung für das Mapping vom 
- [KBV_FOR_PR_Practitioner](https://simplifier.net/packages/kbv.ita.for/1.2.1/files/3157104) - zum [PractitionerDirectory](https://simplifier.net/packages/de.gematik.fhir.directory/1.0.0/files/2970193).

### Wichtige Punkte beim Mapping der Practitioner Ressource

Die folgenden Punkte sind relevant für das Mapping der Practitioner Ressource:
- Die Telematik-ID wird aus dem Accesstoken der Anfrage bezogen (F_013)
- Der Name des Practitioners muss aus Bestandteilen zusammengesetzt werden (F_011)
- Es muss überprüft werden, welcher Practitioner zu mappen ist (F_016)
- Die Qualifikation des Practitioners darf nicht übertragen werden

### Generelles Mapping des Profils

Die folgende Tabelle stellt generell das Mapping der beiden Profile gegenüber:

{% include StructureMap-KBVPrForPractitionerMap-intro.md %}

### Transformationsregeln

Folgende zusätzliche Anmerkungen und Regeln sind für das Mapping zu umzusetzen:

{% for transformation-rule in transformation-rules %}
{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-prescription" profiles="PractitionerDirectory" level=4 %}
{% endfor %}