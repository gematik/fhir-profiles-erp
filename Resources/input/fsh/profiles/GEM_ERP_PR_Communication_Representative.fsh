Profile: GEM_ERP_PR_Communication_Representative
Parent: Communication
Id: GEM-ERP-PR-Communication-Representative
Title: "Communication between Patient and Representative"
Description: "Ressource used for the communication between patients and their representative pertaining to an ePrescription"
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative"
* ^version = "1.2"
* ^status = #active
* ^date = "2020-04-16T13:43:27.7930941+00:00"
* ^abstract = true
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative|1.2" (exactly)
* basedOn 1..1 MS
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1.. MS
* status = #unknown (exactly)
* sent MS
* received MS
* recipient 1..1 MS
* recipient.identifier 1.. MS
* recipient.identifier only $identifier-kvid-10 or $identifier-pkv
* sender MS
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1.. MS
* sender.identifier only $identifier-kvid-10 or $identifier-pkv
* payload 1..1 MS
* payload.content[x] only string