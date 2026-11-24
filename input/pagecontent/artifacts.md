Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

### Ressourcenprofile

#### Workflow-Ressourcen

{% capture profiles %}
StructureDefinition/GEM-ERP-PR-Task,
StructureDefinition/GEM-ERP-PR-Bundle,
StructureDefinition/GEM-ERP-PR-Bundle-OP-Accept,
StructureDefinition/GEM-ERP-PR-Binary,
StructureDefinition/GEM-ERP-PR-Digest,
StructureDefinition/GEM-ERP-PR-Composition,
StructureDefinition/GEM-ERP-PR-Device,
StructureDefinition/GEM-ERP-PR-AuditEvent
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}
<div><figcaption><strong>Tabelle:</strong> Workflow-Ressourcenprofile</figcaption></div>

#### Medikation

{% capture medication %}
StructureDefinition/GEM-ERP-PR-Medication,
StructureDefinition/GEM-ERP-PR-MedicationDispense,
StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA
{% endcapture %}
{% include artifacts-table-generator.html render=medication %}
<div><figcaption><strong>Tabelle:</strong> Medikation-Ressourcenprofile</figcaption></div>

#### Kommunikation

{% capture communication %}
StructureDefinition/GEM-ERP-PR-Communication,
StructureDefinition/GEM-ERP-PR-Communication-DispReq,
StructureDefinition/GEM-ERP-PR-Communication-Reply,
StructureDefinition/GEM-ERP-PR-Communication-Representative,
StructureDefinition/GEM-ERP-PR-Communication-DiGA
{% endcapture %}
{% include artifacts-table-generator.html render=communication %}
<div><figcaption><strong>Tabelle:</strong> Kommunikation-Ressourcenprofile</figcaption></div>

#### Parameters (Operationen)

{% capture parameters %}
StructureDefinition/GEM-ERP-PR-PAR-Create-Operation-Output,
StructureDefinition/GEM-ERP-PR-PAR-Activate-Operation-Output,
StructureDefinition/GEM-ERP-PR-PAR-Accept-Operation-Output,
StructureDefinition/GEM-ERP-PR-PAR-Dispense-Operation-Input,
StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Input,
StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Output
{% endcapture %}
{% include artifacts-table-generator.html render=parameters %}
<div><figcaption><strong>Tabelle:</strong> Parameters-Ressourcenprofile</figcaption></div>

### Datentypen

{% capture datatypes %}
StructureDefinition/GEM-ERP-PR-Signature
{% endcapture %}
{% include artifacts-table-generator.html render=datatypes %}
<div><figcaption><strong>Tabelle:</strong> Datentypen</figcaption></div>

### Extensions

{% capture extensions %}
StructureDefinition/GEM-ERP-EX-AcceptDate,
StructureDefinition/GEM-ERP-EX-AvailabilityState,
StructureDefinition/GEM-ERP-EX-Beneficiary,
StructureDefinition/GEM-ERP-EX-DeepLink,
StructureDefinition/GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PATIENT-AUTHORIZATION,
StructureDefinition/GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES,
StructureDefinition/GEM-ERP-EX-ExpiryDate,
StructureDefinition/GEM-ERP-EX-InsuranceProvider,
StructureDefinition/GEM-ERP-EX-LastMedicationDispense,
StructureDefinition/GEM-ERP-EX-PackageQuantity,
StructureDefinition/GEM-ERP-EX-PrescriptionType,
StructureDefinition/GEM-ERP-EX-RedeemCode,
StructureDefinition/GEM-ERP-EX-SupplyOptionsType
{% endcapture %}
{% include artifacts-table-generator.html render=extensions %}
<div><figcaption><strong>Tabelle:</strong> Extensions</figcaption></div>

### Logische Modelle

{% capture logical %}
StructureDefinition/GEM-ERP-LOG-MedicationDispense,
StructureDefinition/GEM-ERP-LOG-MedicationDispense-DiGA
{% endcapture %}
{% include artifacts-table-generator.html render=logical %}
<div><figcaption><strong>Tabelle:</strong> Logische Modelle</figcaption></div>

### Operation Definitions

{% capture ops %}
OperationDefinition/CreateOperation,
OperationDefinition/ActivateOperation,
OperationDefinition/AcceptOperation,
OperationDefinition/RejectOperation,
OperationDefinition/AbortOperation,
OperationDefinition/DispenseOperation,
OperationDefinition/CloseOperation
{% endcapture %}
{% include artifacts-table-generator.html render=ops %}
<div><figcaption><strong>Tabelle:</strong> Operation Definitions</figcaption></div>

### Code Systems

{% capture cs %}
CodeSystem/GEM-ERP-CS-AvailabilityStatus,
CodeSystem/GEM-ERP-CS-DocumentType,
CodeSystem/GEM-ERP-CS-FlowType,
CodeSystem/GEM-ERP-CS-OrganizationType
{% endcapture %}
{% include artifacts-table-generator.html render=cs %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>

### Value Sets

{% capture vs %}
ValueSet/GEM-ERP-VS-AvailabilityStatus,
ValueSet/GEM-ERP-VS-DocumentType,
ValueSet/GEM-ERP-VS-FlowType,
ValueSet/GEM-ERP-VS-OrganizationType
{% endcapture %}
{% include artifacts-table-generator.html render=vs %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>

### Beispielinstanzen

{% include example-list-generator.html %}
