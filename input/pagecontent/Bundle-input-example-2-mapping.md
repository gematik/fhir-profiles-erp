## Bundle → Parameters Mapping

> Quelle: [KBV Bundle](Bundle-input-example-2.html)
> Ziel: [EPA Provide Parameters](Parameters-output-example-2.html)

### Verordnungskennung

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| — | `Parameters.prescriptionId.name` | `prescriptionId` |
| `Bundle.identifier.system` | `Parameters.prescriptionId.valueIdentifier.system` | `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId` |
| `Bundle.identifier.value` | `Parameters.prescriptionId.valueIdentifier.value` | `160.100.000.000.019.82` |

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
| `MedicationRequest.dosageInstruction[0].text` | `MedicationRequest.dosageInstruction[0].text` | `1-0-0-0` |
| `MedicationRequest.id` | `MedicationRequest.id` | `4a7eefdd-df71-4a72-8047-c158017534a1` |
| `MedicationRequest.insurance[0].reference` | `MedicationRequest.insurance[0].reference` | `Coverage/da80211e-61ee-458e-a651-87370b6ec30c` |
| `MedicationRequest.intent` | `MedicationRequest.intent` | `order` |
| `MedicationRequest.medicationReference.reference` | `MedicationRequest.medicationReference.reference` | `Medication/86fa62c7-06a0-418e-ba26-e99baa053c07` |
| `MedicationRequest.note[0].text` | `MedicationRequest.note[0].text` | `Bitte längliche Tabletten, da Patient Probleme mit dem Schlucken von runden hat.` |
| `MedicationRequest.requester.reference` | `MedicationRequest.requester.reference` | `Practitioner/bc329f24-3d65-4286-bf06-b54dd6cad655` |
| `MedicationRequest.resourceType` | `MedicationRequest.resourceType` | `MedicationRequest` |
| `MedicationRequest.status` | `MedicationRequest.status` | `active` |
| `MedicationRequest.subject.reference` | `MedicationRequest.subject.reference` | `Patient/ce4104af-b86b-4664-afee-1b5fc3ac8acf` |

### KBV Organization → EPA Organization

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| `Organization.address[0]._line[0].extension[0].url` | `Organization.address[0]._line[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` |
| `Organization.address[0]._line[0].extension[0].valueString` | `Organization.address[0]._line[0].extension[0].valueString` | `2` |
| `Organization.address[0]._line[0].extension[1].url` | `Organization.address[0]._line[0].extension[1].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` |
| `Organization.address[0]._line[0].extension[1].valueString` | `Organization.address[0]._line[0].extension[1].valueString` | `Herbert-Lewin-Platz` |
| `Organization.address[0].city` | `Organization.address[0].city` | `Berlin` |
| `Organization.address[0].country` | `Organization.address[0].country` | `D` |
| `Organization.address[0].line[0]` | `Organization.address[0].line[0]` | `Herbert-Lewin-Platz 2` |
| `Organization.address[0].postalCode` | `Organization.address[0].postalCode` | `10623` |
| `Organization.address[0].type` | `Organization.address[0].type` | `both` |
| `Organization.id` | `Organization.id` | `5d3f4ac0-2b44-4d48-b363-e63efa72973b` |
| `Organization.identifier[0].system` | `Organization.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR` |
| `Organization.identifier[0].type.coding[0].code` | `Organization.identifier[0].type.coding[0].code` | `BSNR` |
| `Organization.identifier[0].type.coding[0].system` | `Organization.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Organization.identifier[0].value` | `Organization.identifier[0].value` | `721111100` |
| `Organization.name` | `Organization.name` | `MVZ` |
| `Organization.resourceType` | `Organization.resourceType` | `Organization` |
| `Organization.telecom[0].system` | `Organization.telecom[0].system` | `phone` |
| `Organization.telecom[0].value` | `Organization.telecom[0].value` | `0301234567` |
| `Organization.telecom[1].system` | `Organization.telecom[1].system` | `fax` |
| `Organization.telecom[1].value` | `Organization.telecom[1].value` | `030123456789` |
| `Organization.telecom[2].system` | `Organization.telecom[2].system` | `email` |
| `Organization.telecom[2].value` | `Organization.telecom[2].value` | `mvz@e-mail.de` |

