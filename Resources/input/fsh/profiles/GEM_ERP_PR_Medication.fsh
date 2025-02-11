Profile: GEM_ERP_PR_Medication
Parent: EPAMedication
Id: GEM-ERP-PR-Medication
Title: "Medication for the Dispensation of the Prescription"
Description: "Handles medical information about the redeemed prescription"
* insert Profile(GEM_ERP_PR_Medication)
 
* contained MS

* extension[isVaccine] MS
* extension[drugCategory] MS
  * valueCoding
    * system 1..1 //TODO Check if with ePA 3.0.5 can be removed
    * code 1..1

* extension[normSizeCode] MS
* extension[packaging] MS
* extension[manufacturingInstructions] MS
* extension[type] MS

* status = #active

* amount.numerator.extension[totalQuantity] MS
* amount.numerator.extension[packagingSize] MS

* ingredient MS
  * itemCodeableConcept ^short = "Component in coded form" // This line is necessary to avoid the HAPI Validator Error bug
  * itemReference MS
  * itemReference only Reference(EPAMedicationPharmaceuticalProduct or EPAMedicationPZNIngredient)
  * itemReference ^type.aggregation = #contained

* ingredient.extension[darreichungsform] MS
* ingredient.strength.extension[amountText] MS