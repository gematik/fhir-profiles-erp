Extension: GEM_ERP_EX_REDEEMABLE_EU_EPrescription
Id: GEM-ERP-EX-REDEEMABLE-EU-EPrescription
Context: Task, Extension
* insert StructureDefinition(GEM_ERP_EX_REDEEMABLE_EU_EPrescription)
* . ^short = "Redeemable in EU Flag"
* . ^definition = "This flag is set by the E-Rezept-Fachdienst, if the ePrescription is redeemable in the EU."
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Redeemable in EU Flag"
* valueBoolean ^definition = "This flag is set by the E-Rezept-Fachdienst, if the ePrescription is redeemable in the EU."
