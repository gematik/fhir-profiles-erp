### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationIngredient.amount` | `EPAMedication.amount` | Kopiert | Automatische Kopie<br>übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.batch` | `EPAMedication.batch` | Kopiert | Kopiert nach 'Medication.batch'<br>übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.code` | `EPAMedication.code` | Kopiert | Automatische Kopie<br>übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient` | `Medication.extension:type` | Manuell | Fester Wert: 781405001, Medicinal product package (product) |
| `KBVPRERPMedicationIngredient.form` | `EPAMedication.form` | Kopiert | Automatische Kopie<br>übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient` | `EPAMedication.ingredient` | Erstellt | Automatische Kopie<br>erstellt neues BackboneElement |

### Extensions

#### Extension: KBV_EX_ERP_Medication_Category
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationIngredient.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension` | Erstellt | Kopiert von 'Medication.extension:Arzneimittelkategorie'<br>erstellt neues Extension |
| `KBVPRERPMedicationIngredient.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.url` | Fester Wert | Kopiert von 'Medication.extension:Arzneimittelkategorie'<br>setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` |
| `KBVPRERPMedicationIngredient.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value` | Erstellt | Kopiert von 'Medication.extension:Arzneimittelkategorie.value[x]'<br>erstellt neues Coding |
| `KBVPRERPMedicationIngredient.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.system` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs` |
| `KBVPRERPMedicationIngredient.extension.value.code`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.code` | Kopiert | Copied drugCategory code<br>übernimmt Wert aus Quellvariable |

#### Extension: KBV_EX_ERP_Medication_Vaccine
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationIngredient.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension` | Erstellt | Kopiert von 'Medication.extension:Impfstoff'<br>erstellt neues Extension |
| `KBVPRERPMedicationIngredient.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.url` | Fester Wert | Kopiert von 'Medication.extension:Impfstoff'<br>setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` |
| `KBVPRERPMedicationIngredient.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.value` | Kopiert | Kopiert von 'Medication.extension:Impfstoff.value[x]'<br>übernimmt Wert aus Quellvariable |

#### Extension: normgroesse
Bedingung: url = `http://fhir.de/StructureDefinition/normgroesse`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationIngredient.extension`<br>`[Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension` | Erstellt | Kopiert von 'Medication.extension:Normgroesse'<br>erstellt neues Extension |
| `KBVPRERPMedicationIngredient.extension`<br>`[Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension.url` | Fester Wert | Kopiert von 'Medication.extension:Normgroesse'<br>setzt festen Wert: `http://fhir.de/StructureDefinition/normgroesse` |
| `KBVPRERPMedicationIngredient.extension.value`<br>`[Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension.value` | Kopiert | Kopiert von 'Medication.extension:Normgroesse.value[x]'<br>übernimmt Wert aus Quellvariable |

