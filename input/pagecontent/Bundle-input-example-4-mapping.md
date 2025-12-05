## Bundle → Parameters Mapping

> Quelle: [KBV Bundle](Bundle-input-example-4.html)
> Ziel: [EPA Provide Parameters](Parameters-output-example-4.html)

### Verordnungskennung

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 2

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Bundle.identifier.system` | — | `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId` | ⚠️ Offen |
| `Bundle.identifier.value` | — | `160.100.000.000.043.10` | ⚠️ Offen |

### Ausstellungsdatum

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 1

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `MedicationRequest.authoredOn` | — | `2024-05-20` | ⚠️ Offen |

### KBV MedicationRequest → EPA MedicationRequest

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 23

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `MedicationRequest.authoredOn` | — | `2024-05-20` | ⚠️ Offen |
| `MedicationRequest.dispenseRequest.quantity.unit` | — | `Packung` | ⚠️ Offen |
| `MedicationRequest.dispenseRequest.quantity.value` | — | `1` | ⚠️ Offen |
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
| `MedicationRequest.id` | — | `521786fd-c598-4b3f-95d1-51ac9540e836` | ⚠️ Offen |
| `MedicationRequest.insurance[0].reference` | — | `Coverage/e51239e1-ba74-48e0-97fb-9754d2b05c60` | ⚠️ Offen |
| `MedicationRequest.intent` | — | `order` | ⚠️ Offen |
| `MedicationRequest.medicationReference.reference` | — | `Medication/a23cea34-1141-42f3-903c-69740cc94a07` | ⚠️ Offen |
| `MedicationRequest.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription\|1.3` | ⚠️ Offen |
| `MedicationRequest.requester.reference` | — | `Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c` | ⚠️ Offen |
| `MedicationRequest.resourceType` | — | `MedicationRequest` | ⚠️ Offen |
| `MedicationRequest.status` | — | `active` | ⚠️ Offen |
| `MedicationRequest.subject.reference` | — | `Patient/30635f5d-c233-4500-94e8-6414940236aa` | ⚠️ Offen |
| `MedicationRequest.substitution.allowedBoolean` | — | `false` | ⚠️ Offen |

### KBV Organization → EPA Organization

*Abgedeckt:* 10 · *Neu:* 0 · *Offen:* 14

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Organization.id` | `Organization.id` | `2a555cd3-0543-483c-88b3-f68647620962` | ✅ Übernommen |
| `Organization.identifier[0].system` | `Organization.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR` | ✅ Übernommen |
| `Organization.identifier[0].type.coding[0].code` | `Organization.identifier[0].type.coding[0].code` | `BSNR` | ✅ Übernommen |
| `Organization.identifier[0].type.coding[0].system` | `Organization.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` | ✅ Übernommen |
| `Organization.identifier[0].value` | `Organization.identifier[0].value` | `724444400` | ✅ Übernommen |
| `Organization.resourceType` | `Organization.resourceType` | `Organization` | ✅ Übernommen |
| `Organization.telecom[0].system` | `Organization.telecom[0].system` | `phone` | ✅ Übernommen |
| `Organization.telecom[0].value` | `Organization.telecom[0].value` | `030321654987` | ✅ Übernommen |
| `Organization.telecom[1].system` | `Organization.telecom[1].system` | `email` | ✅ Übernommen |
| `Organization.telecom[1].value` | `Organization.telecom[1].value` | `hausarztpraxis@e-mail.de` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[0].url` | — | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` | ⚠️ Offen |
| `Organization.address[0]._line[0].extension[0].valueString` | — | `2` | ⚠️ Offen |
| `Organization.address[0]._line[0].extension[1].url` | — | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` | ⚠️ Offen |
| `Organization.address[0]._line[0].extension[1].valueString` | — | `Herbert-Lewin-Platz` | ⚠️ Offen |
| `Organization.address[0]._line[1].extension[0].url` | — | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator` | ⚠️ Offen |
| `Organization.address[0]._line[1].extension[0].valueString` | — | `Erdgeschoss` | ⚠️ Offen |
| `Organization.address[0].city` | — | `Berlin` | ⚠️ Offen |
| `Organization.address[0].country` | — | `D` | ⚠️ Offen |
| `Organization.address[0].line[0]` | — | `Herbert-Lewin-Platz 2` | ⚠️ Offen |
| `Organization.address[0].line[1]` | — | `Erdgeschoss` | ⚠️ Offen |
| `Organization.address[0].postalCode` | — | `10623` | ⚠️ Offen |
| `Organization.address[0].type` | — | `both` | ⚠️ Offen |
| `Organization.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization\|1.2` | ⚠️ Offen |
| `Organization.name` | — | `Hausarztpraxis` | ⚠️ Offen |

### KBV Practitioner → EPA Practitioner

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 17

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Practitioner.id` | — | `d6f3b55d-3095-4655-96dc-da3bec21271c` | ⚠️ Offen |
| `Practitioner.identifier[0].system` | — | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].code` | — | `LANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].system` | — | `http://terminology.hl7.org/CodeSystem/v2-0203` | ⚠️ Offen |
| `Practitioner.identifier[0].value` | — | `754236701` | ⚠️ Offen |
| `Practitioner.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner\|1.2` | ⚠️ Offen |
| `Practitioner.name[0]._family.extension[0].url` | — | `http://hl7.org/fhir/StructureDefinition/humanname-own-name` | ⚠️ Offen |
| `Practitioner.name[0]._family.extension[0].valueString` | — | `Schulz` | ⚠️ Offen |
| `Practitioner.name[0].family` | — | `Schulz` | ⚠️ Offen |
| `Practitioner.name[0].given[0]` | — | `Ben` | ⚠️ Offen |
| `Practitioner.name[0].use` | — | `official` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].code` | — | `00` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].code` | — | `Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.text` | — | `Facharzt für Allgemeinmedizin` | ⚠️ Offen |
| `Practitioner.resourceType` | — | `Practitioner` | ⚠️ Offen |

### KBV Medication → EPA Medication

*Abgedeckt:* 0 · *Neu:* 0 · *Offen:* 25

| KBV Pfad | EPA Pfad | Wert | Status |
| --- | --- | --- | --- |
| `Medication.code.coding[0].code` | — | `11219196` | ⚠️ Offen |
| `Medication.code.coding[0].system` | — | `http://fhir.de/CodeSystem/ifa/pzn` | ⚠️ Offen |
| `Medication.code.text` | — | `Abasaglar 100 E/ML KWIKPEN PEN 10x3ml` | ⚠️ Offen |
| `Medication.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type` | ⚠️ Offen |
| `Medication.extension[0].valueCodeableConcept.coding[0].code` | — | `763158003` | ⚠️ Offen |
| `Medication.extension[0].valueCodeableConcept.coding[0].display` | — | `Medicinal product (product)` | ⚠️ Offen |
| `Medication.extension[0].valueCodeableConcept.coding[0].system` | — | `http://snomed.info/sct` | ⚠️ Offen |
| `Medication.extension[0].valueCodeableConcept.coding[0].version` | — | `http://snomed.info/sct/11000274103/version/20240515` | ⚠️ Offen |
| `Medication.extension[1].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[1].valueCoding.code` | — | `00` | ⚠️ Offen |
| `Medication.extension[1].valueCoding.system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[2].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine` | ⚠️ Offen |
| `Medication.extension[2].valueBoolean` | — | `false` | ⚠️ Offen |
| `Medication.extension[3].url` | — | `http://fhir.de/StructureDefinition/normgroesse` | ⚠️ Offen |
| `Medication.extension[3].valueCode` | — | `N2` | ⚠️ Offen |
| `Medication.form.coding[0].code` | — | `PEN` | ⚠️ Offen |
| `Medication.form.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM` | ⚠️ Offen |
| `Medication.id` | — | `a23cea34-1141-42f3-903c-69740cc94a07` | ⚠️ Offen |
| `Medication.ingredient[0].itemCodeableConcept.text` | — | `Insulin glargin` | ⚠️ Offen |
| `Medication.ingredient[0].strength.denominator.unit` | — | `ml` | ⚠️ Offen |
| `Medication.ingredient[0].strength.denominator.value` | — | `3` | ⚠️ Offen |
| `Medication.ingredient[0].strength.numerator.unit` | — | `E.` | ⚠️ Offen |
| `Medication.ingredient[0].strength.numerator.value` | — | `300` | ⚠️ Offen |
| `Medication.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN\|1.3` | ⚠️ Offen |
| `Medication.resourceType` | — | `Medication` | ⚠️ Offen |
