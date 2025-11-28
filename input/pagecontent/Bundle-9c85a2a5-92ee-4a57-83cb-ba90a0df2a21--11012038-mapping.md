## Bundle → Parameters Mapping

### Verordnungskennung

| KBV Pfad | Parameters Pfad | Wert |
| --- | --- | --- |
| — | `Parameters.parameter[rxPrescription].part[prescriptionId].name` | `prescriptionId` |
| `Bundle.identifier.system` | `Parameters.parameter[rxPrescription].part[prescriptionId].valueIdentifier.system` | `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId` |
| `Bundle.identifier.value` | `Parameters.parameter[rxPrescription].part[prescriptionId].valueIdentifier.value` | `160.100.000.000.019.82` |

### Ausstellungsdatum

*Keine Daten vorhanden.*

### KBV MedicationRequest → EPA MedicationRequest

| KBV Pfad | Parameters Pfad | Wert |
| --- | --- | --- |
| `MedicationRequest.authoredOn` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.authoredOn` | `2024-05-20` |
| `MedicationRequest.dispenseRequest.quantity.unit` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.dispenseRequest.quantity.unit` | `Packung` |
| `MedicationRequest.dispenseRequest.quantity.value` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.dispenseRequest.quantity.value` | `1` |
| `MedicationRequest.dosageInstruction[0].text` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.dosageInstruction[0].text` | `1-0-0-0` |
| `MedicationRequest.id` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.id` | `4a7eefdd-df71-4a72-8047-c158017534a1` |
| `MedicationRequest.insurance[0].reference` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.insurance[0].reference` | `Coverage/da80211e-61ee-458e-a651-87370b6ec30c` |
| `MedicationRequest.intent` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.intent` | `order` |
| `MedicationRequest.medicationReference.reference` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.medicationReference.reference` | `Medication/86fa62c7-06a0-418e-ba26-e99baa053c07` |
| `MedicationRequest.note[0].text` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.note[0].text` | `Bitte längliche Tabletten, da Patient Probleme mit dem Schlucken von runden hat.` |
| `MedicationRequest.requester.reference` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.requester.reference` | `Practitioner/bc329f24-3d65-4286-bf06-b54dd6cad655` |
| `MedicationRequest.resourceType` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.resourceType` | `MedicationRequest` |
| `MedicationRequest.status` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.status` | `active` |
| `MedicationRequest.subject.reference` | `Parameters.parameter[rxPrescription].part[medicationRequest].resource.subject.reference` | `Patient/ce4104af-b86b-4664-afee-1b5fc3ac8acf` |

### KBV Organization → EPA Organization

