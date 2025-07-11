Instance: ExampleUnitMedication
InstanceOf: GEM_ERP_PR_Medication
Title:   "Example Unit Medication"
Usage: #example

* ingredient.itemCodeableConcept.text = "Efeublätter, TE mit Ethanol/Ethanol-Wasser"
* ingredient.itemCodeableConcept = $cs-ask#11704
* ingredient.strength.numerator.value = 7
* ingredient.strength.numerator.system = "http://unitsofmeasure.org"
* ingredient.strength.numerator.code = #ml
* ingredient.strength.denominator.value = 1

* code.coding[pzn] = $cs-pzn#08585997
* code.text = "Prospan® Hustensaft 100ml N1"

* amount.numerator.value = 1
* amount.numerator.system = "http://bfarm.de/DimensionsloseEinheiten"
* amount.numerator.code = #Packungen
* amount.denominator.value = 1

