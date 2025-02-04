Profile: GEM_ERP_PR_Medication
Parent: EPAMedication
Id: GEM-ERP-PR-Medication
Title: "Medication for the Dispensation of the Prescription"
Description: "Handles medical information about the redeemed prescription"
* insert Profile(GEM_ERP_PR_Medication)
 
* contained MS

* extension[rxPrescriptionProcessIdentifier] 0..0
* extension[epaDispensationIdentifier] 0..0

* extension[isVaccine] MS
* extension[drugCategory] MS
* extension[normSizeCode] MS
* extension[packaging] MS
* extension[manufacturingInstructions] MS
* extension[type] MS //TODO 1..1 wenn epa-med-2 nicht mehr da ist

* identifier 0..0

* code.coding
  * ^slicing.rules = #closed

* status = #active

* form.coding
  * ^slicing.rules = #closed

* amount.numerator.extension[totalQuantity] MS
* amount.numerator.extension[packagingSize] MS

* ingredient MS
  * itemCodeableConcept 
    * ^short = "Component in coded form" // This line is necessary to avoid the HAPI Validator Error bug
    * coding
      * ^slicing.rules = #closed
  * itemReference MS
  * itemReference only Reference(EPAMedicationPharmaceuticalProduct or EPAMedicationPZNIngredient)
  * itemReference ^type.aggregation = #contained

* ingredient.extension[darreichungsform] MS
* ingredient.strength.extension[amountText] MS

* ingredient.strength.numerator
  * value.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
  * value.extension[dataAbsentReason].value[x] = #unknown
  * value.extension[dataAbsentReason] ^comment = "This needs to be set if a compounding medication only contains a freetext amount"

  * system.extension[dataAbsentReason].value[x] = #unknown
  * code.extension[dataAbsentReason].value[x] = #unknown
 
* ingredient.strength.denominator
  * value.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
  * value.extension[dataAbsentReason].value[x] = #unknown
  * value.extension[dataAbsentReason] ^comment = "This needs to be set if a compounding medication only contains a freetext amount"

  * system.extension[dataAbsentReason].value[x] = #unknown
  * code.extension[dataAbsentReason].value[x] = #unknown

* batch MS
  * lotNumber MS