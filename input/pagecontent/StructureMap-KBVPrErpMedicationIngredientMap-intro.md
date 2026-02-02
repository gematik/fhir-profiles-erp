### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationIngredient` | `EPAMedication.extension` | Nicht Übertragen | Feld wird nicht gemappt \| Quelle: Medication.extension:Kategorie |
| `KBVPRERPMedicationIngredient` | `EPAMedication.extension` | Manuell | Fester Wert: 781405001, Medicinal product package (product) \| Quelle: Medication.extension:type |

### Extensions

#### Extension: KBV_EX_ERP_Medication_Category
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationIngredient.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` |
| `KBVPRERPMedicationIngredient.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.system` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs` |

#### Extension: KBV_EX_ERP_Medication_Vaccine
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationIngredient.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` |

#### Extension: normgroesse
Bedingung: url = `http://fhir.de/StructureDefinition/normgroesse`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationIngredient.extension`<br>`[Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert: `http://fhir.de/StructureDefinition/normgroesse` |

