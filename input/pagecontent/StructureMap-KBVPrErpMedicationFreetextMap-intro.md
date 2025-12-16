| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationFreeText.batch` | `EPAMedication.batch` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues BackboneElement |
| `KBVPRERPMedicationFreeText.batch.expirationDate` | `EPAMedication.batch.expirationDate` | ✅ Kopiert | Automatic copy \| Inherited from Medication.batch<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationFreeText.batch.lotNumber` | `EPAMedication.batch.lotNumber` | ✅ Kopiert | Automatic copy \| Inherited from Medication.batch<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationFreeText` | `EPAMedication.extension` | 🆕 Erstellt | Copied from 'Medication.extension:Impfstoff'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationFreeText` | `EPAMedication.extension.url` | 📝 Setzt Wert | Copied from 'Medication.extension:Impfstoff'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension' |
| `KBVPRERPMedicationFreeText` | `EPAMedication.meta.profile` | 📝 Setzt Wert | Fixed value 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication' |
