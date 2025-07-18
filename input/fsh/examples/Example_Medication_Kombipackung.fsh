// Kombipackung
Instance: Medication-Kombipackung
InstanceOf: GEM_ERP_PR_Medication
Title: "Medication-Kombipackung"
Usage: #example
* contained[+] = Augentropfen
* contained[+] = NasenSpray
* batch.lotNumber = "56498416854"
* extension[isVaccine].valueBoolean = false
* extension[drugCategory].valueCoding = EPADrugCategoryCS#00
* extension[drugCategory].valueCoding.display = "Arzneimittel oder in die Arzneimittelversorgung nach § 31 SGB V einbezogenes Produkt"
* code.coding[pzn] = $cs-pzn#1746517 "CROMO-RATIOPHARM Kombipackung"
* status = #active
* form.coding[kbvDarreichungsform].code = #KPG
* form.text = "Kombipackung"
* ingredient[+].itemReference = Reference(NasenSpray)
* ingredient[+].itemReference = Reference(Augentropfen)

Instance: Augentropfen
InstanceOf: EPAMedicationPharmaceuticalProduct
* extension[type].valueCoding = $sct#373873005 "Pharmaceutical / biologic product (product)"
* ingredient[+]
  * itemCodeableConcept
    * coding[atc-de] = $cs-atc-de|1.4.0#R01AC01 "Natriumcromoglicat"
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
InstanceOf: EPAMedicationPharmaceuticalProduct
Usage: #inline
* extension[type].valueCoding = $sct#373873005 "Pharmaceutical / biologic product (product)"
* ingredient[+]
  * itemCodeableConcept
    * coding[atc-de] = $cs-atc-de|1.4.0#R01AC01 "Natriumcromoglicat"
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