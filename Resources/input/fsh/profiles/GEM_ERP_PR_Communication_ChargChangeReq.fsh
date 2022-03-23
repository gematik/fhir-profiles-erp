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
* sender.identifier only $identifier-kvid-10
* payload 0..0