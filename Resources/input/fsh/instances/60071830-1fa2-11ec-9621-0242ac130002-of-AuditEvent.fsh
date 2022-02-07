Instance: 60071830-1fa2-11ec-9621-0242ac130002-of-AuditEvent
InstanceOf: AuditEvent
Usage: #example
* id = "60071830-1fa2-11ec-9621-0242ac130002"
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxAuditEvent|1.1.0"
* meta.tag.display = "Beispiel Zugriffsprotokoll zur Anzeige in der App"
* type = $audit-event-type#rest
* subtype = $restful-interaction#read
* action = #R
* recorded = "2020-02-27T08:04:27.434+00:00"
* outcome = #0
* agent.type = $extra-security-role-type#humanuser "Human User"
* agent.who.identifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
* agent.who.identifier.value = "X110488588"
* agent.name = "Annika Gräfin Lüneburg"
* agent.requestor = false
* source.site = "E-Rezept Fachdienst"
* source.observer = Reference(1)
* entity.what = Reference(Task/42)
* entity.name = "X110488588"
* entity.description = "+"