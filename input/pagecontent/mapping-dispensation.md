{% assign transformation-rules = site.data['transformation-rules'] %}

Nach Abschluss eines E-Rezept Workflows durch das Aufrufen der $close-Operation am E-Rezept-Fachdienst wird nachgelagert die Übermittlung der Dispensierinformationen an den ePA Medication Service durchgeführt.

Die Dispensierinformationen werden als [GEM ERP PR CloseOperation Input](./StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Input.html) übertragen und enthalten [GEM ERP PR MedicationDispense](./StructureDefinition-GEM-ERP-PR-MedicationDispense.html) und [GEM ERP PR Medication](./StructureDefinition-GEM-ERP-PR-Medication.html) Ressourcen. Diese sind von den Profilen der ePA abgeleitet und sind damit kompatibel.

Für die erfolgreiche Übertragung an den ePA Medication Service müssen allerdings Daten angeriechert oder angepasst werden.

Hierbei werden verschiedene Quellen benötigt, um die Daten vollständig zu überführen:
- Die Dispensierinformationen aus GEM ERP PR CloseOperation Input
- Der ACCESS_TOKEN der Anfrage zur $close-Operation

## Übersicht des Mappingvorgehens

Für dieses Mapping muss für die Parameters Struktur keine Transformation der Struktur vorgenommen werden, da die übergebenen Ressourcen bereits den Profilen der ePA entsprechen. Allerdings sind einige Anpassungen und Anreicherungen der Daten notwendig.

| Parameter in Zielprofil | Quelle | Kommentar |
|---|---|---|
|prescriptionId|Task.identifier|Wird aus dem Task auf den sich die Dispensierinformationen beziehen, entnommen|
|authoredOn|MedicationRequest.authoredOn|Wird aus dem MedicationRequest der urspünglichen Verordnung bezogen|
|medicationDispense|MedicationDispense|Wird aus den close-Operation-Parameters extrahiert und übertragen|
|medication|Medication|Wird aus den close-Operation-Parameters extrahiert und übertragen|
|organization|-|Organization wird neu erzeugt und nach Transformationsregeln befüllt|

## Transformationsregeln für Dispensierinformationen

Einige Daten müssen zusätzlich durch Transformationsregeln angepasst oder ergänzt werden. Die folgenden Transformationsregeln werden für das Mapping von *Dispensierinformationen* verwendet:
{% for transformation-rule in transformation-rules %}

{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-dispensation" level=4 %}

{% endfor %}