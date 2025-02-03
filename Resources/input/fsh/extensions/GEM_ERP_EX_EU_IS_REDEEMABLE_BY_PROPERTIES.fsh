Extension: GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES
Id: GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES
Context: Task, Extension
* insert StructureDefinition(GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES)
* . ^short = "Redeemable in EU Flag"
* . ^definition = "This flag is set by the E-Rezept-Fachdienst, if the ePrescription is redeemable in the EU."
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Redeemable in EU Flag"
* valueBoolean ^definition = "This flag is set by the E-Rezept-Fachdienst, if the ePrescription is redeemable in the EU."
