Profile: GEM_ERP_PR_Composition
Parent: Composition
Id: GEM-ERP-PR-Composition
Title: "Receipt for Fulfillment of ePrescription"
Description: "Upon completion of the ePrescription workflow, the prescription filler receives a signed receipt for billing and verification purposes."
* insert Profile(GEM_ERP_PR_Composition)

// extensions
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.description = "Extensions for the Composition to be differentiated by url"
* extension ^slicing.rules = #closed
* extension contains GEM_ERP_EX_Beneficiary named Beneficiary 1..1

* extension[Beneficiary] ^short = "The ID of the beneficiary of the erx receipt (e.g. TelematikID of pharmacy)"
* extension[Beneficiary].value[x].system 1..
* extension[Beneficiary].value[x].value 1..

* status MS
* status = #final (exactly)
  * ^short = "Status = \"final\""

* type MS
* type ^short = "Document Type = \"Receipt\""
  * coding 1..1
    * code 1..1
    * code = #3 (exactly)
    * system 1..1
    * system = Canonical(GEM_ERP_CS_DocumentType) (exactly)
    * display = "Receipt" (exactly)
  * coding from GEM_ERP_VS_DocumentType (required)

* date MS
* author only Reference(GEM_ERP_PR_Device)
* author MS
  * ^short = "Reference to verifying service (Device)"
  * ^type.aggregation[0] = #referenced
  * ^type.aggregation[+] = #bundled

* title = "Quittung" (exactly)
* title MS
* title ^short = "Document title = \"Quittung\""

* event 1..1
  * period 1.. MS
    * start 1.. MS
    * start ^short = "Starting time of dispensation"
    * start ^definition = "Time the prescription was submitted to the dispensing organization"
    * end 1..
    * end ^definition = "The end of the period. Time when the dispensation finished, i.e. when server creates the receipt."
  * detail MS
  * detail.reference 1.. MS
