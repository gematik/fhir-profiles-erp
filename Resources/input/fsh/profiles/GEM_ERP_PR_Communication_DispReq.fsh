Profile: Gem_erxCommunicationDispReq
Parent: Communication
Id: b1857842-8a68-11ec-a8a3-0242ac120002
Title: "Request for Dispense of ePrescription"
Description: "Ressource used for the communication of dispense request between patient/representative and provider based on ePrescription"
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^url = "https://gematik.de/fhir/StructureDefinition/ErxCommunicationDispReq"
* ^version = "1.1.1"
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
* recipient.identifier only Gem_baseTelematikID
* sender MS
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1.. MS
* sender.identifier only $identifier-kvid-10
* payload 1..1 MS
* payload.extension ^slicing.discriminator.type = #value
* payload.extension ^slicing.discriminator.path = "url"
* payload.extension ^slicing.rules = #open
* payload.extension contains InsuranceProvider named InsuranceProvider 0..1
* payload.content[x] only string