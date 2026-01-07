### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationPZN.amount` | `EPAMedication.amount` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationPZN.batch` | `EPAMedication.batch` | ✅ Kopiert | Kopiert nach 'Medication.batch'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationPZN.code` | `EPAMedication.code` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationPZN.form` | `EPAMedication.form` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationPZN.ingredient` | `EPAMedication.ingredient` | 🆕 Erstellt | Automatische Kopie<br>→ erstellt neues BackboneElement |

### Extensions

#### Extension: KBV_EX_ERP_Medication_Category
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationPZN.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'Medication.extension:Arzneimittelkategorie'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationPZN.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'Medication.extension:Arzneimittelkategorie'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension' |
| `KBVPRERPMedicationPZN.extension.value  [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value` | 🆕 Erstellt | Kopiert von 'Medication.extension:Arzneimittelkategorie.value[x]'<br>→ erstellt neues Coding |
| `KBVPRERPMedicationPZN.extension.value.code  [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.code` | ✅ Kopiert | Copied drugCategory code<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationPZN.extension.value  [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.system` | 📝 Setzt Wert | Fester Wert 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs' |

#### Extension: KBV_EX_ERP_Medication_Vaccine
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationPZN.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'Medication.extension:Impfstoff'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationPZN.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'Medication.extension:Impfstoff'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension' |
| `KBVPRERPMedicationPZN.extension.value  [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.value` | ✅ Kopiert | Kopiert von 'Medication.extension:Impfstoff.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: normgroesse
Bedingung: url = `http://fhir.de/StructureDefinition/normgroesse`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationPZN.extension [Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'Medication.extension:Normgroesse'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationPZN.extension [Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'Medication.extension:Normgroesse'<br>→ setzt URL 'http://fhir.de/StructureDefinition/normgroesse' |
| `KBVPRERPMedicationPZN.extension.value  [Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension.value` | ✅ Kopiert | Kopiert von 'Medication.extension:Normgroesse.value[x]'<br>→ übernimmt Wert aus Quellvariable |

