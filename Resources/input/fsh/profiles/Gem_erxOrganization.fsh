Profile: Gem_erxOrganization
Parent: Organization
Id: 98685c6b-5513-41a6-97d3-d52d669b3cdf
Title: "Organization providing ePrescription Services"
* ^meta.lastUpdated = "2020-04-17T13:48:59.607+00:00"
* ^url = "https://gematik.de/fhir/StructureDefinition/ErxOrganization"
* ^version = "1.1.1"
* ^status = #draft
* ^date = "2020-04-17T13:48:55.8810522+00:00"
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains TelematikID 1..1 MS
* identifier[TelematikID] only Gem_baseTelematikID
* active 1..
* type 1..1
* type from OrganizationtypeVS (example)
* name 1.. MS
* address 1.. MS
* address.line MS
* address.city 1.. MS
* address.postalCode 1.. MS