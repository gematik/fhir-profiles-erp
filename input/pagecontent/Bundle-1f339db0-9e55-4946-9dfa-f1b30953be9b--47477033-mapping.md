## Bundle → Parameters Mapping

### Verordnungskennung

| KBV Pfad | Parameters Pfad | Wert |
| --- | --- | --- |
| — | `Parameters.parameter[rxPrescription].part[prescriptionId].name` | `prescriptionId` |
| `Bundle.identifier.system` | `Parameters.parameter[rxPrescription].part[prescriptionId].valueIdentifier.system` | `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId` |
| `Bundle.identifier.value` | `Parameters.parameter[rxPrescription].part[prescriptionId].valueIdentifier.value` | `160.100.000.000.037.28` |

### Ausstellungsdatum

*Keine Daten vorhanden.*

### KBV MedicationRequest → EPA MedicationRequest

| KBV Pfad | Parameters Pfad | Wert |
| --- | --- | --- |
| `MedicationRequest.authoredOn` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.authoredOn` | `2024-05-20` |
| `MedicationRequest.dispenseRequest.quantity.unit` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.dispenseRequest.quantity.unit` | `Packung` |
| `MedicationRequest.dispenseRequest.quantity.value` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.dispenseRequest.quantity.value` | `1` |
| `MedicationRequest.id` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.id` | `43c2b7ae-ad11-4387-910a-e6b7a3c38d4f` |
| `MedicationRequest.insurance[0].reference` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.insurance[0].reference` | `Coverage/1b89236c-ab14-4e92-937e-5af0b59d0cd4` |
| `MedicationRequest.intent` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.intent` | `order` |
| `MedicationRequest.medicationReference.reference` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.medicationReference.reference` | `Medication/5ff1bd22-ce14-484e-be56-d2ba4adeac31` |
| `MedicationRequest.requester.reference` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.requester.reference` | `Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c` |
| `MedicationRequest.resourceType` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.resourceType` | `MedicationRequest` |
| `MedicationRequest.status` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.status` | `active` |
| `MedicationRequest.subject.reference` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.subject.reference` | `Patient/93866fdc-3e50-4902-a7e9-891b54737b5e` |
| `MedicationRequest.substitution.allowedBoolean` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.substitution.allowedBoolean` | `true` |

### KBV Organization → EPA Organization

| KBV Pfad | Parameters Pfad | Wert |
| --- | --- | --- |
| `Organization.address[0]._line[0].extension[0].url` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` |
| `Organization.address[0]._line[0].extension[0].valueString` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[0].extension[0].valueString` | `2` |
| `Organization.address[0]._line[0].extension[1].url` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[0].extension[1].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` |
| `Organization.address[0]._line[0].extension[1].valueString` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[0].extension[1].valueString` | `Herbert-Lewin-Platz` |
| `Organization.address[0]._line[1].extension[0].url` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[1].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator` |
| `Organization.address[0]._line[1].extension[0].valueString` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[1].extension[0].valueString` | `Erdgeschoss` |
| `Organization.address[0].city` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].city` | `Berlin` |
| `Organization.address[0].country` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].country` | `D` |
| `Organization.address[0].line[0]` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].line[0]` | `Herbert-Lewin-Platz 2` |
| `Organization.address[0].line[1]` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].line[1]` | `Erdgeschoss` |
| `Organization.address[0].postalCode` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].postalCode` | `10623` |
| `Organization.address[0].type` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].type` | `both` |
| `Organization.id` | `Parameters.parameter[rxPrescription].part[organization].resource.id` | `2a555cd3-0543-483c-88b3-f68647620962` |
| `Organization.identifier[0].system` | `Parameters.parameter[rxPrescription].part[organization].resource.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR` |
| `Organization.identifier[0].type.coding[0].code` | `Parameters.parameter[rxPrescription].part[organization].resource.identifier[0].type.coding[0].code` | `BSNR` |
| `Organization.identifier[0].type.coding[0].system` | `Parameters.parameter[rxPrescription].part[organization].resource.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Organization.identifier[0].value` | `Parameters.parameter[rxPrescription].part[organization].resource.identifier[0].value` | `724444400` |
| `Organization.name` | `Parameters.parameter[rxPrescription].part[organization].resource.name` | `Hausarztpraxis` |
| `Organization.resourceType` | `Parameters.parameter[rxPrescription].part[organization].resource.resourceType` | `Organization` |
| `Organization.telecom[0].system` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[0].system` | `phone` |
| `Organization.telecom[0].value` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[0].value` | `030321654987` |
| `Organization.telecom[1].system` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[1].system` | `email` |
| `Organization.telecom[1].value` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[1].value` | `hausarztpraxis@e-mail.de` |

### KBV Practitioner → EPA Practitioner

| KBV Pfad | Parameters Pfad | Wert |
| --- | --- | --- |
| `Practitioner.id` | `Parameters.parameter[rxPrescription].part[practitioner].resource.id` | `d6f3b55d-3095-4655-96dc-da3bec21271c` |
| `Practitioner.identifier[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` |
| `Practitioner.identifier[0].type.coding[0].code` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[0].type.coding[0].code` | `LANR` |
| `Practitioner.identifier[0].type.coding[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Practitioner.identifier[0].value` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[0].value` | `754236701` |
| `Practitioner.identifier[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[1].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` |
| `Practitioner.identifier[0].type.coding[0].code` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[1].type.coding[0].code` | `LANR` |
| `Practitioner.identifier[0].type.coding[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[1].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Practitioner.identifier[0].value` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[1].value` | `754236701` |
| `Practitioner.name[0]._family.extension[0].url` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._family.extension[0].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-name` |
| `Practitioner.name[0]._family.extension[0].valueString` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._family.extension[0].valueString` | `Schulz` |
| `Practitioner.name[0].family` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0].family` | `Schulz` |
| `Practitioner.name[0].given[0]` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0].given[0]` | `Ben` |
| `Practitioner.name[0].use` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0].use` | `official` |
| `Practitioner.qualification[1].code.coding[0].code` | `Parameters.parameter[rxPrescription].part[practitioner].resource.qualification[0].code.coding[0].code` | `Berufsbezeichnung` |
| `Practitioner.qualification[1].code.coding[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.qualification[0].code.coding[0].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung` |
| `Practitioner.qualification[1].code.text` | `Parameters.parameter[rxPrescription].part[practitioner].resource.qualification[0].code.text` | `Facharzt für Allgemeinmedizin` |
| `Practitioner.resourceType` | `Parameters.parameter[rxPrescription].part[practitioner].resource.resourceType` | `Practitioner` |

### KBV Medication → EPA Medication

*Keine Daten vorhanden.*
