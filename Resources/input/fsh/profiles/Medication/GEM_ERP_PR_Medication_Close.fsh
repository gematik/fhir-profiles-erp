Profile: GEM_ERP_PR_Medication_Close
Parent: GEM_ERP_PR_Medication
Id: GEM-ERP-PR-Medication-Close
Title: "Medication for the Dispensation of the Prescription"
Description: "Handles medical information about the redeemed prescription"
* insert SubProfile(GEM_ERP_PR_Medication_Close)

* extension 
  * ^slicing.rules = #closed

* identifier 0..0
* code.coding
  * ^slicing.rules = #closed

* form.coding
  * ^slicing.rules = #closed

* amount.numerator.extension
  * ^slicing.rules = #closed

* ingredient
  * extension
    * ^slicing.rules = #closed

  * itemCodeableConcept.coding
    * ^slicing.rules = #closed

  * strength.numerator
    * value
      * extension contains $data-absent-reason named dataAbsentReason 0..1 MS
        * ^slicing.rules = #closed
      * extension[dataAbsentReason].value[x] = #unknown
      * extension[dataAbsentReason] ^comment = "This needs to be set if a compounding medication only contains a freetext amount"
    * system.extension[dataAbsentReason].value[x] = #unknown
    * code.extension[dataAbsentReason].value[x] = #unknown
 
  * strength.denominator
    * value
      * extension contains $data-absent-reason named dataAbsentReason 0..1 MS
        * ^slicing.rules = #closed
      * extension[dataAbsentReason].value[x] = #unknown
      * extension[dataAbsentReason] ^comment = "This needs to be set if a compounding medication only contains a freetext amount"
    * system.extension[dataAbsentReason].value[x] = #unknown
    * code.extension[dataAbsentReason].value[x] = #unknown

Instance: SimpleSubMedication
InstanceOf: GEM_ERP_PR_Medication_Close
Title:   "Sample Simple Sub Medication"
Usage: #example
* batch.lotNumber = "1234567890"

* code.coding[pzn].system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding[pzn].code = #09285547