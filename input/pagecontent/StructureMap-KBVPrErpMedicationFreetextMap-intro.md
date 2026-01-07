### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationFreeText.batch` | `EPAMedication.batch` | ✅ Kopiert | Kopiert nach 'Medication.batch'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationFreeText.code` | `EPAMedication.code` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationFreeText.form` | `EPAMedication.form` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationFreeText.meta` | `EPAMedication.meta` | 🆕 Erstellt | Automatische Kopie<br>→ erstellt neues Meta |
| `KBVPRERPMedicationFreeText.meta` | `EPAMedication.meta.profile` | 📝 Setzt Wert | Fester Wert 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication' |

### Extensions

#### Extension: KBV_EX_ERP_Medication_Category
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationFreeText.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'Medication.extension:Arzneimittelkategorie'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationFreeText.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'Medication.extension:Arzneimittelkategorie'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension' |
| `KBVPRERPMedicationFreeText.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value` | 🆕 Erstellt | Kopiert von 'Medication.extension:Arzneimittelkategorie.value[x]'<br>→ erstellt neues Coding |
| `KBVPRERPMedicationFreeText.extension.value.code`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.code` | ✅ Kopiert | Copied drugCategory code<br>→ übernimmt Wert aus Quellvariable |

#### Extension: KBV_EX_ERP_Medication_Vaccine
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationFreeText.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'Medication.extension:Impfstoff'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationFreeText.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'Medication.extension:Impfstoff'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension' |
| `KBVPRERPMedicationFreeText.extension.value`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.value` | ✅ Kopiert | Kopiert von 'Medication.extension:Impfstoff.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: (ohne Bedingung)

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationFreeText.extension` | `Medication.extension:type` | 🛠️ Manuell | Fester Wert: 781405001, Medicinal product package (product) |

