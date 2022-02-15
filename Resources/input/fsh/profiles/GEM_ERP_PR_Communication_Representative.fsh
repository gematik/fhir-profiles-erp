Profile: Gem_erxCommunicationRepresentative
Parent: Communication
Id: GEM-ERP-PR-Communication-Representative
Title: "Communication between Patient and Representative"
Description: "Ressource used for the communication between patients and their representative pertaining to an ePrescription"
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/ErxCommunicationRepresentative"
* ^version = "1.2"
* ^status = #draft
* ^date = "2020-04-16T13:43:27.7930941+00:00"
* ^abstract = true
* basedOn 1..1 MS
* basedOn only Reference(Gem_erxTask)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1.. MS
* status = #unknown (exactly)
* sent MS
* received MS
* recipient 1..1 MS
* recipient.identifier 1.. MS
* recipient.identifier only $identifier-kvid-10
* sender MS
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1.. MS
* sender.identifier only $identifier-kvid-10
* payload 1..1 MS
* payload.content[x] only string