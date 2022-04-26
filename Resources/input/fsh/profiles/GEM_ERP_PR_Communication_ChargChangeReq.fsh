Profile: GEM_ERP_PR_Communication_ChargChangeReq
Parent: Communication
Id: GEM-ERP-PR-Communication-ChargChangeReq
Title: "Request for Modification on ChargeItem"
Description: "Ressource used for the communication of Change Request on an existing ChargeItem between patient and pharmacy"
* ^meta.lastUpdated = "2022-04-16T13:43:30.128+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_ChargChangeReq"
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
* recipient.identifier only IdentifierTelematikId
* sender MS
* sender.identifier 1..1
* sender.identifier only $identifier-kvid-10 or $identifier-pkv
* payload 0..1
* payload.content[x] only string

Instance: Communication_ChargChangeRequest
InstanceOf: GEM_ERP_PR_Communication_ChargChangeReq
Title: "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
Usage: #example
* id = "b4cf7f71-3ade-40ab-97a9-929f95af29f2"
* meta.profile[+] = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_ChargChangeReq|1.2"
* meta.tag.display = "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
* basedOn.reference = "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8"
* status = #unknown
* recipient[+].identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* sender.identifier.value = "X234567890"
* sent = "2020-04-29T13:43:30.128+02:00"
* payload.contentString = "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."