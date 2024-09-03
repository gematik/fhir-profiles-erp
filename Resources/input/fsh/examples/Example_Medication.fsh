// Single Medication
Instance: SumatripanMedication
InstanceOf: GEM_ERP_PR_Medication
Title:   "Sample Medication Sumatripan"
Usage: #example
// Arzneimittelkategorie
* extension[drugCategory].valueCoding = EPADrugCategoryCS#00

// Impfstoff
* extension[isVaccine].valueBoolean = false

// normgroesse
* extension[normSizeCode].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[normSizeCode].valueCode = #N1
* code.coding[pzn].system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding[pzn].code = #06313728
* code.text = "Sumatriptan-1a Pharma 100 mg Tabletten"
* form.coding[kbvDarreichungsform].system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM"
* form.coding[kbvDarreichungsform].code = #TAB
* amount.numerator.value = 20
* amount.numerator.unit = "St"
* amount.numerator.extension[totalQuantity].valueString = "20 St."
* amount.denominator.value = 1

Instance: SimpleMedication
InstanceOf: GEM_ERP_PR_Medication
Title:   "Sample Simple Medication"
Usage: #example
* code.coding[pzn].system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding[pzn].code = #06313728

// Medication without system and code for ingredient.strengh.numerator/denominator
Instance: Medication-Without-Strength-Code
InstanceOf: GEM_ERP_PR_Medication
Title:   "Medication Without code or system for Strength"
Usage: #example
* code.text = "Infusion bestehend aus 85mg Doxorubicin aufgeloest zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
* form = http://standardterms.edqm.eu#11210000 "Solution for infusion"
* ingredient[+]
  * itemCodeableConcept = http://fhir.de/CodeSystem/bfarm/atc#L01DB01 "Doxorubicin"
  * isActive = true
  * strength.numerator.value = 85
  * strength.numerator.unit = "mg"
  * strength.numerator.system.extension[dataAbsentReason].valueCode = #unknown
  * strength.numerator.code.extension[dataAbsentReason].valueCode = #unknown

  * strength.denominator.value = 250
  * strength.denominator.unit = "Milliliter"
  * strength.denominator.system.extension[dataAbsentReason].valueCode = #unknown
  * strength.denominator.code.extension[dataAbsentReason].valueCode = #unknown

Instance: Medication-Without-Strength-Numerator
InstanceOf: GEM_ERP_PR_Medication
Title:   "Medication Without code or system for Strength"
Usage: #example
* code.text = "Infusion bestehend aus 85mg Doxorubicin aufgeloest zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
* form = http://standardterms.edqm.eu#11210000 "Solution for infusion"
* ingredient[+]
  * itemCodeableConcept = http://fhir.de/CodeSystem/bfarm/atc#L01DB01 "Doxorubicin"
  * isActive = true
  * strength.numerator.value.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * strength.numerator.value.extension.valueCode = #unknown
  * strength.numerator.system.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * strength.numerator.system.extension.valueCode = #unknown
  * strength.numerator.code.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * strength.numerator.code.extension.valueCode = #unknown

  * strength.denominator.value = 1
  * strength.denominator.system.extension[dataAbsentReason].valueCode = #unknown
  * strength.denominator.code.extension[dataAbsentReason].valueCode = #unknown
