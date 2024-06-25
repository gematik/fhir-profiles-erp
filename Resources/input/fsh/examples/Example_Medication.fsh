
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

Instance: Medication-Kombipackung
InstanceOf: GEM_ERP_PR_Medication
Title:   "Medication which contains compounding child elements"
Usage: #example
* contained[+] = Augentropfen
* contained[+] = NasenSpray
//TODO: Extension Type setzen
// * extension[type].valueCoding = $sct#781405001 "Medicinal product package"
* extension[isVaccine].valueBoolean = false
* extension[drugCategory].valueCoding.code = #00
* extension[drugCategory].valueCoding.display = "Arzneimittel oder in die Arzneimittelversorgung nach § 31 SGB V einbezogenes Produkt"
* code.coding[pzn] = $PZN#1746517 "CROMO-RATIOPHARM Kombipackung"
* status = #active
* form.coding[kbvDarreichungsform].code = #KPG
* form.text = "Kombipackung"
* ingredient[+].itemReference = Reference(NasenSpray)
* ingredient[+].itemReference = Reference(Augentropfen)

Instance: Augentropfen
InstanceOf: GEM_ERP_PR_Medication
//TODO Change to correct MedicationType
//InstanceOf: EPAMedicationPharmaceuticalProduct
//TODO: Set Extension and code
//* extension[type].valueCoding = $sct#373873005 "Pharmazeutisches/biologisches Produkt"
//* code.coding[product-key] = $cs-product-key#01746517-1 "Augentropfen"
* batch.lotNumber = "0132456"
* ingredient[+]
  * itemCodeableConcept
    * coding[atc-de] = $cs-atc-de#R01AC01 "Natriumcromoglicat"
  * strength
    * numerator
      * value = 20
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 1
      * unit = "ml"
      * system = $cs-ucum
      * code = #ml

Instance: NasenSpray
InstanceOf: GEM_ERP_PR_Medication
//TODO Change to correct MedicationType
//InstanceOf: EPAMedicationPharmaceuticalProduct
//TODO: Set Extension and code
//* extension[type].valueCoding = $sct#373873005 "Pharmazeutisches/biologisches Produkt"
//* code.coding[product-key] = $cs-product-key#01746517-2 "Nasenspray, Lösung"
* batch.lotNumber = "56498416854"
* ingredient[+]
  * itemCodeableConcept
    * coding[atc-de] = $cs-atc-de#R01AC01 "Natriumcromoglicat"
  * strength
    * numerator
      * value = 2.8
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 1
      * unit = "Sprühstoß"
      * system = $cs-ucum
      * code = #1