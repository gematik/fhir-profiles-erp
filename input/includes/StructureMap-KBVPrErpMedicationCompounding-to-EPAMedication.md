
**Titel:** F2a3c4d5e6f704a8192b31c2d3e4f5601StructuremapKbvPrErpMedicationC

**Beschreibung:** Auto-generated StructureMap for KBV_PR_ERP_Medication_Compounding|1.3.2, KBV_PR_ERP_Medication_FreeText|1.3.2, KBV_PR_ERP_Medication_Ingredient|1.3.2, KBV_PR_ERP_Medication_PZN|1.3.2 -> EPAMedication|1.0.6-2

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Copied from 'Medication.amount.numerator.extension:Gesamtmenge' |
| `KBVPRERPMedicationCompounding.amount.numerator.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize']` | `extension` | → erstellt neues Extension |
| `KBVPRERPMedicationCompounding.amount.numerator.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize']` | `url` | → setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-total-quantity-formulation-extension' |
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.amount` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.batch` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.batch` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.batch` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.code` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.code` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.code` | Automatic copy |
| `KBVPRERPMedicationCompounding.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension` | Copied from 'Medication.extension:Arzneimittelkategorie'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationCompounding.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `url` | Copied from 'Medication.extension:Arzneimittelkategorie'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension' |
| `KBVPRERPMedicationCompounding.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category'].value` | `EPAMedication.extension.value` | → erstellt neues Coding |
| `KBVPRERPMedicationCompounding.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension` | Copied from 'Medication.extension:Impfstoff'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationCompounding.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `url` | Copied from 'Medication.extension:Impfstoff'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension' |
| `KBVPRERPMedicationCompounding.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction']` | `EPAMedication.extension` | Copied from 'Medication.extension:Herstellungsanweisung'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationCompounding.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction']` | `url` | Copied from 'Medication.extension:Herstellungsanweisung'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension' |
| `KBVPRERPMedicationCompounding.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging']` | `EPAMedication.extension` | Copied from 'Medication.extension:Verpackung'<br>→ erstellt neues Extension |
| `KBVPRERPMedicationCompounding.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging']` | `url` | Copied from 'Medication.extension:Verpackung'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension' |
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
| `KBVPRERPMedicationCompounding` | `EPAMedication.form` | Automatic copy |
| `KBVPRERPMedicationCompounding.id` | `EPAMedication.id` | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Automatic copy |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient` | Fixed value 'http://fhir.de/CodeSystem/ifa/pzn' | Auto-detected fixed value from target profile |
| `KBVPRERPMedicationCompounding` | `EPAMedication.ingredient.item` | → erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding.ingredient.item.coding.system` | `system` | → setzt URL 'http://fhir.de/CodeSystem/ifa/pzn' |
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
| `KBVPRERPMedicationCompounding.modifierExtension` | `EPAMedication.modifierExtension` | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
