## Bundle → Parameters Mapping

> Quelle: [KBV Bundle](Bundle-input-example-2.html)
> Ziel: [EPA Provide Parameters](Parameters-output-example-2.html)

### Verordnungskennung

*Abgedeckt:* 1 · *Neu:* 1 · *Offen:* 1

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Bundle.identifier.value` | `Parameters.prescriptionId.valueString` | `160.100.000.000.019.82` | ✅ Übernommen |
| — | `Parameters.prescriptionId.name` | `prescriptionId` | 🆕 Nur Ziel |
| `Bundle.identifier.system` | — | `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId` | ⚠️ Offen |

### Ausstellungsdatum

*Abgedeckt:* 1 · *Neu:* 1 · *Offen:* 0

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `MedicationRequest.authoredOn` | `Parameters.authoredOn.valueDateTime` | `2024-05-20` | ✅ Übernommen |
| — | `Parameters.authoredOn.name` | `authoredOn` | 🆕 Nur Ziel |

### KBV MedicationRequest → EPA MedicationRequest

*Abgedeckt:* 15 · *Neu:* 4 · *Offen:* 12

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `MedicationRequest.authoredOn` | `MedicationRequest.authoredOn` | `2024-05-20` | ✅ Übernommen |
| `MedicationRequest.dispenseRequest.quantity.unit` | `MedicationRequest.dispenseRequest.quantity.unit` | `Packung` | ✅ Übernommen |
| `MedicationRequest.dispenseRequest.quantity.value` | `MedicationRequest.dispenseRequest.quantity.value` | `1` | ✅ Übernommen |
| `MedicationRequest.dosageInstruction[0].extension[0].url` | `MedicationRequest.dosageInstruction[0].extension[0].url` | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag` | ✅ Übernommen |
| `MedicationRequest.dosageInstruction[0].extension[0].valueBoolean` | `MedicationRequest.dosageInstruction[0].extension[0].valueBoolean` | `true` | ✅ Übernommen |
| `MedicationRequest.dosageInstruction[0].text` | `MedicationRequest.dosageInstruction[0].text` | `1-0-0-0` | ✅ Übernommen |
| `MedicationRequest.extension[1].valueBoolean` | `MedicationRequest.extension[0].valueBoolean` | `false` | ✅ Übernommen |
| `MedicationRequest.extension[1].valueBoolean` | `MedicationRequest.extension[1].extension[0].valueBoolean` | `false` | ✅ Übernommen |
| `MedicationRequest.intent` | `MedicationRequest.intent` | `order` | ✅ Übernommen |
| `MedicationRequest.medicationReference.reference` | `MedicationRequest.medicationReference.reference` | `Medication/86fa62c7-06a0-418e-ba26-e99baa053c07` | ✅ Übernommen |
| `MedicationRequest.note[0].text` | `MedicationRequest.note[0].text` | `Bitte längliche Tabletten, da Patient Probleme mit dem Schlucken von runden hat.` | ✅ Übernommen |
| `MedicationRequest.requester.reference` | `MedicationRequest.requester.reference` | `Practitioner/bc329f24-3d65-4286-bf06-b54dd6cad655` | ✅ Übernommen |
| `MedicationRequest.resourceType` | `MedicationRequest.resourceType` | `MedicationRequest` | ✅ Übernommen |
| `MedicationRequest.status` | `MedicationRequest.status` | `active` | ✅ Übernommen |
| `MedicationRequest.subject.reference` | `MedicationRequest.subject.reference` | `Patient/ce4104af-b86b-4664-afee-1b5fc3ac8acf` | ✅ Übernommen |
| — | `MedicationRequest.extension[0].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/indicator-ser-extension` | 🆕 Nur Ziel |
| — | `MedicationRequest.extension[1].extension[0].url` | `indicator` | 🆕 Nur Ziel |
| — | `MedicationRequest.extension[1].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/multiple-prescription-extension` | 🆕 Nur Ziel |
| — | `MedicationRequest.meta.profile[0]` | `https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request` | 🆕 Nur Ziel |
| `MedicationRequest.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment` | ⚠️ Offen |
| `MedicationRequest.extension[0].valueCoding.code` | — | `0` | ⚠️ Offen |
| `MedicationRequest.extension[0].valueCoding.system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_StatusCoPayment` | ⚠️ Offen |
| `MedicationRequest.extension[1].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee` | ⚠️ Offen |
| `MedicationRequest.extension[2].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER` | ⚠️ Offen |
| `MedicationRequest.extension[2].valueBoolean` | — | `false` | ⚠️ Offen |
| `MedicationRequest.extension[3].extension[0].url` | — | `Kennzeichen` | ⚠️ Offen |
| `MedicationRequest.extension[3].extension[0].valueBoolean` | — | `false` | ⚠️ Offen |
| `MedicationRequest.extension[3].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription` | ⚠️ Offen |
| `MedicationRequest.id` | — | `4a7eefdd-df71-4a72-8047-c158017534a1` | ⚠️ Offen |
| `MedicationRequest.insurance[0].reference` | — | `Coverage/da80211e-61ee-458e-a651-87370b6ec30c` | ⚠️ Offen |
| `MedicationRequest.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription\|1.3` | ⚠️ Offen |

