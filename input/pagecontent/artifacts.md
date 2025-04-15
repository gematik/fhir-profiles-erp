Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementierungsleitfadens für den E-Rezept Workflow definiert werden. Sie bilden die Grundlage für den Transport von von E-Rezepten innerhalb des E-Rezept Workflow. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein _Capability Statement_ zur Beschreibung der unterstützten Funktionen sowie _Operation Definitions_, die spezielle FHIR-Operationen für die Verwaltung des Status eines E-Rezeptes festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die FHIR-Data-Service-Funktionalitäten festgelegt.


{% capture valuesets %}
ValueSet/epa-provide-dispensation-status-vs
{% endcapture %}
{% include artifacts-table-generator.html render=valuesets %}

{% comment %}

### Terminologien: Code Systems

{% include artifacts-table-generator.html resourceType="CodeSystem" %}
{% endcomment %}


### Systemverhalten

#### Capability Statements

Das _CapabilityStatement_ beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des Medication Service umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das ePA-Aktensystem für den Medication Service unterstützen muss.

{% include artifacts-table-generator.html resourceType="CapabilityStatement" %}

#### Operation Definitions

{% include artifacts-table-generator.html resourceType="OperationDefinition" %}

{% comment %}
#### Suchparameter

{% include artifacts-table-generator.html resourceType="SearchParameter" %}
{% endcomment %}

#### Operation Outcome

{% capture operationoutcome %}
StructureDefinition/epa-ms-operation-outcome,
CodeSystem/epa-ms-operation-outcome-details,
ValueSet/epa-ms-operation-outcome-details
{% endcapture %}
{% include artifacts-table-generator.html render=operationoutcome %}

### Parameterprofile für Operationen

{% include artefacts-structuredef-table-generator.html type="Parameters"%}

### Ressourcenprofile

{% capture profiles %}
StructureDefinition/epa-medication,
StructureDefinition/epa-medication-pzn-ingredient,
StructureDefinition/epa-medication-pharmaceutical-product,
StructureDefinition/epa-medication-dispense,
StructureDefinition/epa-medication-request
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}

### Datentypen

{% capture datatypes %}
StructureDefinition/epa-medication-unique-identifier,
StructureDefinition/rx-originator-process-identifier,
StructureDefinition/rx-prescription-process-identifier
{% endcapture %}
{% include artifacts-table-generator.html render=datatypes %}


### Erweiterungen (Extension) Definitions

{% include artefacts-structuredef-table-generator.html type="Extension"%}

### Beispielinstanzen

{% include example-list-generator.html %}