Profile: GEM_ERP_PR_Composition
Parent: Composition
Id: GEM-ERP-PR-Composition
Title: "Receipt for Fulfillment of ePrescription"
Description: "Upon completion of the ePrescription workflow, the prescription filler receives a signed receipt for billing and verification purposes."
* insert Profile(GEM_ERP_PR_Composition)
* ^meta.lastUpdated = "2020-04-16T13:43:58.4+00:00"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains GEM_ERP_EX_Beneficiary named Beneficiary 1..1
* extension[Beneficiary] ^short = "The ID of the beneficiary of the erx receipt (e.g. TelematikID of pharmacy)"
* extension[Beneficiary].value[x].system 1..
* extension[Beneficiary].value[x].value 1..
* status = #final (exactly)
* status MS
* status ^short = "Status = \"final\""
* type MS
* type ^short = "Document Type = \"Receipt\""
* type.coding 1..1
//* type.coding.system 1..
//* type.coding.system = "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_DocumentType" (exactly)
//* type.coding.code 1..
* type.coding from GEM_ERP_VS_DocumentType (required)
* type.coding.code = #3 (exactly)
* type.coding.display = "Receipt" (exactly)
* date MS
* author only Reference(GEM_ERP_PR_Device)
* author MS
* author ^short = "Reference to verifying service (Device)"
* author ^type.aggregation[0] = #referenced
* author ^type.aggregation[+] = #bundled
* title = "Quittung" (exactly)
* title MS
* title ^short = "Document title = \"Quittung\""
* event 1..1
* event.period 1.. MS
* event.period.start 1.. MS
* event.period.start ^short = "Starting time of dispensation"
* event.period.start ^definition = "Time the prescription was submitted to the dispensing organization"
* event.period.end 1..
* event.period.end ^definition = "The end of the period. Time when the dispensation finished, i.e. when server creates the receipt."
* event.detail MS
* event.detail.reference 1.. MS
