### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.amount` | `EPAMedication.amount` | Kopiert | Automatische Kopie<br>übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.batch` | `EPAMedication.batch` | Kopiert | Kopiert nach 'Medication.batch'<br>übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.code` | `EPAMedication.code` | Kopiert | Automatische Kopie<br>übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding` | `Medication.extension:type` | Manuell | Fester Wert: 781405001, Medicinal product package (product) |
| `KBVPRERPMedicationCompounding.form` | `EPAMedication.form` | Kopiert | Automatische Kopie<br>übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient` | `EPAMedication.ingredient` | Erstellt | Automatische Kopie<br>erstellt neues BackboneElement |

### Extensions

#### Extension: KBV_EX_ERP_Medication_Category
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension` | Erstellt | Kopiert von 'Medication.extension:Arzneimittelkategorie'<br>erstellt neues Extension |
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.url` | Fester Wert | Kopiert von 'Medication.extension:Arzneimittelkategorie'<br>setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` |
| `KBVPRERPMedicationCompounding.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value` | Erstellt | Kopiert von 'Medication.extension:Arzneimittelkategorie.value[x]'<br>erstellt neues Coding |
| `KBVPRERPMedicationCompounding.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.system` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs` |
| `KBVPRERPMedicationCompounding.extension.value.code`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.code` | Kopiert | Copied drugCategory code<br>übernimmt Wert aus Quellvariable |

#### Extension: KBV_EX_ERP_Medication_Vaccine
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension` | Erstellt | Kopiert von 'Medication.extension:Impfstoff'<br>erstellt neues Extension |
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.url` | Fester Wert | Kopiert von 'Medication.extension:Impfstoff'<br>setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` |
| `KBVPRERPMedicationCompounding.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.value` | Kopiert | Kopiert von 'Medication.extension:Impfstoff.value[x]'<br>übernimmt Wert aus Quellvariable |

#### Extension: KBV_EX_ERP_Medication_CompoundingInstruction
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction']` | `EPAMedication.extension` | Erstellt | Kopiert von 'Medication.extension:Herstellungsanweisung'<br>erstellt neues Extension |
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction']` | `EPAMedication.extension.url` | Fester Wert | Kopiert von 'Medication.extension:Herstellungsanweisung'<br>setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension` |
| `KBVPRERPMedicationCompounding.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction']` | `EPAMedication.extension.value` | Kopiert | Kopiert von 'Medication.extension:Herstellungsanweisung.value[x]'<br>übernimmt Wert aus Quellvariable |

#### Extension: normgroesse
Bedingung: url = `http://fhir.de/StructureDefinition/normgroesse`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension` | Erstellt | Kopiert von 'Medication.extension:Normgroesse'<br>erstellt neues Extension |
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension.url` | Fester Wert | Kopiert von 'Medication.extension:Normgroesse'<br>setzt festen Wert: `http://fhir.de/StructureDefinition/normgroesse` |

#### Extension: KBV_EX_ERP_Medication_Packaging
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging']` | `EPAMedication.extension` | Erstellt | Kopiert von 'Medication.extension:Verpackung'<br>erstellt neues Extension |
| `KBVPRERPMedicationCompounding.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging']` | `EPAMedication.extension.url` | Fester Wert | Kopiert von 'Medication.extension:Verpackung'<br>setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension` |
| `KBVPRERPMedicationCompounding.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging']` | `EPAMedication.extension.value` | Kopiert | Kopiert von 'Medication.extension:Verpackung.value[x]'<br>übernimmt Wert aus Quellvariable |