### KBV Organization → EPA Organization

*Abgedeckt:* 25 · *Neu:* 1 · *Offen:* 7

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Organization.address[0]._line[0].extension[0].url` | `Organization.address[0]._line[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[0].url` | `Organization.address[1]._line[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[0].valueString` | `Organization.address[0]._line[0].extension[0].valueString` | `2` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[0].valueString` | `Organization.address[1]._line[0].extension[0].valueString` | `2` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[1].url` | `Organization.address[0]._line[0].extension[1].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[1].url` | `Organization.address[1]._line[0].extension[1].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[1].valueString` | `Organization.address[0]._line[0].extension[1].valueString` | `Herbert-Lewin-Platz` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[1].valueString` | `Organization.address[1]._line[0].extension[1].valueString` | `Herbert-Lewin-Platz` | ✅ Übernommen |
| `Organization.address[0].city` | `Organization.address[0].city` | `Berlin` | ✅ Übernommen |
| `Organization.address[0].city` | `Organization.address[1].city` | `Berlin` | ✅ Übernommen |
| `Organization.address[0].country` | `Organization.address[0].country` | `D` | ✅ Übernommen |
| `Organization.address[0].country` | `Organization.address[1].country` | `D` | ✅ Übernommen |
| `Organization.address[0].line[0]` | `Organization.address[0].line[0]` | `Herbert-Lewin-Platz 2` | ✅ Übernommen |
| `Organization.address[0].line[0]` | `Organization.address[1].line[0]` | `Herbert-Lewin-Platz 2` | ✅ Übernommen |
| `Organization.address[0].postalCode` | `Organization.address[0].postalCode` | `10623` | ✅ Übernommen |
| `Organization.address[0].postalCode` | `Organization.address[1].postalCode` | `10623` | ✅ Übernommen |
| `Organization.address[0].type` | `Organization.address[0].type` | `both` | ✅ Übernommen |
| `Organization.address[0].type` | `Organization.address[1].type` | `both` | ✅ Übernommen |
| `Organization.resourceType` | `Organization.resourceType` | `Organization` | ✅ Übernommen |
| `Organization.telecom[0].system` | `Organization.telecom[0].system` | `phone` | ✅ Übernommen |
| `Organization.telecom[0].value` | `Organization.telecom[0].value` | `0301234567` | ✅ Übernommen |
| `Organization.telecom[1].system` | `Organization.telecom[1].system` | `fax` | ✅ Übernommen |
| `Organization.telecom[1].value` | `Organization.telecom[1].value` | `030123456789` | ✅ Übernommen |
| `Organization.telecom[2].system` | `Organization.telecom[2].system` | `email` | ✅ Übernommen |
| `Organization.telecom[2].value` | `Organization.telecom[2].value` | `mvz@e-mail.de` | ✅ Übernommen |
| — | `Organization.meta.profile[0]` | `https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory` | 🆕 Nur Ziel |
| `Organization.id` | — | `5d3f4ac0-2b44-4d48-b363-e63efa72973b` | ⚠️ Offen |
| `Organization.identifier[0].system` | — | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR` | ⚠️ Offen |
| `Organization.identifier[0].type.coding[0].code` | — | `BSNR` | ⚠️ Offen |
| `Organization.identifier[0].type.coding[0].system` | — | `http://terminology.hl7.org/CodeSystem/v2-0203` | ⚠️ Offen |
| `Organization.identifier[0].value` | — | `721111100` | ⚠️ Offen |
| `Organization.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization\|1.2` | ⚠️ Offen |
| `Organization.name` | — | `MVZ` | ⚠️ Offen |

### KBV Practitioner → EPA Practitioner

*Abgedeckt:* 13 · *Neu:* 1 · *Offen:* 11

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Practitioner.name[0]._family.extension[0].url` | `Practitioner.name[0]._family.extension[0].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-prefix` | ✅ Übernommen |
| `Practitioner.name[0]._family.extension[0].valueString` | `Practitioner.name[0]._family.extension[0].valueString` | `von` | ✅ Übernommen |
| `Practitioner.name[0]._family.extension[1].url` | `Practitioner.name[0]._family.extension[1].url` | `http://fhir.de/StructureDefinition/humanname-namenszusatz` | ✅ Übernommen |
| `Practitioner.name[0]._family.extension[1].valueString` | `Practitioner.name[0]._family.extension[1].valueString` | `Freiherr` | ✅ Übernommen |
| `Practitioner.name[0]._family.extension[2].url` | `Practitioner.name[0]._family.extension[2].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-name` | ✅ Übernommen |
| `Practitioner.name[0]._family.extension[2].valueString` | `Practitioner.name[0]._family.extension[2].valueString` | `Müller` | ✅ Übernommen |
| `Practitioner.name[0]._prefix[0].extension[0].url` | `Practitioner.name[0]._prefix[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier` | ✅ Übernommen |
| `Practitioner.name[0]._prefix[0].extension[0].valueCode` | `Practitioner.name[0]._prefix[0].extension[0].valueCode` | `AC` | ✅ Übernommen |
| `Practitioner.name[0].family` | `Practitioner.name[0].family` | `Freiherr von Müller` | ✅ Übernommen |
| `Practitioner.name[0].given[0]` | `Practitioner.name[0].given[0]` | `Paul` | ✅ Übernommen |
| `Practitioner.name[0].prefix[0]` | `Practitioner.name[0].prefix[0]` | `Dr. med.` | ✅ Übernommen |
| `Practitioner.name[0].use` | `Practitioner.name[0].use` | `official` | ✅ Übernommen |
| `Practitioner.resourceType` | `Practitioner.resourceType` | `Practitioner` | ✅ Übernommen |
| — | `Practitioner.meta.profile[0]` | `https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory` | 🆕 Nur Ziel |
| `Practitioner.id` | — | `bc329f24-3d65-4286-bf06-b54dd6cad655` | ⚠️ Offen |
| `Practitioner.identifier[0].system` | — | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].code` | — | `LANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].system` | — | `http://terminology.hl7.org/CodeSystem/v2-0203` | ⚠️ Offen |
| `Practitioner.identifier[0].value` | — | `123456628` | ⚠️ Offen |
| `Practitioner.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner\|1.2` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].code` | — | `00` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].code` | — | `Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.text` | — | `Facharzt für Innere Medizin: Kardiologie` | ⚠️ Offen |

