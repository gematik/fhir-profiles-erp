
**Titel:** KBV-PR-ERP-Medication-Ingredient-Map

**Beschreibung:** Auto-generated StructureMap for KBV_PR_ERP_Medication_Compounding|1.3.2, KBV_PR_ERP_Medication_FreeText|1.3.2, KBV_PR_ERP_Medication_Ingredient|1.3.2, KBV_PR_ERP_Medication_PZN|1.3.2 -> EPAMedication|1.0.6-2

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.batch` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.batch` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.batch` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.code` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.code` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Fixed value 'http://standardterms.edqm.eu' | Auto-detected fixed value from target profile |
| `KBVPRERPMedicationCompounding.form.coding.system` | `system` | → setzt URL 'http://standardterms.edqm.eu' |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Fixed value 'https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM' | Auto-detected fixed value from target profile |
| `KBVPRERPMedicationCompounding.form.coding.system` | `system` | → setzt URL 'https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM' |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Fixed value 'http://snomed.info/sct' | Auto-detected fixed value from target profile |
| `KBVPRERPMedicationCompounding.form.coding.system` | `system` | → setzt URL 'http://snomed.info/sct' |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding.id` | `EPAMedication.id` | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Fixed value 'http://fhir.de/CodeSystem/ask' | Auto-detected fixed value from target profile |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding.ingredient.item.coding.system` | `system` | → setzt URL 'http://fhir.de/CodeSystem/ask' |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
