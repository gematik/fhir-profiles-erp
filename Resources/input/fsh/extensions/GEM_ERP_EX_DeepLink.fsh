Extension: GEM_ERP_EX_DeepLink
Id: GEM-ERP-EX-DeepLink
Title: "DiGA-DeepLink"
Description: "States the redeem code for a DiGA."
* ^context[0].type = #element
* ^context[=].expression = "MedicationDispense"
* value[x] only uri
  * ^short = "States a deep link for a DiGA."