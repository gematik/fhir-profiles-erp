Profile: GEM_ERP_PR_Medication
Parent: EPAMedication
Id: GEM-ERP-PR-Medication
Title: "Medikament zur Ausgabe des Rezepts"
Description: "Verarbeitet medizinische Informationen über das eingelöste Rezept"
* insert Profile(GEM_ERP_PR_Medication)
 
* contained MS

* extension[isVaccine] MS
* extension[drugCategory] MS

* extension[normSizeCode] MS
* extension[packaging] MS
* extension[manufacturingInstructions] MS
* extension[type] MS

* status = #active

* amount.numerator.extension[totalQuantity] MS
* amount.numerator.extension[packagingSize] MS

* ingredient MS
  * itemCodeableConcept ^short = "Komponente in codierter Form" // Diese Zeile ist notwendig, um den HAPI-Validator-Fehler zu vermeiden
  * itemReference MS
  * itemReference only Reference(EPAMedicationPharmaceuticalProduct or EPAMedicationPZNIngredient)
  * itemReference ^type.aggregation = #contained

* ingredient.extension[darreichungsform] MS
* ingredient.strength.extension[amountText] MS