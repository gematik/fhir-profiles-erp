// Rezeptur
Instance: Medication-Rezeptur
InstanceOf: GEM_ERP_PR_Medication
Title: "Medication-Rezeptur"
Usage: #example
* contained[+] = MedicationHydrocortison
* contained[+] = MedicationDexpanthenol
// Arzneimittelkategorie
* extension[drugCategory].valueCoding = EPADrugCategoryCS#00

//MedicationType
* extension[type].valueCoding = $sct#1208954007 "Extemporaneous preparation (product)"

// Impfstoff
* extension[isVaccine].valueBoolean = false

// normgroesse
* code.text = "Hydrocortison-Dexpanthenol-Salbe"
* form.coding[kbvDarreichungsform].system = $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM
* form.coding[kbvDarreichungsform].code = #SAL
* amount.numerator.value = 20
* amount.numerator.unit = "ml"
* amount.numerator.extension[totalQuantity].valueString = "100"
* amount.denominator.value = 1
* ingredient[+].itemReference = Reference(MedicationHydrocortison)
* ingredient[=].isActive = true
* ingredient[=].strength.numerator.value = 50
* ingredient[=].strength.numerator.system = "http://unitsofmeasure.org"
* ingredient[=].strength.numerator.code = #g
* ingredient[=].strength.denominator.value = 100
* ingredient[=].strength.denominator.system = "http://unitsofmeasure.org"
* ingredient[=].strength.denominator.code = #g
* ingredient[+].itemReference = Reference(MedicationDexpanthenol)
* ingredient[=].isActive = true
* ingredient[=].strength.numerator.value = 50
* ingredient[=].strength.numerator.system = "http://unitsofmeasure.org"
* ingredient[=].strength.numerator.code = #g
* ingredient[=].strength.denominator.value = 100
* ingredient[=].strength.denominator.system = "http://unitsofmeasure.org"
* ingredient[=].strength.denominator.code = #g

Instance: MedicationHydrocortison
InstanceOf: EPAMedicationPZNIngredient
Usage: #inline
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
* code
  * coding[pzn]
    * code = #03424249
    * display = "Hydrocortison 1% Creme"
* batch.lotNumber = "56498416854"

Instance: MedicationDexpanthenol
InstanceOf: EPAMedicationPZNIngredient
Usage: #inline
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
* code
  * coding[pzn]
    * code = #16667195
    * display = "Dexpanthenol 5% Creme"
* batch.lotNumber = "0132456"