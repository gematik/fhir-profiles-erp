Profile: Gem_erxReceipt
Parent: Bundle
Id: 8e46a4b1-767b-4e8b-9032-454c4e94f8b6
Title: "Document Bundle for Receipt"
Description: "A document style representation of the receipt (complete, self-contained, signed)"
* ^meta.lastUpdated = "2020-04-16T13:42:23.761+00:00"
* ^url = "https://gematik.de/fhir/StructureDefinition/ErxReceipt"
* ^version = "1.1.1"
* ^status = #draft
* ^date = "2020-04-16T13:42:21.4495435+00:00"
* identifier 1.. MS
* identifier only Gem_erxPrescriptionID
* identifier ^short = "identifier of ePrescription"
* type = #document (exactly)
* type MS
* timestamp 1.. MS
* entry 3..3 MS
* entry ^short = "ePrescription receipt entry"
* signature only Gem_erxSignature
* signature MS
* signature.type 1..
* signature.type ^slicing.discriminator.type = #value
* signature.type ^slicing.discriminator.path = "code"
* signature.type ^slicing.rules = #open