| KBV Pfad | Parameters Pfad | Wert |
| --- | --- | --- |
| `Organization.address[0]._line[0].extension[0].url` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` |
| `Organization.address[0]._line[0].extension[0].valueString` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[0].extension[0].valueString` | `2` |
| `Organization.address[0]._line[0].extension[1].url` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[0].extension[1].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` |
| `Organization.address[0]._line[0].extension[1].valueString` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0]._line[0].extension[1].valueString` | `Herbert-Lewin-Platz` |
| `Organization.address[0].city` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].city` | `Berlin` |
| `Organization.address[0].country` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].country` | `D` |
| `Organization.address[0].line[0]` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].line[0]` | `Herbert-Lewin-Platz 2` |
| `Organization.address[0].postalCode` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].postalCode` | `10623` |
| `Organization.address[0].type` | `Parameters.parameter[rxPrescription].part[organization].resource.address[0].type` | `both` |
| `Organization.id` | `Parameters.parameter[rxPrescription].part[organization].resource.id` | `5d3f4ac0-2b44-4d48-b363-e63efa72973b` |
| `Organization.identifier[0].system` | `Parameters.parameter[rxPrescription].part[organization].resource.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR` |
| `Organization.identifier[0].type.coding[0].code` | `Parameters.parameter[rxPrescription].part[organization].resource.identifier[0].type.coding[0].code` | `BSNR` |
| `Organization.identifier[0].type.coding[0].system` | `Parameters.parameter[rxPrescription].part[organization].resource.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Organization.identifier[0].value` | `Parameters.parameter[rxPrescription].part[organization].resource.identifier[0].value` | `721111100` |
| `Organization.name` | `Parameters.parameter[rxPrescription].part[organization].resource.name` | `MVZ` |
| `Organization.resourceType` | `Parameters.parameter[rxPrescription].part[organization].resource.resourceType` | `Organization` |
| `Organization.telecom[0].system` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[0].system` | `phone` |
| `Organization.telecom[0].value` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[0].value` | `0301234567` |
| `Organization.telecom[1].system` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[1].system` | `fax` |
| `Organization.telecom[1].value` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[1].value` | `030123456789` |
| `Organization.telecom[2].system` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[2].system` | `email` |
| `Organization.telecom[2].value` | `Parameters.parameter[rxPrescription].part[organization].resource.telecom[2].value` | `mvz@e-mail.de` |

### KBV Practitioner → EPA Practitioner

| KBV Pfad | Parameters Pfad | Wert |
| --- | --- | --- |
| `Practitioner.id` | `Parameters.parameter[rxPrescription].part[practitioner].resource.id` | `bc329f24-3d65-4286-bf06-b54dd6cad655` |
| `Practitioner.identifier[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[0].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` |
| `Practitioner.identifier[0].type.coding[0].code` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[0].type.coding[0].code` | `LANR` |
| `Practitioner.identifier[0].type.coding[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[0].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Practitioner.identifier[0].value` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[0].value` | `123456628` |
| `Practitioner.identifier[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[1].system` | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` |
| `Practitioner.identifier[0].type.coding[0].code` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[1].type.coding[0].code` | `LANR` |
| `Practitioner.identifier[0].type.coding[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[1].type.coding[0].system` | `http://terminology.hl7.org/CodeSystem/v2-0203` |
| `Practitioner.identifier[0].value` | `Parameters.parameter[rxPrescription].part[practitioner].resource.identifier[1].value` | `123456628` |
| `Practitioner.name[0]._family.extension[0].url` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._family.extension[0].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-prefix` |
| `Practitioner.name[0]._family.extension[0].valueString` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._family.extension[0].valueString` | `von` |
| `Practitioner.name[0]._family.extension[1].url` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._family.extension[1].url` | `http://fhir.de/StructureDefinition/humanname-namenszusatz` |
| `Practitioner.name[0]._family.extension[1].valueString` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._family.extension[1].valueString` | `Freiherr` |
| `Practitioner.name[0]._family.extension[2].url` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._family.extension[2].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-name` |
| `Practitioner.name[0]._family.extension[2].valueString` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._family.extension[2].valueString` | `Müller` |
| `Practitioner.name[0]._prefix[0].extension[0].url` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._prefix[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier` |
| `Practitioner.name[0]._prefix[0].extension[0].valueCode` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0]._prefix[0].extension[0].valueCode` | `AC` |
| `Practitioner.name[0].family` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0].family` | `Freiherr von Müller` |
| `Practitioner.name[0].given[0]` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0].given[0]` | `Paul` |
| `Practitioner.name[0].prefix[0]` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0].prefix[0]` | `Dr. med.` |
| `Practitioner.name[0].use` | `Parameters.parameter[rxPrescription].part[practitioner].resource.name[0].use` | `official` |
| `Practitioner.qualification[1].code.coding[0].code` | `Parameters.parameter[rxPrescription].part[practitioner].resource.qualification[0].code.coding[0].code` | `Berufsbezeichnung` |
| `Practitioner.qualification[1].code.coding[0].system` | `Parameters.parameter[rxPrescription].part[practitioner].resource.qualification[0].code.coding[0].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung` |
| `Practitioner.qualification[1].code.text` | `Parameters.parameter[rxPrescription].part[practitioner].resource.qualification[0].code.text` | `Facharzt für Innere Medizin: Kardiologie` |
| `Practitioner.resourceType` | `Parameters.parameter[rxPrescription].part[practitioner].resource.resourceType` | `Practitioner` |

### KBV Medication → EPA Medication

*Keine Daten vorhanden.*
