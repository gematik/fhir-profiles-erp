Profile: GEM_ERP_PR_Medication
Parent: $ePAMedication
Id: GEM-ERP-PR-Medication
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
* amount.numerator.extension contains $KBV_EX_ERP_Medication_PackagingSize named Gesamtmenge 0..1 MS and
$KBV_EX_ERP_Medication_PackagingSize named Packungsgroesse 0..1 MS
* amount.numerator.extension[Gesamtmenge] ^short = "Gesamtmenge der Rezeptur"
* amount.numerator.extension[Gesamtmenge] ^definition = "Gesamtmenge der Rezeptur (ohne die Einheit)"
* amount.numerator.extension[Gesamtmenge] ^isModifier = false
* amount.numerator.extension[Gesamtmenge].value[x] MS
* amount.numerator.extension[Gesamtmenge].valueString MS
* amount.numerator.extension[Gesamtmenge].valueString ^sliceName = "valueString"
* amount.numerator.extension[Gesamtmenge].valueString ^short = "Gesamtmenge der Rezeptur"
* amount.numerator.extension[Gesamtmenge].valueString ^definition = "Gesamtmenge der Rezeptur (ohne die Einheit)"
* amount.numerator.extension[Packungsgroesse] ^short = "Packungsgröße nach abgeteilter Menge"
* amount.numerator.extension[Packungsgroesse] ^definition = "Angabe zur Packungsgröße nach abgeteilter Menge (z.B. 100, 2x25), tritt nur in Verbindung mit „Einheit“ auf (z.B. 100 Stück)."
* amount.numerator.extension[Packungsgroesse] ^isModifier = false
* amount.numerator.extension[Packungsgroesse].value[x] MS
* amount.numerator.extension[Packungsgroesse].valueString MS
* amount.numerator.extension[Packungsgroesse].valueString ^sliceName = "valueString"

