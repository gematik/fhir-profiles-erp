
Instance: AuditEventSample
InstanceOf: GEM_ERP_PR_AuditEvent
Title: "AuditEvent entry generated by E-Rezept-Backend-Service on access to any patient data by any person"
Usage: #example
* id = "9361863d-fec0-4ba9-8776-7905cf1b0cfa"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_AuditEvent)
* meta.tag.display = "AuditEvent entry generated by E-Rezept-Backend-Service on access to any patient data by any person"
* text.status = #generated
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml' lang='de' xml:lang='de'>Praxis Dr. Müller, Bahnhofstr. 78 hat ein E-Rezept 160.123.456.789.123.58 eingestellt</div>"
* type.system = "http://terminology.hl7.org/CodeSystem/audit-event-type"
* type.code = #rest
* subtype[+].system = "http://hl7.org/fhir/restful-interaction"
* subtype[=].code = #create
* language = #de
* action = #C
* recorded = "2022-04-27T08:04:27.434+00:00"
* outcome = #0
* agent[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
* agent[=].type.coding[=].code = #humanuser
* agent[=].type.coding[=].display = "Human User"
* agent[=].who.identifier.system = $identifier-telematik-id
* agent[=].who.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* agent[=].name = "Praxis Dr. Müller"
* agent[=].requestor = false
* source.site = "E-Rezept Fachdienst"
* source.observer.reference = "Device/1"
* entity[+].what.reference = "https://erp.app.ti-dienste.de/Task/160.123.456.789.123.58"
* entity[=].what.identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* entity[=].what.identifier.value = "160.123.456.789.123.58"
* entity[=].name = "X234567890"
* entity[=].description = "160.123.456.789.123.58"