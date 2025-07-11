// Rezeptur
Instance: Medication-Rezeptur-FD
InstanceOf: GEM_ERP_PR_Medication
Title: "Medication-Rezeptur-FD"
Usage: #example
* contained[+] = MedicationHydrocortison-FD
* contained[+] = MedicationDexpanthenol-FD

// Extensions
* extension[drugCategory].valueCoding = EPADrugCategoryCS#00
* extension[manufacturingInstructions].valueString = "Bitte kühl zubereiten und lagern."
* extension[packaging].valueString = "Tube"
* extension[isVaccine].valueBoolean = false
* extension[type].valueCoding = $sct#1208954007 "Extemporaneous preparation (product)"

* code.text = "Hydrocortison-Dexpanthenol-Salbe"
* form.text = "Salbe"
* amount.numerator.extension[totalQuantity].valueString = "100"
* amount.numerator.value = 20
* amount.numerator.unit = "ml"
* amount.denominator.value = 1
* ingredient[+].itemReference = Reference(MedicationHydrocortison-FD)
* ingredient[=].extension[darreichungsform].valueString = "Salbe"
* ingredient[=].isActive = true
* ingredient[=].strength.numerator.value = 50
* ingredient[=].strength.numerator.unit = "g"
* ingredient[=].strength.denominator.value = 100
* ingredient[=].strength.denominator.unit = "g"

* ingredient[+].itemReference = Reference(MedicationDexpanthenol-FD)
* ingredient[=].extension[darreichungsform].valueString = "Salbe"
* ingredient[=].isActive = true
* ingredient[=].strength.numerator.value = 50
* ingredient[=].strength.numerator.unit = "g"
* ingredient[=].strength.denominator.value = 100
* ingredient[=].strength.denominator.unit = "g"

Instance: MedicationHydrocortison-FD
InstanceOf: EPAMedicationPZNIngredient
Usage: #inline
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
* code
  * coding[pzn]
    * code = #03424249
    * display = "Hydrocortison 1% Creme"
  * text = "Hydrocortison 1% Creme"

Instance: MedicationDexpanthenol-FD
InstanceOf: EPAMedicationPZNIngredient
Usage: #inline
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
* code
  * coding[pzn]
    * code = #16667195
    * display = "Dexpanthenol 5% Creme"
  * text = "Dexpanthenol 5% Creme"