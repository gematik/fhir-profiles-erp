Instance: GOFSH-GENERATED-ID-1
InstanceOf: Communication
Usage: #example
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxCommunicationInfoReq|1.1.0"
* meta.tag = #patient-provider "Informative und Freitext-Anfrage zur Belieferfaehigkeit eines Rezepts Task/160.000.000.017.271.42 über die E-Rezept-App"
* contained = Inline-Instance-for-GOFSH-GENERATED-ID-1-1
* basedOn = Reference(Task/160.000.000.017.271.42)
* status = #unknown
* about = Reference(5fe6e06c-8725-46d5-aecd-e65e041ca3de)
* sent = "2020-03-12T18:01:10+00:00"
* recipient.identifier.system = "https://gematik.de/fhir/NamingSystem/TelematikID"
* recipient.identifier.value = "3-abc-1234567890"
* sender.identifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
* sender.identifier.value = "X234567890"
* payload.extension[0].url = "https://gematik.de/fhir/StructureDefinition/InsuranceProvider"
* payload.extension[=].valueIdentifier.system = "http://fhir.de/NamingSystem/arge-ik/iknr"
* payload.extension[=].valueIdentifier.value = "104212059"
* payload.extension[+].url = "https://gematik.de/fhir/StructureDefinition/SupplyOptionsType"
* payload.extension[=].extension[0].url = "onPremise"
* payload.extension[=].extension[=].valueBoolean = true
* payload.extension[=].extension[+].url = "delivery"
* payload.extension[=].extension[=].valueBoolean = true
* payload.extension[=].extension[+].url = "shipment"
* payload.extension[=].extension[=].valueBoolean = false
* payload.extension[+].url = "https://gematik.de/fhir/StructureDefinition/SubstitutionAllowedType"
* payload.extension[=].valueBoolean = true
* payload.extension[+].url = "https://gematik.de/fhir/StructureDefinition/PrescriptionType"
* payload.extension[=].valueCoding = $Flowtype#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* payload.contentString = "Hallo, ich wollte gern fragen, ob das Medikament bei Ihnen vorraetig ist."