### KBV Practitioner → EPA Practitioner

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| `Practitioner.id` | `Practitioner.id` | `bc329f24-3d65-4286-bf06-b54dd6cad655` |
| `Practitioner.identifier[0].system` | `Practitioner.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` |
| `Practitioner.identifier[0].type.coding[0].code` | `Practitioner.identifier[0].type.coding[0].code` | `LANR` |
| `Practitioner.identifier[0].type.coding[0].system` | `Practitioner.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Practitioner.identifier[0].value` | `Practitioner.identifier[0].value` | `123456628` |
| `Practitioner.name[0]._family.extension[0].url` | `Practitioner.name[0]._family.extension[0].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-prefix` |
| `Practitioner.name[0]._family.extension[0].valueString` | `Practitioner.name[0]._family.extension[0].valueString` | `von` |
| `Practitioner.name[0]._family.extension[1].url` | `Practitioner.name[0]._family.extension[1].url` | `http://fhir.de/StructureDefinition/humanname-namenszusatz` |
| `Practitioner.name[0]._family.extension[1].valueString` | `Practitioner.name[0]._family.extension[1].valueString` | `Freiherr` |
| `Practitioner.name[0]._family.extension[2].url` | `Practitioner.name[0]._family.extension[2].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-name` |
| `Practitioner.name[0]._family.extension[2].valueString` | `Practitioner.name[0]._family.extension[2].valueString` | `Müller` |
| `Practitioner.name[0]._prefix[0].extension[0].url` | `Practitioner.name[0]._prefix[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier` |
| `Practitioner.name[0]._prefix[0].extension[0].valueCode` | `Practitioner.name[0]._prefix[0].extension[0].valueCode` | `AC` |
| `Practitioner.name[0].family` | `Practitioner.name[0].family` | `Freiherr von Müller` |
| `Practitioner.name[0].given[0]` | `Practitioner.name[0].given[0]` | `Paul` |
| `Practitioner.name[0].prefix[0]` | `Practitioner.name[0].prefix[0]` | `Dr. med.` |
| `Practitioner.name[0].use` | `Practitioner.name[0].use` | `official` |
| `Practitioner.qualification[1].code.coding[0].code` | `Practitioner.qualification[0].code.coding[0].code` | `Berufsbezeichnung` |
| `Practitioner.qualification[1].code.coding[0].system` | `Practitioner.qualification[0].code.coding[0].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung` |
| `Practitioner.qualification[1].code.text` | `Practitioner.qualification[0].code.text` | `Facharzt für Innere Medizin: Kardiologie` |
| `Practitioner.resourceType` | `Practitioner.resourceType` | `Practitioner` |

### KBV Medication → EPA Medication

| KBV Pfad | EPA Pfad | Wert |
| --- | --- | --- |
| `Medication.amount.denominator.value` | `Medication.amount.denominator.value` | `1` |
| `Medication.amount.numerator.unit` | `Medication.amount.numerator.unit` | `Stück` |
| `Medication.code.coding[0].code` | `Medication.code.coding[0].code` | `wirkstoff` |
| `Medication.code.coding[0].system` | `Medication.code.coding[0].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type` |
| `Medication.form.text` | `Medication.form.text` | `Tabletten` |
| `Medication.id` | `Medication.id` | `86fa62c7-06a0-418e-ba26-e99baa053c07` |
| `Medication.ingredient[0].itemCodeableConcept.coding[0].code` | `Medication.ingredient[0].itemCodeableConcept.coding[0].code` | `22686` |
| `Medication.ingredient[0].itemCodeableConcept.coding[0].system` | `Medication.ingredient[0].itemCodeableConcept.coding[0].system` | `http://fhir.de/CodeSystem/ask` |
| `Medication.ingredient[0].itemCodeableConcept.coding[0].code` | `Medication.ingredient[1].itemCodeableConcept.coding[0].code` | `22686` |
| `Medication.ingredient[0].itemCodeableConcept.coding[0].system` | `Medication.ingredient[2].itemCodeableConcept.coding[0].system` | `http://fhir.de/CodeSystem/ask` |
| `Medication.ingredient[0].itemCodeableConcept.text` | `Medication.ingredient[3].itemCodeableConcept.text` | `Ramipril` |
| `Medication.amount.numerator.unit` | `Medication.ingredient[4].strength.denominator.unit` | `Stück` |
| `Medication.amount.denominator.value` | `Medication.ingredient[5].strength.denominator.value` | `1` |
| `Medication.ingredient[0].strength.numerator.unit` | `Medication.ingredient[6].strength.numerator.unit` | `mg` |
| `Medication.ingredient[0].strength.numerator.value` | `Medication.ingredient[7].strength.numerator.value` | `5` |
| `Medication.resourceType` | `Medication.resourceType` | `Medication` |
