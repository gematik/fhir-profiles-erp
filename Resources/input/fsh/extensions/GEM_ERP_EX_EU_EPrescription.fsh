Extension: GEM_ERP_EX_EU_EPrescription
Id: GEM-ERP-EX-EU-EPrescription
Context: Task, Extension
* insert StructureDefinition(GEM_ERP_EX_EU_EPrescription)
* . ^short = "Flag for EU ePrescription"
* . ^definition = "This flag needs to be set if the ePrescription is redeemable in the EU."
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Flag for EU ePrescription"
* valueBoolean ^definition = "This flag needs to be set if the ePrescription is redeemable in the EU."
