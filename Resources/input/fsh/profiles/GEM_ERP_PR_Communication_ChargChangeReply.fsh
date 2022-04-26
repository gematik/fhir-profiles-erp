Profile: GEM_ERP_PR_Communication_ChargChangeReply
Parent: Communication
Id: GEM-ERP-PR-Communication-ChargChangeReply
Title: "Reply on change Request on ChargeItem from pharmacy to Patient"
Description: "Ressource used for the communication to reply to a change request on a ChargeItem"
* ^meta.lastUpdated = "2022-04-16T13:43:30.128+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_ChargChangeReply"
* ^version = "1.2"
* ^status = #draft
* ^date = "2022-04-16T13:43:27.7930941+00:00"
* ^abstract = true
* basedOn 1..1
* basedOn only Reference(GEM_ERP_PR_ChargeItem)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1..1
* status = #unknown (exactly)
* sent MS
* received MS
* recipient 1..1
* recipient.identifier 1..1
* recipient.identifier only $identifier-kvid-10 or $identifier-pkv
* sender 1..1
* sender.identifier 1..1
* sender.identifier only IdentifierTelematikId
* payload 0..1
* payload.content[x] only string

Instance: Communication_ChargChangeReply
InstanceOf: GEM_ERP_PR_Communication_ChargChangeReply
Title: "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
Usage: #example
* id = "3bbc2209-9c23-4553-986e-a5c9f69a39fb"
* meta.profile[+] = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_ChargChangeReply|1.2"
* meta.tag.display = "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
* basedOn.reference = "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8"
* status = #unknown
* sender.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* sender.identifier.value = "3-SMC-B-Testkarte-883110000123465"
* recipient[+].identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* recipient[=].identifier.value = "X234567890"
* sent = "2020-04-29T13:46:30.128+02:00"
* payload.contentString = "Erledigt."