## Bundle → Parameters Mapping

> Quelle: [KBV Bundle](Bundle-input-example-2.html)
> Ziel: [EPA Provide Parameters](Parameters-output-example-2.html)

### Verordnungskennung

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 2

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Bundle.identifier.system` | — | `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId` | ⚠️ Offen |
| `Bundle.identifier.value` | — | `160.100.000.000.019.82` | ⚠️ Offen |

### Ausstellungsdatum

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 1

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `MedicationRequest.authoredOn` | — | `2024-05-20` | ⚠️ Offen |

### KBV MedicationRequest → EPA MedicationRequest

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 26

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `MedicationRequest.authoredOn` | — | `2024-05-20` | ⚠️ Offen |
| `MedicationRequest.dispenseRequest.quantity.unit` | — | `Packung` | ⚠️ Offen |
| `MedicationRequest.dispenseRequest.quantity.value` | — | `1` | ⚠️ Offen |
| `MedicationRequest.dosageInstruction[0].extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag` | ⚠️ Offen |
| `MedicationRequest.dosageInstruction[0].extension[0].valueBoolean` | — | `true` | ⚠️ Offen |
| `MedicationRequest.dosageInstruction[0].text` | — | `1-0-0-0` | ⚠️ Offen |
| `MedicationRequest.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment` | ⚠️ Offen |
| `MedicationRequest.extension[0].valueCoding.code` | — | `0` | ⚠️ Offen |
| `MedicationRequest.extension[0].valueCoding.system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_StatusCoPayment` | ⚠️ Offen |
| `MedicationRequest.extension[1].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee` | ⚠️ Offen |
| `MedicationRequest.extension[1].valueBoolean` | — | `false` | ⚠️ Offen |
| `MedicationRequest.extension[2].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER` | ⚠️ Offen |
| `MedicationRequest.extension[2].valueBoolean` | — | `false` | ⚠️ Offen |
| `MedicationRequest.extension[3].extension[0].url` | — | `Kennzeichen` | ⚠️ Offen |
| `MedicationRequest.extension[3].extension[0].valueBoolean` | — | `false` | ⚠️ Offen |
| `MedicationRequest.extension[3].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription` | ⚠️ Offen |
| `MedicationRequest.id` | — | `4a7eefdd-df71-4a72-8047-c158017534a1` | ⚠️ Offen |
| `MedicationRequest.insurance[0].reference` | — | `Coverage/da80211e-61ee-458e-a651-87370b6ec30c` | ⚠️ Offen |
| `MedicationRequest.intent` | — | `order` | ⚠️ Offen |
| `MedicationRequest.medicationReference.reference` | — | `Medication/86fa62c7-06a0-418e-ba26-e99baa053c07` | ⚠️ Offen |
| `MedicationRequest.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription\|1.3` | ⚠️ Offen |
| `MedicationRequest.note[0].text` | — | `Bitte längliche Tabletten, da Patient Probleme mit dem Schlucken von runden hat.` | ⚠️ Offen |
| `MedicationRequest.requester.reference` | — | `Practitioner/bc329f24-3d65-4286-bf06-b54dd6cad655` | ⚠️ Offen |
| `MedicationRequest.resourceType` | — | `MedicationRequest` | ⚠️ Offen |
| `MedicationRequest.status` | — | `active` | ⚠️ Offen |
| `MedicationRequest.subject.reference` | — | `Patient/ce4104af-b86b-4664-afee-1b5fc3ac8acf` | ⚠️ Offen |

### KBV Organization → EPA Organization

*Abgedeckt:* 12 · *Neu:* 0 · *Offen:* 11

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Organization.id` | `Organization.id` | `5d3f4ac0-2b44-4d48-b363-e63efa72973b` | ✅ Übernommen |
| `Organization.identifier[0].system` | `Organization.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR` | ✅ Übernommen |
| `Organization.identifier[0].type.coding[0].code` | `Organization.identifier[0].type.coding[0].code` | `BSNR` | ✅ Übernommen |
| `Organization.identifier[0].type.coding[0].system` | `Organization.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` | ✅ Übernommen |
| `Organization.identifier[0].value` | `Organization.identifier[0].value` | `721111100` | ✅ Übernommen |
| `Organization.resourceType` | `Organization.resourceType` | `Organization` | ✅ Übernommen |
| `Organization.telecom[0].system` | `Organization.telecom[0].system` | `phone` | ✅ Übernommen |
| `Organization.telecom[0].value` | `Organization.telecom[0].value` | `0301234567` | ✅ Übernommen |
| `Organization.telecom[1].system` | `Organization.telecom[1].system` | `fax` | ✅ Übernommen |
| `Organization.telecom[1].value` | `Organization.telecom[1].value` | `030123456789` | ✅ Übernommen |
| `Organization.telecom[2].system` | `Organization.telecom[2].system` | `email` | ✅ Übernommen |
| `Organization.telecom[2].value` | `Organization.telecom[2].value` | `mvz@e-mail.de` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[0].url` | — | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` | ⚠️ Offen |
| `Organization.address[0]._line[0].extension[0].valueString` | — | `2` | ⚠️ Offen |
| `Organization.address[0]._line[0].extension[1].url` | — | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` | ⚠️ Offen |
| `Organization.address[0]._line[0].extension[1].valueString` | — | `Herbert-Lewin-Platz` | ⚠️ Offen |
| `Organization.address[0].city` | — | `Berlin` | ⚠️ Offen |
| `Organization.address[0].country` | — | `D` | ⚠️ Offen |
| `Organization.address[0].line[0]` | — | `Herbert-Lewin-Platz 2` | ⚠️ Offen |
| `Organization.address[0].postalCode` | — | `10623` | ⚠️ Offen |
| `Organization.address[0].type` | — | `both` | ⚠️ Offen |
| `Organization.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization\|1.2` | ⚠️ Offen |
| `Organization.name` | — | `MVZ` | ⚠️ Offen |

### KBV Practitioner → EPA Practitioner

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 24

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Practitioner.id` | — | `bc329f24-3d65-4286-bf06-b54dd6cad655` | ⚠️ Offen |
| `Practitioner.identifier[0].system` | — | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].code` | — | `LANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].system` | — | `http://terminology.hl7.org/CodeSystem/v2-0203` | ⚠️ Offen |
| `Practitioner.identifier[0].value` | — | `123456628` | ⚠️ Offen |
| `Practitioner.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner\|1.2` | ⚠️ Offen |
| `Practitioner.name[0]._family.extension[0].url` | — | `http://hl7.org/fhir/StructureDefinition/humanname-own-prefix` | ⚠️ Offen |
| `Practitioner.name[0]._family.extension[0].valueString` | — | `von` | ⚠️ Offen |
| `Practitioner.name[0]._family.extension[1].url` | — | `http://fhir.de/StructureDefinition/humanname-namenszusatz` | ⚠️ Offen |
| `Practitioner.name[0]._family.extension[1].valueString` | — | `Freiherr` | ⚠️ Offen |
| `Practitioner.name[0]._family.extension[2].url` | — | `http://hl7.org/fhir/StructureDefinition/humanname-own-name` | ⚠️ Offen |
| `Practitioner.name[0]._family.extension[2].valueString` | — | `Müller` | ⚠️ Offen |
| `Practitioner.name[0]._prefix[0].extension[0].url` | — | `http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier` | ⚠️ Offen |
| `Practitioner.name[0]._prefix[0].extension[0].valueCode` | — | `AC` | ⚠️ Offen |
| `Practitioner.name[0].family` | — | `Freiherr von Müller` | ⚠️ Offen |
| `Practitioner.name[0].given[0]` | — | `Paul` | ⚠️ Offen |
| `Practitioner.name[0].prefix[0]` | — | `Dr. med.` | ⚠️ Offen |
| `Practitioner.name[0].use` | — | `official` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].code` | — | `00` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].code` | — | `Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.text` | — | `Facharzt für Innere Medizin: Kardiologie` | ⚠️ Offen |
| `Practitioner.resourceType` | — | `Practitioner` | ⚠️ Offen |