### KBV Medication → EPA Medication

*Abgedeckt:* 6 · *Neu:* 3 · *Offen:* 18

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Medication.code.coding[0].code` | `Medication.code.coding[0].code` | `wirkstoff` | ✅ Übernommen |
| `Medication.code.coding[0].system` | `Medication.code.coding[0].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type` | ✅ Übernommen |
| `Medication.extension[0].valueBoolean` | `Medication.extension[1].valueBoolean` | `false` | ✅ Übernommen |
| `Medication.extension[1].valueCoding.code` | `Medication.extension[0].valueCoding.code` | `00` | ✅ Übernommen |
| `Medication.form.text` | `Medication.form.text` | `Tabletten` | ✅ Übernommen |
| `Medication.resourceType` | `Medication.resourceType` | `Medication` | ✅ Übernommen |
| — | `Medication.extension[0].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` | 🆕 Nur Ziel |
| — | `Medication.extension[1].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` | 🆕 Nur Ziel |
| — | `Medication.meta.profile[0]` | `https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication` | 🆕 Nur Ziel |
| `Medication.amount.denominator.value` | — | `1` | ⚠️ Offen |
| `Medication.amount.numerator.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize` | ⚠️ Offen |
| `Medication.amount.numerator.extension[0].valueString` | — | `100` | ⚠️ Offen |
| `Medication.amount.numerator.unit` | — | `Stück` | ⚠️ Offen |
| `Medication.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine` | ⚠️ Offen |
| `Medication.extension[1].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[1].valueCoding.system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[2].url` | — | `http://fhir.de/StructureDefinition/normgroesse` | ⚠️ Offen |
| `Medication.extension[2].valueCode` | — | `N3` | ⚠️ Offen |
| `Medication.id` | — | `86fa62c7-06a0-418e-ba26-e99baa053c07` | ⚠️ Offen |
| `Medication.ingredient[0].itemCodeableConcept.coding[0].code` | — | `22686` | ⚠️ Offen |
| `Medication.ingredient[0].itemCodeableConcept.coding[0].system` | — | `http://fhir.de/CodeSystem/ask` | ⚠️ Offen |
| `Medication.ingredient[0].itemCodeableConcept.text` | — | `Ramipril` | ⚠️ Offen |
| `Medication.ingredient[0].strength.denominator.unit` | — | `Stück` | ⚠️ Offen |
| `Medication.ingredient[0].strength.denominator.value` | — | `1` | ⚠️ Offen |
| `Medication.ingredient[0].strength.numerator.unit` | — | `mg` | ⚠️ Offen |
| `Medication.ingredient[0].strength.numerator.value` | — | `5` | ⚠️ Offen |
| `Medication.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient\|1.3` | ⚠️ Offen |
