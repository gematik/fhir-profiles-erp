Instance: 01eb76d8-13e9-24c0-bda6-f62b2a8aedac
InstanceOf: Communication
Usage: #example
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxCommunicationReply|1.1.0"
* meta.tag = #patient-provider "Antwort der Apotheke mit der Bitte um Rückruf"
* basedOn = Reference(Task/4711)
* status = #unknown
* topic = $communication-topic#phone-consult "Phone consult"
* topic.text = "Bitte rufen sie zurück!"
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