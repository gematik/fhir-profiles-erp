Instance: Communication_Reply_Pharmacy
InstanceOf: GEM_ERP_PR_Communication_Reply
Title: "Communication message sent by pharmacy to patient in response to a previous Task-related message"
Usage: #example
* id = "7977a4ab-97a9-4d95-afb3-6c4c1e2ac596"
* meta.tag[+].display = "Reply from Pharmacy to Patient"
* meta.tag[+].display = "Communication message sent by pharmacy to patient in response to a previous Task-related message"
* basedOn.reference = "Task/160.000.033.491.280.78"
* status = #unknown
* sender.identifier.system = $identifier-telematik-id
* sender.identifier.value = "3-SMC-B-Testkarte-883110000123465"
* recipient.identifier.system = $identifier-kvid-10
* recipient.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
* payload.extension[AvailabilityStatus]
  * url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AvailabilityState"
  * valueCoding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus"
  * valueCoding.code = #20
* payload.extension[OfferedSupplyOptions]
  * url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SupplyOptionsType"
  * extension[onPremise].valueBoolean = true
  * extension[shipment].valueBoolean = false
  * extension[delivery].valueBoolean = true
* payload.contentString = "Eisern"
