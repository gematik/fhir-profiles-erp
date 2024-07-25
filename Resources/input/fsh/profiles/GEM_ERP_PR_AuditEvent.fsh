Profile: GEM_ERP_PR_AuditEvent
Parent: AuditEvent
Id: GEM-ERP-PR-AuditEvent
Title: "AuditEvent for Logging of ePrescription Access"
* insert Profile(GEM_ERP_PR_AuditEvent)
* ^meta.lastUpdated = "2020-04-16T13:41:55.87+00:00"
* type.system 1..
* type.system = "http://terminology.hl7.org/CodeSystem/audit-event-type" (exactly)
* type.system ^code.system = "http://terminology.hl7.org/CodeSystem/audit-event-type"
* type.system ^code.display = "rest"
* type.code 1..
* type.code = #rest (exactly)
* subtype 1..1
* action 1..
* outcome 1..
* agent.type 1..
* agent.who.identifier 1..
* agent.who.identifier only IdentifierTelematikId or $identifier-kvid-10
* agent.name 1..
* source.site 1..
* source.site = "E-Rezept Fachdienst" (exactly)
* source.observer only Reference(Device)
* source.observer.reference 1..
* entity 1..1
* entity.what 1..
// * entity.what only Reference(GEM_ERP_PR_MedicationDispense or GEM_ERP_PR_Task or https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent or https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_ChargeItem)
* entity.name 1..
* entity.name ^short = "KVNR of patient that the auditEvent refers to"
* entity.name ^definition = "KVNR of patient that the auditEvent refers to, used as filter criteria when patient accesses its data"
* entity.description 1..
* entity.description ^short = "PrescriptionID (RezeptID)"
* entity.description ^definition = "PrescriptionID (RezeptID) to have a relation to insurance company data when Task already deleted"
