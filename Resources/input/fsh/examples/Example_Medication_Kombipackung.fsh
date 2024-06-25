// Kombipackung
Instance: Medication-Kombipackung
InstanceOf: GEM_ERP_PR_Medication
Title: "Medication-Kombipackung"
Usage: #example
* contained[+] = Augentropfen
* contained[+] = NasenSpray
* extension[type].valueCoding = $sct#781405001 "Medicinal product package"
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
InstanceOf: EPAMedicationPharmaceuticalProduct
* extension[type].valueCoding = $sct#373873005 "Pharmaceutical / biologic product (product)"
* code.coding[product-key] = $cs-product-key#01746517-1 "Augentropfen"
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
InstanceOf: EPAMedicationPharmaceuticalProduct
* extension[type].valueCoding = $sct#373873005 "Pharmaceutical / biologic product (product)"
* code.coding[product-key] = $cs-product-key#01746517-2 "Nasenspray, Lösung"
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