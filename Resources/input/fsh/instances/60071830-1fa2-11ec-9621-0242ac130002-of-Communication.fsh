Instance: 60071830-1fa2-11ec-9621-0242ac130002-of-Communication
InstanceOf: Communication
Usage: #example
* id = "60071830-1fa2-11ec-9621-0242ac130002"
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxCommunicationReply|1.1.0"
* meta.tag = #patient-provider "Antwort der Apotheke zur Belieferfaehigkeit eines Rezepts Task/160.000.000.017.271.42 an die E-Rezept-App"
* basedOn = Reference(Task/160.000.000.017.271.42)
* status = #unknown
* sent = "2020-03-12T18:01:10+00:00"
* recipient.identifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
* recipient.identifier.value = "X234567890"
* sender.identifier.system = "https://gematik.de/fhir/NamingSystem/TelematikID"
* sender.identifier.value = "3-abc-1234567890"
* payload.extension[0].url = "https://gematik.de/fhir/StructureDefinition/SupplyOptionsType"
* payload.extension[=].extension[0].url = "onPremise"
* payload.extension[=].extension[=].valueBoolean = true
* payload.extension[=].extension[+].url = "delivery"
* payload.extension[=].extension[=].valueBoolean = true
* payload.extension[=].extension[+].url = "shipment"
* payload.extension[=].extension[=].valueBoolean = true
* payload.extension[+].url = "https://gematik.de/fhir/StructureDefinition/AvailabilityStatus"
* payload.extension[=].valueCoding = $AvailabilityStatus#10
* payload.contentString = "Hallo, wir haben das Medikament vorraetig. Kommen Sie gern in die Filiale oder wir schicken einen Boten."