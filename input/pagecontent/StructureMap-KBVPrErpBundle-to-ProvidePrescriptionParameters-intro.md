
**Titel:** KBVPrErpBundleToProvidePrescriptionParameters

**Beschreibung:** Aggregiertes Mapping vom KBV_PR_ERP_Bundle zu ePA Provide Prescription Parameters

*Regeln:* 11 · Neue Ressourcen: 5 · Delegiert: 4 · Bedingt: 5

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KbvErpBundle` | `ProvideParameters.parameter` | ℹ️ Dokumentiert | Legt Basisparameter rxPrescription an |
| `KbvErpBundle.identifier.bundleIdentifier` | `ProvideParameters.parameter.rxParam.part.prescriptionIdPart.value` | 🆕 Erstellt | → erstellt neues Identifier |
| `KbvErpBundle.entry [Bedingung: resource is MedicationRequest]` | — | ⚙️ Bedingt | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is MedicationRequest]` | `ProvideParameters.parameter.rxParam.part` | ⚙️ Bedingt | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is MedicationRequest].prescriptionEntry.resource` | `ProvideParameters.parameter.rxParam.part.medReqPart.resource` | 🆕 Erstellt · 📎 Delegiert | Verwendet Mapping: [KBV-PR-ERP-Prescription-Map](./StructureMap-KBV-PR-ERP-Prescription-Map.html)<br>→ erstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request |
| `KbvErpBundle.entry [Bedingung: resource is Organization]` | `ProvideParameters.parameter.rxParam.part` | ⚙️ Bedingt | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is Organization].orgEntry.resource` | `ProvideParameters.parameter.rxParam.part.orgPart.resource` | 🆕 Erstellt · 📎 Delegiert | Verwendet Mapping: [KBV-PR-FOR-Organization-Map](./StructureMap-KBV-PR-FOR-Organization-Map.html)<br>→ erstellt neues https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory |
| `KbvErpBundle.entry [Bedingung: resource is Practitioner]` | `ProvideParameters.parameter.rxParam.part` | ⚙️ Bedingt | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is Practitioner].pracEntry.resource` | `ProvideParameters.parameter.rxParam.part.pracPart.resource` | 🆕 Erstellt · 📎 Delegiert | Verwendet Mapping: [KBV-PR-FOR-Practitioner-Map](./StructureMap-KBV-PR-FOR-Practitioner-Map.html)<br>→ erstellt neues https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory |
| `KbvErpBundle.entry [Bedingung: resource is Medication]` | `ProvideParameters.parameter.rxParam.part` | ⚙️ Bedingt | *(direkte Kopie)* |
| `KbvErpBundle.entry [Bedingung: resource is Medication].medEntry.resource` | `ProvideParameters.parameter.rxParam.part.medPart.resource` | 🆕 Erstellt · 📎 Delegiert | Verwendet Mapping: [EPAMedication-Map](./StructureMap-EPAMedication-Map.html)<br>→ erstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication |
