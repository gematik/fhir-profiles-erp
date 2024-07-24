Profile: GEM_ERP_PR_Medication
Parent: EPAMedication
Id: GEM-ERP-PR-Medication
Title: "Medication for the Dispensation of the Prescription"
Description: "Handles medical information about the redeemed prescription"
* insert Profile(GEM_ERP_PR_Medication)
 
* contained MS
* ingredient MS
  * itemCodeableConcept ^short = "Component in coded form" // This line is necessary to avoid the HAPI Validator Error bug
  * itemReference MS
  * itemReference only Reference(EPAMedicationPharmaceuticalProduct or EPAMedicationPZNIngredient)
  * itemReference ^type.aggregation = #contained
 
* ingredient.strength.numerator.system.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.numerator.system.extension[dataAbsentReason].value[x] = #unknown
* ingredient.strength.numerator.code.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.numerator.code.extension[dataAbsentReason].value[x] = #unknown
 
* ingredient.strength.denominator.system.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.denominator.system.extension[dataAbsentReason].value[x] = #unknown
* ingredient.strength.denominator.code.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.denominator.code.extension[dataAbsentReason].value[x] = #unknown
