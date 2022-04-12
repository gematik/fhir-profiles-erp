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