Profile: GEM_ERP_PR_AuditEvent
Parent: AuditEvent
Id: GEM-ERP-PR-AuditEvent
Title: "AuditEvent for Logging of ePrescription Access"
* insert Profile(GEM_ERP_PR_AuditEvent)

* type MS
  * system 1..1
  * system = "http://terminology.hl7.org/CodeSystem/audit-event-type" (exactly)
  * code 1..1
  * code = #rest (exactly)

* subtype 1..1
* action 1..1
* outcome 1..1

* agent MS
  * type 1..1
  * who.identifier 1..1
  * who.identifier only IdentifierTelematikId or IdentifierKvid10
  * name 1..1

* source MS
  * site 1..1
  * site = "E-Rezept Fachdienst" (exactly)
  * observer only Reference(Device)
  * observer.reference 1..1

* entity 1..1 MS
  * what 1..1
  * name 1..1
    * ^short = "KVNR of patient that the auditEvent refers to"
    * ^definition = "KVNR of patient that the auditEvent refers to, used as filter criteria when patient accesses its data"
  * description 1..1
    * ^short = "PrescriptionID (RezeptID)"
    * ^definition = "PrescriptionID (RezeptID) to have a relation to insurance company data when Task already deleted"
