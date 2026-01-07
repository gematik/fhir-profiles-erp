Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide für den Medication Service definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Medikationsdaten innerhalb des Medication Service. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein _Capability Statement_ zur Beschreibung der unterstützten Funktionen sowie _Operation Definitions_, die spezielle FHIR-Operationen für den Abruf und die Verwaltung von Medikationsdaten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die FHIR-Data-Service-Funktionalitäten festgelegt.

{% capture valuesets %}
ValueSet/context-code,
ValueSet/emp-medicationrequest-status-vs,
ValueSet/epa-medication-statement-status-vs,
ValueSet/epa-medicationstatement-type-code,
ValueSet/epa-provide-dispensation-status-vs,
ValueSet/epa-medicationstatement-processing-event-code,
{% endcapture %}
{% include artifacts-table-generator.html render=valuesets %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>

{% include artifacts-table-generator.html resourceType="ValueSet" %}


### Terminologien: Code Systems

{% capture codesystems %}
CodeSystem/context-code,
CodeSystem/epa-medicationstatement-processing-event-code,
{% endcapture %}
{% include artifacts-table-generator.html render=codesystems %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>

{% include artifacts-table-generator.html resourceType="CodeSystem" %}


### Systemverhalten

#### Capability Statements

Das _Capability_ _Statement_ beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des Medication Service umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das ePA-Aktensystem für den Medication Service unterstützen muss.

{% include artifacts-table-generator.html resourceType="CapabilityStatement" %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements</figcaption></div>


#### Operation Definitions

{% include artifacts-table-generator.html resourceType="OperationDefinition" %}
<div><figcaption><strong>Tabelle:</strong> Operation Definitions</figcaption></div>


{% comment %}
#### Suchparameter

{% include artifacts-table-generator.html resourceType="SearchParameter" %}
<div><figcaption><strong>Tabelle:</strong> Suchparameter</figcaption></div>

#### Operation Outcomes

{% capture operationoutcome %}
StructureDefinition/epa-ms-operation-outcome,
CodeSystem/epa-ms-operation-outcome-details,
ValueSet/epa-ms-operation-outcome-details
{% endcapture %}
{% include artifacts-table-generator.html render=operationoutcome %}
<div><figcaption><strong>Tabelle:</strong> Operation Outcomes</figcaption></div>

{% endcomment %}

### Parameterprofile für Operationen

{% include artefacts-structuredef-table-generator.html type="Parameters"%}
<div><figcaption><strong>Tabelle:</strong> Parameterprofile</figcaption></div>


### Ressourcenprofile

{% capture profiles %}
StructureDefinition/GEM-ERP-PR-AuditEvent,
StructureDefinition/GEM-ERP-PR-Binary,
StructureDefinition/GEM-ERP-PR-Bundle-OP-Accept,
StructureDefinition/GEM-ERP-PR-Bundle,
StructureDefinition/GEM-ERP-PR-Communication-DiGA,
StructureDefinition/GEM-ERP-PR-Communication-DispReq,
StructureDefinition/GEM-ERP-PR-Communication-Reply,
StructureDefinition/GEM-ERP-PR-Communication-Representative,
StructureDefinition/GEM-ERP-PR-Communication,
StructureDefinition/GEM-ERP-PR-Composition,
StructureDefinition/GEM-ERP-PR-Device,
StructureDefinition/GEM-ERP-PR-Digest,
StructureDefinition/GEM-ERP-PR-Medication,
StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA,
StructureDefinition/GEM-ERP-PR-MedicationDispense,
StructureDefinition/GEM-ERP-PR-Task
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}
<div><figcaption><strong>Tabelle:</strong> Ressourcenprofile</figcaption></div>


### Datentypen

{% capture datatypes %}
StructureDefinition/GEM-ERP-PR-AccessCode,
StructureDefinition/GEM-ERP-PR-Secret,
StructureDefinition/GEM-ERP-PR-Signature
{% endcapture %}
{% include artifacts-table-generator.html render=datatypes %}
<div><figcaption><strong>Tabelle:</strong> Datentypen</figcaption></div>


### Erweiterungen (Extension) Definitions

{% include artefacts-structuredef-table-generator.html type="Extension"%}
<div><figcaption><strong>Tabelle:</strong> Extension Definitions</figcaption></div>

### Mapping Definitions (StructureMaps)

{% include artifacts-table-generator.html resourceType="StructureMap" %}
<div><figcaption><strong>Tabelle:</strong> StructureMap</figcaption></div>

### Nutzung von Cross-Version-Extensions

Für die Profile der Ressourcen <i>MedicationRequest</i>, <i>MedicationDispense</i> und <i>MedicationStatement</i> werden die Backport-FHIR-Extensions `.renderedDosageInstruction` und `.effectiveDosePeriod` verwendet.
Diese Elemente stammen aus FHIR R5 und wurden über den von der [FHIR-Spezifikation definierten Cross-Version-Mechanismus](https://hl7.org/fhir/versions.html#extensions) nach R4 zurückportiert. Dieser Mechanismus wird u. a. bereits vom [HL7 Java FHIR Validator](https://confluence.hl7.org/spaces/FHIR/pages/35718580/Using+the+FHIR+Validator) unterstützt; andere Validatoren müssen gegebenenfalls das entsprechende Cross-Version-Paket nachladen.

Das offizielle Cross-Version-Paket war zum Releasezeitpunkt dieses Implementation Guides noch nicht final in der FHIR-Registry verfügbar. Die Package-ID lautet:
`hl7.fhir.uv.xver-r5.r4`. Bis zur offiziellen Veröffentlichung kann der Inhalt des folgenden Snapshot-Releases verwendet werden: [https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/](https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/)

In diesem Paket sind die benötigten cross-version Extensions enthalten:
- [MedicationDispense.renderedDosageInstruction](https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/StructureDefinition-ext-R5-MedicationDispense.renderedDosageInstruction.html)

### Beispielinstanzen

{% include example-list-generator.html %}