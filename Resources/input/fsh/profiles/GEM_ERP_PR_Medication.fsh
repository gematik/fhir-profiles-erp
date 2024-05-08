Profile: GEM_ERP_PR_Medication
Parent: $ePAMedication
Id: gem-erp-pr-medication
Title: "Medication for the Dispensation of the Prescription"
Description: "Handles medical information about the redeemed prescription"

// Add KBV Extensions
* extension ..4
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains
    $KBV_EX_Base_Medication_Type named Kategorie 0..1 MS and
    $KBV_EX_ERP_Medication_Category named Arzneimittelkategorie 1..1 MS and
    $KBV_EX_ERP_Medication_Vaccine named Impfstoff 1..1 MS and
    $KBV_EX_ERP_Medication_CompoundingInstruction named Herstellungsanweisung 0..1 MS and
    $KBV_EX_ERP_Medication_Packaging named Verpackung 0..1 MS and
    $KBV_EX_ERP_Medication_Normgroesse named Normgroesse 0..1 MS
    //TODO: Entscheiden ob wir die Abhängigkeit zur KBV Basis für die Extension "Kategorie" wollen
* extension[Kategorie].value[x] MS
* extension[Kategorie].value[x] ^slicing.discriminator.type = #type
* extension[Kategorie].value[x] ^slicing.discriminator.path = "$this"
* extension[Kategorie].value[x] ^slicing.rules = #closed
* extension[Kategorie].valueCodeableConcept MS
* extension[Kategorie].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* extension[Kategorie].valueCodeableConcept.coding 1.. MS
* extension[Kategorie].valueCodeableConcept.coding.system = "http://snomed.info/sct" (exactly)
* extension[Kategorie].valueCodeableConcept.coding.system MS
* extension[Kategorie].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331" (exactly)
* extension[Kategorie].valueCodeableConcept.coding.version MS
* extension[Kategorie].valueCodeableConcept.coding.code = #373873005:860781008=362943005 (exactly)
* extension[Kategorie].valueCodeableConcept.coding.code MS
* extension[Kategorie].valueCodeableConcept.coding.display = "Pharmaceutical / biologic product (product) : Has product characteristic (attribute) = Manual method (qualifier value)" (exactly)
* extension[Kategorie].valueCodeableConcept.coding.display MS
* extension[Kategorie].valueCodeableConcept.coding.userSelected ..0
* extension[Kategorie].valueCodeableConcept.text ..0
* extension[Arzneimittelkategorie].value[x] MS
* extension[Arzneimittelkategorie].valueCoding MS
* extension[Arzneimittelkategorie].valueCoding ^sliceName = "valueCoding"
* extension[Arzneimittelkategorie].valueCoding.system MS
* extension[Arzneimittelkategorie].valueCoding.code MS
* extension[Impfstoff].value[x] MS
* extension[Impfstoff].valueBoolean MS
* extension[Impfstoff].valueBoolean ^sliceName = "valueBoolean"
* extension[Herstellungsanweisung].value[x] MS
* extension[Herstellungsanweisung].valueString MS
* extension[Herstellungsanweisung].valueString ^sliceName = "valueString"
* extension[Verpackung].value[x] MS
* extension[Verpackung].valueString MS
* extension[Verpackung].valueString ^sliceName = "valueString"
* extension[Normgroesse].value[x] MS
* extension[Normgroesse] ^short = "Packungsgröße nach N-Bezeichnung"
* extension[Normgroesse] ^definition = "Beschreibung der therapiegerechten Packungsgröße (z. B. N1)"
* extension[Normgroesse].value[x] 1.. MS
* extension[Normgroesse].value[x] ^slicing.discriminator.type = #type
* extension[Normgroesse].value[x] ^slicing.discriminator.path = "$this"
* extension[Normgroesse].value[x] ^slicing.rules = #closed
* extension[Normgroesse].valueCode MS
* extension[Normgroesse].valueCode ^sliceName = "valueCode"

// Add KBV Darreichungsform to ingredient for Medication_Compunding
* ingredient.extension ^slicing.discriminator.type = #value
* ingredient.extension ^slicing.discriminator.path = "url"
* ingredient.extension ^slicing.rules = #closed
* ingredient.extension ^min = 0
* ingredient.extension contains $KBV_EX_ERP_Medication_Ingredient_Form named Darreichungsform 0..1 MS
* ingredient.extension[Darreichungsform].value[x] MS
* ingredient.extension[Darreichungsform].valueString MS
* ingredient.extension[Darreichungsform].valueString ^sliceName = "valueString"

// Add ingredient strength to ingredient for Medication_Compunding
* ingredient.strength obeys -erp-numeratorOderFreitext
* ingredient.strength.extension ^slicing.discriminator.type = #value
* ingredient.strength.extension ^slicing.discriminator.path = "url"
* ingredient.strength.extension ^slicing.rules = #closed
* ingredient.strength.extension ^min = 0
* ingredient.strength.extension contains $KBV_EX_ERP_Medication_Ingredient_Amount named MengeFreitext 0..1 MS
* ingredient.strength.extension[MengeFreitext].value[x] MS
* ingredient.strength.extension[MengeFreitext].valueString MS
* ingredient.strength.extension[MengeFreitext].valueString ^sliceName = "valueString"

Invariant: -erp-numeratorOderFreitext
Description: "Entweder ist die Menge des Bestandteils durch \"numerator\" oder als Freitext anzugeben."
* severity = #error
* expression = "extension('https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Ingredient_Amount').exists() xor numerator.exists()"
