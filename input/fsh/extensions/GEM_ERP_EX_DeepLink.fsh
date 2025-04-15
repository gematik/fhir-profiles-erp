Extension: GEM_ERP_EX_DeepLink
Id: GEM-ERP-EX-DeepLink
Title: "DiGA-DeepLink"
Description: "Contains information regarding deep link for a DiGA."
Context: MedicationDispense
* insert StructureDefinition(GEM_ERP_EX_DeepLink)
* . ^short = "Statement of a deep link which can be used to open the DiGA."
* value[x] only url