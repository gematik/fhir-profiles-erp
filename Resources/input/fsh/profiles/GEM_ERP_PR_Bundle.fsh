Profile: GEM_ERP_PR_Bundle
Parent: Bundle
Id: GEM-ERP-PR-Bundle
Title: "Document Bundle for Receipt"
Description: "A document style representation of the receipt (complete, self-contained, signed)"
* ^meta.lastUpdated = "2020-04-16T13:42:23.761+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle"
* ^version = "1.2"
* ^status = #draft
* ^date = "2020-04-16T13:42:21.4495435+00:00"
* identifier 1.. MS
* identifier only GEM_ERP_PR_PrescriptionId
* identifier ^short = "identifier of ePrescription"
* type = #document (exactly)
* type MS
* timestamp 1.. MS
* entry 3..3 MS
* entry ^short = "ePrescription receipt entry"
* signature only GEM_ERP_PR_Signature
* signature MS
* signature.type 1..
* signature.type ^slicing.discriminator.type = #value
* signature.type ^slicing.discriminator.path = "code"
* signature.type ^slicing.rules = #open