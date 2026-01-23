### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding` | `Medication.extension:type` | Manuell | Fester Wert: 781405001, Medicinal product package (product) |

### Extensions

#### Extension: KBV_EX_ERP_Medication_Category
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` |
| `KBVPRERPMedicationCompounding.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.system` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs` |

#### Extension: KBV_EX_ERP_Medication_Vaccine
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` |

#### Extension: KBV_EX_ERP_Medication_CompoundingInstruction
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension` |

#### Extension: normgroesse
Bedingung: url = `http://fhir.de/StructureDefinition/normgroesse`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert: `http://fhir.de/StructureDefinition/normgroesse` |

#### Extension: KBV_EX_ERP_Medication_Packaging
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension` |

