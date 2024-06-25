
Instance: Communication_Reply
InstanceOf: GEM_ERP_PR_Communication_Reply
Title: "Communication message sent by pharmacy to patient in response to a previous Task-related message"
Usage: #example
* id = "7977a4ab-97a9-4d95-afb3-6c4c1e2ac596"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_Reply)
* meta.tag.display = "Communication message sent by pharmacy to patient in response to a previous Task-related message"
* basedOn.reference = "Task/160.000.033.491.280.78"
* status = #unknown
* sender.identifier.system = $identifier-telematik-id
* sender.identifier.value = "3-SMC-B-Testkarte-883110000123465"
* recipient[+].identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* recipient[=].identifier.value = "X234567890"
* sent = "2020-04-29T13:46:30.128+02:00"
* payload.extension[AvailabilityStatus].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AvailabilityState"
* payload.extension[AvailabilityStatus].valueCoding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus"
* payload.extension[AvailabilityStatus].valueCoding.code = #20
* payload.extension[OfferedSupplyOptions].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SupplyOptionsType"
* payload.extension[OfferedSupplyOptions].extension[onPremise].url = "onPremise"
* payload.extension[OfferedSupplyOptions].extension[onPremise].valueBoolean = true
* payload.extension[OfferedSupplyOptions].extension[shipment].url = "shipment"
* payload.extension[OfferedSupplyOptions].extension[shipment].valueBoolean = false
* payload.extension[OfferedSupplyOptions].extension[delivery].url = "delivery"
* payload.extension[OfferedSupplyOptions].extension[delivery].valueBoolean = true
* payload.contentString = "Eisern"
