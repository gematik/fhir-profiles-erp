Profile: GEM_ERP_PR_Medication
Parent: $ePAMedication
Id: GEM-ERP-PR-Medication
Title: "Medication for the Dispensation of the Prescription"
Description: "Handles medical information about the redeemed prescription"
* insert Profile(GEM_ERP_PR_Medication)

// Add KBV Extensions
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension contains
    $KBV_EX_Base_Medication_Type named Kategorie 0..1 MS and
    $KBV_EX_ERP_Medication_Category named Arzneimittelkategorie 0..1 MS and
    $KBV_EX_ERP_Medication_Vaccine named Impfstoff 0..1 MS and
    $KBV_EX_ERP_Medication_CompoundingInstruction named Herstellungsanweisung 0..1 MS and
    $KBV_EX_ERP_Medication_Packaging named Verpackung 0..1 MS and
    $KBV_EX_ERP_Medication_Normgroesse named Normgroesse 0..1 MS

* extension[Arzneimittelkategorie].value[x] MS
* extension[Arzneimittelkategorie].value[x] only Coding
* extension[Arzneimittelkategorie].valueCoding MS
* extension[Arzneimittelkategorie].valueCoding ^sliceName = "valueCoding"
* extension[Arzneimittelkategorie].valueCoding.system MS
* extension[Arzneimittelkategorie].valueCoding.code MS
* extension[Impfstoff].value[x] MS
* extension[Impfstoff].value[x] only boolean
* extension[Impfstoff].valueBoolean MS
* extension[Impfstoff].valueBoolean ^sliceName = "valueBoolean"
* extension[Herstellungsanweisung].value[x] MS
* extension[Herstellungsanweisung].valueString MS
* extension[Herstellungsanweisung].valueString ^sliceName = "valueString"

* extension[Verpackung].value[x] MS
* extension[Verpackung].value[x] only string
* extension[Verpackung].valueString MS
* extension[Verpackung].valueString ^sliceName = "valueString"

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
* ingredient.strength.extension ^slicing.discriminator.type = #value
* ingredient.strength.extension ^slicing.discriminator.path = "url"
* ingredient.strength.extension ^slicing.rules = #closed
* ingredient.strength.extension ^min = 0
* ingredient.strength.extension contains $KBV_EX_ERP_Medication_Ingredient_Amount named MengeFreitext 0..1 MS
* ingredient.strength.extension[MengeFreitext].value[x] MS
* ingredient.strength.extension[MengeFreitext].valueString MS
* ingredient.strength.extension[MengeFreitext].valueString ^sliceName = "valueString"

* ingredient.strength.numerator.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.numerator.extension[dataAbsentReason].value[x] = #unknown
* ingredient.strength.denominator.extension contains $data-absent-reason named dataAbsentReason 0..1 MS
* ingredient.strength.denominator.extension[dataAbsentReason].value[x] = #unknown

// Add amount.numerator Extensions
* amount.numerator.extension ^slicing.discriminator.type = #value
* amount.numerator.extension ^slicing.discriminator.path = "url"
* amount.numerator.extension ^slicing.rules = #closed
* amount.numerator.extension contains $KBV_EX_ERP_Medication_PackagingSize named Gesamtmenge 0..1 MS
* amount.numerator.extension[Gesamtmenge] ^short = "Gesamtmenge der Rezeptur oder Packungsgröße"
* amount.numerator.extension[Gesamtmenge] ^definition = "Gesamtmenge der Rezeptur (ohne die Einheit) oder Angabe der Packungsgröße"
* amount.numerator.extension[Gesamtmenge] ^isModifier = false
* amount.numerator.extension[Gesamtmenge].value[x] MS
* amount.numerator.extension[Gesamtmenge].valueString MS
* amount.numerator.extension[Gesamtmenge].valueString ^sliceName = "valueString"
* amount.numerator.extension[Gesamtmenge].valueString ^short = "Gesamtmenge der Rezeptur oder Packungsgröße"
* amount.numerator.extension[Gesamtmenge].valueString ^definition = "Gesamtmenge der Rezeptur (ohne die Einheit) oder Angabe der Packungsgröße"


Instance: SumatripanMedication
InstanceOf: GEM_ERP_PR_Medication
Title:   "Sample Medication Sumatripan"
Usage: #example
* id = "001413e4-a5e9-48da-9b07-c17bab476407"
//Kategorie
* extension[Kategorie].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[Kategorie].valueCodeableConcept.coding.system = "http://snomed.info/sct"
* extension[Kategorie].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[Kategorie].valueCodeableConcept.coding.code = #763158003
* extension[Kategorie].valueCodeableConcept.coding.display = "Medicinal product (product)"
// Arzneimittelkategorie
* extension[Arzneimittelkategorie].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[Arzneimittelkategorie].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category"
* extension[Arzneimittelkategorie].valueCoding.code = #00
// Impfstoff
* extension[Impfstoff].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[Impfstoff].valueBoolean = false
// normgroesse
//* extension[Normgroesse].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[Normgroesse].valueCode = #N1
* code.coding[+].system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding[=].code = #06313728
* code.text = "Sumatriptan-1a Pharma 100 mg Tabletten"
* form.coding[+].system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM"
* form.coding[=].code = #TAB
//* amount.numerator.value = 20
* amount.numerator.unit = "St"
* amount.numerator.extension[Gesamtmenge].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension[Gesamtmenge].valueString = "20 St."
* amount.denominator.value = 1