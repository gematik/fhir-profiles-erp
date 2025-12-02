
**Titel:** KBVPrErpBundleToProvidePrescriptionParameters

**Beschreibung:** Aggregiertes Mapping vom KBV_PR_ERP_Bundle zu ePA Provide Prescription Parameters

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `KbvErpBundle` | `ProvideParameters.parameter` | Legt Basisparameter rxPrescription an |
| `KbvErpBundle.identifier.bundleIdentifier` | `ProvideParameters.parameter.rxParam.part.prescriptionIdPart.value` | → erstellt neues Identifier |
| `KbvErpBundle.entry [Bedingung: resource is MedicationRequest]` | *(wird bestimmt durch Kontext)* | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is MedicationRequest]` | `ProvideParameters.parameter.rxParam.part` | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is MedicationRequest].prescriptionEntry.resource` | `ProvideParameters.parameter.rxParam.part.medReqPart.resource` | Verwendet Mapping: [KBV-PR-ERP-Prescription-Map](./StructureMap-KBV-PR-ERP-Prescription-Map.html)<br>→ erstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request |
| `KbvErpBundle.entry [Bedingung: resource is Organization]` | `ProvideParameters.parameter.rxParam.part` | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is Organization].orgEntry.resource` | `ProvideParameters.parameter.rxParam.part.orgPart.resource` | Verwendet Mapping: [KBV-PR-FOR-Organization-Map](./StructureMap-KBV-PR-FOR-Organization-Map.html)<br>→ erstellt neues https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory |
| `KbvErpBundle.entry [Bedingung: resource is Practitioner]` | `ProvideParameters.parameter.rxParam.part` | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is Practitioner].pracEntry.resource` | `ProvideParameters.parameter.rxParam.part.pracPart.resource` | Verwendet Mapping: [KBV-PR-FOR-Practitioner-Map](./StructureMap-KBV-PR-FOR-Practitioner-Map.html)<br>→ erstellt neues https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory |
| `KbvErpBundle.entry [Bedingung: resource is Medication]` | `ProvideParameters.parameter.rxParam.part` | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is Medication].medEntry.resource` | `ProvideParameters.parameter.rxParam.part.medPart.resource` | Verwendet Mapping: [EPAMedication-Map](./StructureMap-EPAMedication-Map.html)<br>→ erstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication |
