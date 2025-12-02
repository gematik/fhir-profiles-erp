## Bundle → Parameters Mapping

> Quelle: [KBV Bundle](Bundle-input-example-5.html)
> Ziel: [EPA Provide Parameters](Parameters-output-example-5.html)

### Verordnungskennung

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| — | `Parameters.prescriptionId.name` | `prescriptionId` |
| `Bundle.identifier.system` | `Parameters.prescriptionId.valueIdentifier.system` | `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId` |
| `Bundle.identifier.value` | `Parameters.prescriptionId.valueIdentifier.value` | `160.100.000.000.040.19` |

### Ausstellungsdatum

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| `MedicationRequest.authoredOn` | `MedicationRequest.authoredOn` | `2024-05-20` |

### KBV MedicationRequest → EPA MedicationRequest

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| `MedicationRequest.authoredOn` | `MedicationRequest.authoredOn` | `2024-05-20` |
| `MedicationRequest.dispenseRequest.quantity.unit` | `MedicationRequest.dispenseRequest.quantity.unit` | `Packung` |
| `MedicationRequest.dispenseRequest.quantity.value` | `MedicationRequest.dispenseRequest.quantity.value` | `1` |
| `MedicationRequest.id` | `MedicationRequest.id` | `9218cbd8-71f1-4800-9b52-370860b7079f` |
| `MedicationRequest.insurance[0].reference` | `MedicationRequest.insurance[0].reference` | `Coverage/e51239e1-ba74-48e0-97fb-9754d2b05c60` |
| `MedicationRequest.intent` | `MedicationRequest.intent` | `order` |
| `MedicationRequest.medicationReference.reference` | `MedicationRequest.medicationReference.reference` | `Medication/523bfe94-d8f0-42ac-b4d1-92910cad5be7` |
| `MedicationRequest.requester.reference` | `MedicationRequest.requester.reference` | `Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c` |
| `MedicationRequest.resourceType` | `MedicationRequest.resourceType` | `MedicationRequest` |
| `MedicationRequest.status` | `MedicationRequest.status` | `active` |
| `MedicationRequest.subject.reference` | `MedicationRequest.subject.reference` | `Patient/1d36152b-40c6-4aeb-a552-86a4d3277edc` |
| `MedicationRequest.substitution.allowedBoolean` | `MedicationRequest.substitution.allowedBoolean` | `true` |

### KBV Organization → EPA Organization

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| `Organization.address[0]._line[0].extension[0].url` | `Organization.address[0]._line[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` |
| `Organization.address[0]._line[0].extension[0].valueString` | `Organization.address[0]._line[0].extension[0].valueString` | `2` |
| `Organization.address[0]._line[0].extension[1].url` | `Organization.address[0]._line[0].extension[1].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` |
| `Organization.address[0]._line[0].extension[1].valueString` | `Organization.address[0]._line[0].extension[1].valueString` | `Herbert-Lewin-Platz` |
| `Organization.address[0]._line[1].extension[0].url` | `Organization.address[0]._line[1].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator` |
| `Organization.address[0]._line[1].extension[0].valueString` | `Organization.address[0]._line[1].extension[0].valueString` | `Erdgeschoss` |
| `Organization.address[0].city` | `Organization.address[0].city` | `Berlin` |
| `Organization.address[0].country` | `Organization.address[0].country` | `D` |
| `Organization.address[0].line[0]` | `Organization.address[0].line[0]` | `Herbert-Lewin-Platz 2` |
| `Organization.address[0].line[1]` | `Organization.address[0].line[1]` | `Erdgeschoss` |
| `Organization.address[0].postalCode` | `Organization.address[0].postalCode` | `10623` |
| `Organization.address[0].type` | `Organization.address[0].type` | `both` |
| `Organization.id` | `Organization.id` | `2a555cd3-0543-483c-88b3-f68647620962` |
| `Organization.identifier[0].system` | `Organization.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR` |
| `Organization.identifier[0].type.coding[0].code` | `Organization.identifier[0].type.coding[0].code` | `BSNR` |
| `Organization.identifier[0].type.coding[0].system` | `Organization.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Organization.identifier[0].value` | `Organization.identifier[0].value` | `724444400` |
| `Organization.name` | `Organization.name` | `Hausarztpraxis` |
| `Organization.resourceType` | `Organization.resourceType` | `Organization` |
| `Organization.telecom[0].system` | `Organization.telecom[0].system` | `phone` |
| `Organization.telecom[0].value` | `Organization.telecom[0].value` | `030321654987` |
| `Organization.telecom[1].system` | `Organization.telecom[1].system` | `email` |
| `Organization.telecom[1].value` | `Organization.telecom[1].value` | `hausarztpraxis@e-mail.de` |

### KBV Practitioner → EPA Practitioner

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| `Practitioner.id` | `Practitioner.id` | `d6f3b55d-3095-4655-96dc-da3bec21271c` |
| `Practitioner.identifier[0].system` | `Practitioner.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` |
| `Practitioner.identifier[0].type.coding[0].code` | `Practitioner.identifier[0].type.coding[0].code` | `LANR` |
| `Practitioner.identifier[0].type.coding[0].system` | `Practitioner.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Practitioner.identifier[0].value` | `Practitioner.identifier[0].value` | `754236701` |
| `Practitioner.name[0]._family.extension[0].url` | `Practitioner.name[0]._family.extension[0].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-name` |
| `Practitioner.name[0]._family.extension[0].valueString` | `Practitioner.name[0]._family.extension[0].valueString` | `Schulz` |
| `Practitioner.name[0].family` | `Practitioner.name[0].family` | `Schulz` |
| `Practitioner.name[0].given[0]` | `Practitioner.name[0].given[0]` | `Ben` |
| `Practitioner.name[0].use` | `Practitioner.name[0].use` | `official` |
| `Practitioner.qualification[1].code.coding[0].code` | `Practitioner.qualification[0].code.coding[0].code` | `Berufsbezeichnung` |
| `Practitioner.qualification[1].code.coding[0].system` | `Practitioner.qualification[0].code.coding[0].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung` |
| `Practitioner.qualification[1].code.text` | `Practitioner.qualification[0].code.text` | `Facharzt für Allgemeinmedizin` |
| `Practitioner.resourceType` | `Practitioner.resourceType` | `Practitioner` |

### KBV Medication → EPA Medication

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| `Medication.code.coding[0].code` | `Medication.code.coding[0].code` | `09943571` |
| `Medication.code.coding[0].system` | `Medication.code.coding[0].system` | `http://fhir.de/CodeSystem/ifa/pzn` |
| `Medication.code.coding[0].code` | `Medication.code.coding[1].code` | `09943571` |
| `Medication.code.coding[0].system` | `Medication.code.coding[2].system` | `http://fhir.de/CodeSystem/ifa/pzn` |
| `Medication.code.text` | `Medication.code.text` | `Sprycel 100MG FTA 30 ST` |
| `Medication.form.coding[0].code` | `Medication.form.coding[0].code` | `FTA` |
| `Medication.form.coding[0].system` | `Medication.form.coding[0].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM` |
| `Medication.form.coding[0].code` | `Medication.form.coding[1].code` | `FTA` |
| `Medication.form.coding[0].system` | `Medication.form.coding[2].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM` |
| `Medication.id` | `Medication.id` | `523bfe94-d8f0-42ac-b4d1-92910cad5be7` |
| `Medication.ingredient[0].itemCodeableConcept.text` | `Medication.ingredient[0].itemCodeableConcept.text` | `Dasatinib` |
| `Medication.ingredient[0].strength.denominator.unit` | `Medication.ingredient[1].strength.denominator.unit` | `Stück` |
| `Medication.ingredient[0].strength.denominator.value` | `Medication.ingredient[2].strength.denominator.value` | `1` |
| `Medication.ingredient[0].strength.numerator.unit` | `Medication.ingredient[3].strength.numerator.unit` | `mg` |
| `Medication.ingredient[0].strength.numerator.value` | `Medication.ingredient[4].strength.numerator.value` | `100` |
| `Medication.resourceType` | `Medication.resourceType` | `Medication` |
