Extension: GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PATIENT_AUTHORIZATION
Id: GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PATIENT-AUTHORIZATION
Context: Task, Extension
* insert StructureDefinition(GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PATIENT_AUTHORIZATION)
* . ^short = "Redeemable EU ePrescription by Patient Authorization"
* . ^definition = "This flag is set by the user to indicate weather the ePrescription should be available for redemption in the EU or not."
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Should be redeemed in EU Flag"
* valueBoolean ^definition = "This flag is set by the user to indicate weather the ePrescription should be available for redemption in the EU or not."