### KBV Medication → EPA Medication

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 24

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Medication.amount.denominator.value` | — | `1` | ⚠️ Offen |
| `Medication.amount.numerator.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize` | ⚠️ Offen |
| `Medication.amount.numerator.extension[0].valueString` | — | `100` | ⚠️ Offen |
| `Medication.amount.numerator.unit` | — | `Stück` | ⚠️ Offen |
| `Medication.code.coding[0].code` | — | `wirkstoff` | ⚠️ Offen |
| `Medication.code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type` | ⚠️ Offen |
| `Medication.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine` | ⚠️ Offen |
| `Medication.extension[0].valueBoolean` | — | `false` | ⚠️ Offen |
| `Medication.extension[1].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[1].valueCoding.code` | — | `00` | ⚠️ Offen |
| `Medication.extension[1].valueCoding.system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[2].url` | — | `http://fhir.de/StructureDefinition/normgroesse` | ⚠️ Offen |
| `Medication.extension[2].valueCode` | — | `N3` | ⚠️ Offen |
| `Medication.form.text` | — | `Tabletten` | ⚠️ Offen |
| `Medication.id` | — | `86fa62c7-06a0-418e-ba26-e99baa053c07` | ⚠️ Offen |
| `Medication.ingredient[0].itemCodeableConcept.coding[0].code` | — | `22686` | ⚠️ Offen |
| `Medication.ingredient[0].itemCodeableConcept.coding[0].system` | — | `http://fhir.de/CodeSystem/ask` | ⚠️ Offen |
| `Medication.ingredient[0].itemCodeableConcept.text` | — | `Ramipril` | ⚠️ Offen |
| `Medication.ingredient[0].strength.denominator.unit` | — | `Stück` | ⚠️ Offen |
| `Medication.ingredient[0].strength.denominator.value` | — | `1` | ⚠️ Offen |
| `Medication.ingredient[0].strength.numerator.unit` | — | `mg` | ⚠️ Offen |
| `Medication.ingredient[0].strength.numerator.value` | — | `5` | ⚠️ Offen |
| `Medication.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient\|1.3` | ⚠️ Offen |
| `Medication.resourceType` | — | `Medication` | ⚠️ Offen |
