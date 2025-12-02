
**Titel:** KBVPrErpBundleToProvidePrescriptionParameters

**Beschreibung:** Aggregiertes Mapping vom KBV_PR_ERP_Bundle zu ePA Provide Prescription Parameters

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `KbvErpBundle` | `ProvideParameters.parameter` | Legt Basisparameter rxPrescription an |
| `KbvErpBundle.identifier.bundleIdentifier` | `ProvideParameters.parameter.rxParam.part.prescriptionIdPart.value` | → erstellt neues Identifier |
| `KbvErpBundle.entry [Bedingung: resource is MedicationRequest]` | *(wird bestimmt durch Kontext)* | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is MedicationRequest]` | `ProvideParameters.parameter.rxParam.part` | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is MedicationRequest].prescriptionEntry.resource` | `ProvideParameters.parameter.rxParam.part.medReqPart.resource` | Verwendet Mapping: [F3b4c5d6e7f814b92A3c42d3e4f5a6702Structuremap](./StructureMap-F3b4c5d6e7f814b92A3c42d3e4f5a6702Structuremap.html)<br>→ erstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request |
| `KbvErpBundle.entry [Bedingung: resource is Organization]` | `ProvideParameters.parameter.rxParam.part` | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is Organization].orgEntry.resource` | `ProvideParameters.parameter.rxParam.part.orgPart.resource` | Verwendet Mapping: [F0c2a1b596c5f4e9b9f221a3d4b5c6e72Structuremap](./StructureMap-F0c2a1b596c5f4e9b9f221a3d4b5c6e72Structuremap.html)<br>→ erstellt neues https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory |
| `KbvErpBundle.entry [Bedingung: resource is Practitioner]` | `ProvideParameters.parameter.rxParam.part` | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is Practitioner].pracEntry.resource` | `ProvideParameters.parameter.rxParam.part.pracPart.resource` | Verwendet Mapping: [E64f9b0a2a2a4f8f9b867b6f8f4d2d31Structuremap](./StructureMap-E64f9b0a2a2a4f8f9b867b6f8f4d2d31Structuremap.html)<br>→ erstellt neues https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory |
| `KbvErpBundle.entry [Bedingung: resource is Medication]` | `ProvideParameters.parameter.rxParam.part` | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is Medication].medEntry.resource` | `ProvideParameters.parameter.rxParam.part.medPart.resource` | Verwendet Mapping: [F2a3c4d5e6f704a8192b31c2d3e4f5601Structuremap](./StructureMap-F2a3c4d5e6f704a8192b31c2d3e4f5601Structuremap.html)<br>→ erstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication |
