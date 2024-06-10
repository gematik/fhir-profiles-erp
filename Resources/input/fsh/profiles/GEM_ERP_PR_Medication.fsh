Profile: GEM_ERP_PR_Medication
Parent: $ePAMedication
Id: GEM-ERP-PR-Medication
Title: "Medication for the Dispensation of the Prescription"
Description: "Handles medical information about the redeemed prescription"
* insert Profile(GEM_ERP_PR_Medication)

* ingredient.strength.numerator.system.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.numerator.system.extension[dataAbsentReason].value[x] = #unknown
* ingredient.strength.numerator.code.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.numerator.code.extension[dataAbsentReason].value[x] = #unknown

* ingredient.strength.denominator.system.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.denominator.system.extension[dataAbsentReason].value[x] = #unknown
* ingredient.strength.denominator.code.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.denominator.code.extension[dataAbsentReason].value[x] = #unknown

Instance: SumatripanMedication
InstanceOf: GEM_ERP_PR_Medication
Title:   "Sample Medication Sumatripan"
Usage: #example
// Arzneimittelkategorie
* extension[drugCategory].url = "https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension"
* extension[drugCategory].valueCoding.system = "https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs"
* extension[drugCategory].valueCoding.code = #00

// Impfstoff
* extension[isVaccine].url = "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension"
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
* amount.numerator.extension[totalQuantity].url = "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-total-quantity-formulation-extension"
* amount.numerator.extension[totalQuantity].valueString = "20 St."
* amount.denominator.value = 1


Instance: Medication-Without-Strength-Code
InstanceOf: GEM_ERP_PR_Medication
Title:   "Medication Without code or system for Strength"
Usage: #example
* code.text = "Infusion bestehend aus 85mg Doxorubicin aufgeloest zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
* form = http://standardterms.edqm.eu#11210000 "Solution for infusion"
* ingredient.itemCodeableConcept = http://fhir.de/CodeSystem/bfarm/atc#L01DB01 "Doxorubicin"
* ingredient.isActive = true
* ingredient.strength.numerator.value = 85
* ingredient.strength.numerator.unit = "mg"
* ingredient.strength.numerator.system.extension[dataAbsentReason].valueCode = #unknown
* ingredient.strength.numerator.code.extension[dataAbsentReason].valueCode = #unknown

* ingredient.strength.denominator.value = 250
* ingredient.strength.denominator.unit = "Milliliter"
* ingredient.strength.denominator.system.extension[dataAbsentReason].valueCode = #unknown
* ingredient.strength.denominator.code.extension[dataAbsentReason].valueCode = #unknown