
**Titel:** EPAMedication-Map

**Beschreibung:** Router StructureMap for KBV_PR_ERP_Medication_Compounding|1.3.2, KBV_PR_ERP_Medication_FreeText|1.3.2, KBV_PR_ERP_Medication_Ingredient|1.3.2, KBV_PR_ERP_Medication_PZN|1.3.2 -> EPAMedication|1.0.6-2

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `KBVPRERPMedicationCompounding [Bedingung: meta.profile.exists(p | p = 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding')]` | *(wird bestimmt durch Kontext)* | Routes resources constrained by KBV_PR_ERP_Medication_Compounding |
| `KBVPRERPMedicationCompounding [Bedingung: meta.profile.exists(p | p = 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding')].KBVPRERPMedicationCompoundingKbvPrErpMedicationCompoundingRouted` | *(wird bestimmt durch Kontext)* | Verwendet Mapping: [KBV-PR-ERP-Medication-Compounding-Map](./StructureMap-KBV-PR-ERP-Medication-Compounding-Map.html) |
| `KBVPRERPMedicationCompounding [Bedingung: meta.profile.exists(p | p = 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText')]` | *(wird bestimmt durch Kontext)* | Routes resources constrained by KBV_PR_ERP_Medication_FreeText |
| `KBVPRERPMedicationCompounding [Bedingung: meta.profile.exists(p | p = 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText')].KBVPRERPMedicationCompoundingKbvPrErpMedicationFreetextRouted` | *(wird bestimmt durch Kontext)* | Verwendet Mapping: [KBV-PR-ERP-Medication-FreeText-Map](./StructureMap-KBV-PR-ERP-Medication-FreeText-Map.html) |
| `KBVPRERPMedicationCompounding [Bedingung: meta.profile.exists(p | p = 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient')]` | *(wird bestimmt durch Kontext)* | Routes resources constrained by KBV_PR_ERP_Medication_Ingredient |
| `KBVPRERPMedicationCompounding [Bedingung: meta.profile.exists(p | p = 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient')].KBVPRERPMedicationCompoundingKbvPrErpMedicationIngredientRouted` | *(wird bestimmt durch Kontext)* | Verwendet Mapping: [KBV-PR-ERP-Medication-Ingredient-Map](./StructureMap-KBV-PR-ERP-Medication-Ingredient-Map.html) |
| `KBVPRERPMedicationCompounding [Bedingung: meta.profile.exists(p | p = 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN')]` | *(wird bestimmt durch Kontext)* | Routes resources constrained by KBV_PR_ERP_Medication_PZN |
| `KBVPRERPMedicationCompounding [Bedingung: meta.profile.exists(p | p = 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN')].KBVPRERPMedicationCompoundingKbvPrErpMedicationPznRouted` | *(wird bestimmt durch Kontext)* | Verwendet Mapping: [KBV-PR-ERP-Medication-PZN-Map](./StructureMap-KBV-PR-ERP-Medication-PZN-Map.html) |
