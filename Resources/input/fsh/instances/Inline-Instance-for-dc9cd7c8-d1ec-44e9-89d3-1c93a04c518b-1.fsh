Instance: Inline-Instance-for-dc9cd7c8-d1ec-44e9-89d3-1c93a04c518b-1
InstanceOf: Task
Usage: #inline
* id = "160.000.033.491.362.26"
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxTask|1.1.0"
* extension[0].url = "https://gematik.de/fhir/StructureDefinition/PrescriptionType"
* extension[=].valueCoding = $Flowtype#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* extension[+].url = "https://gematik.de/fhir/StructureDefinition/ExpiryDate"
* extension[=].valueDate = "2021-12-08"
* extension[+].url = "https://gematik.de/fhir/StructureDefinition/AcceptDate"
* extension[=].valueDate = "2021-10-07"
* identifier[0].use = #official
* identifier[=].system = "https://gematik.de/fhir/NamingSystem/PrescriptionID"
* identifier[=].value = "160.000.033.491.362.26"
* identifier[+].use = #official
* identifier[=].system = "https://gematik.de/fhir/NamingSystem/AccessCode"
* identifier[=].value = "e7bf6bc2345657876e3353a1c5351e8eaf96035ed8765d98fa9fc3b7ade76549"
* identifier[+].use = #official
* identifier[=].system = "https://gematik.de/fhir/NamingSystem/Secret"
* identifier[=].value = "d9b546982bc9870f4c6aeb36485496d822a9ea5635eebb266a8b531de58cc241"
* status = #in-progress
* intent = #order
* for.identifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
* for.identifier.value = "X123456789"
* authoredOn = "2021-09-07T09:41:01.714+00:00"
* lastModified = "2021-09-07T09:44:12.423+00:00"
* performerType = urn:ietf:rfc:3986#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* performerType.text = "Öffentliche Apotheke"
* input[0].type = $Documenttype#1
* input[=].valueReference = Reference(Bundle/88d1183e-204b-11ec-9621-0242ac130002)
* input[+].type = $Documenttype#2
* input[=].valueReference = Reference(Bundle/910ea458-204b-11ec-9621-0242ac130002)