Extension: GEM_ERP_EX_SHOULD_REDEEM_EU_EPrescription
Id: GEM-ERP-EX-SHOULD-REDEEM-EU-EPrescription
Context: Task, Extension
* insert StructureDefinition(GEM_ERP_EX_SHOULD_REDEEM_EU_EPrescription)
* . ^short = "Should be redeemed in EU Flag"
* . ^definition = "This flag is set by the user to indicate weather the ePrescription should be available for redemtion in the EU or not."
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Should be redeemed in EU Flag"
* valueBoolean ^definition = "This flag is set by the user to indicate weather the ePrescription should be available for redemtion in the EU or not."
