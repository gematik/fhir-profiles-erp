Extension: GEM_ERP_EX_DeepLink
Id: GEM-ERP-EX-DeepLink
Title: "DiGA-DeepLink"
Description: "Enthält Informationen zum Deep Link für eine DiGA."
Context: MedicationDispense
* insert StructureDefinition(GEM_ERP_EX_DeepLink)
* . ^short = "Angabe eines Deep Links, der zum Öffnen der DiGA verwendet werden kann."
* value[x] only url