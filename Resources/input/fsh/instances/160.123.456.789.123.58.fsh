Instance: 160.123.456.789.123.58
InstanceOf: Task
Usage: #example
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxTask|1.1.0"
* meta.tag.display = "Example Task with status in-progress which means it has been accepted by a pharmacy."
* extension[0].url = "https://gematik.de/fhir/StructureDefinition/PrescriptionType"
* extension[=].valueCoding = $Flowtype#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* extension[+].url = "https://gematik.de/fhir/StructureDefinition/AcceptDate"
* extension[=].valueDate = "2020-03-02"
* extension[+].url = "https://gematik.de/fhir/StructureDefinition/ExpiryDate"
* extension[=].valueDate = "2020-05-02"
* identifier[0].use = #official
* identifier[=].system = "https://gematik.de/fhir/NamingSystem/PrescriptionID"
* identifier[=].value = "160.123.456.789.123.58"
* identifier[+].use = #official
* identifier[=].system = "https://gematik.de/fhir/NamingSystem/AccessCode"
* identifier[=].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[+].use = #official
* identifier[=].system = "https://gematik.de/fhir/NamingSystem/Secret"
* identifier[=].value = "c36ca26502892b371d252c99b496e31505ff449aca9bc69e231c58148f6233cf"
* status = #in-progress
* intent = #order
* for.identifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
* for.identifier.value = "X123456789"
* authoredOn = "2020-03-02T08:25:05+00:00"
* lastModified = "2020-03-02T08:45:05+00:00"
* performerType = urn:ietf:rfc:3986#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* input.type = $Documenttype#1 "Health Care Provider Prescription"
* input.valueReference = Reference(4ae762d2-203f-11ec-9621-0242ac130002)