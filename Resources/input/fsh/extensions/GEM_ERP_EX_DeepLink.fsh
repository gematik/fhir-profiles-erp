Extension: GEM_ERP_EX_DeepLink
Id: GEM-ERP-EX-DeepLink
Title: "DiGA-DeepLink"
Description: "Contains information regarding a deep link for a DiGA."
* ^context[0].type = #element
* ^context[=].expression = "MedicationDispense"
* extension contains 
  GEM_ERP_EX_DeepLink_plattform named plattform 1..1
  and GEM_ERP_EX_DeepLink_link named link 1..1


Extension: GEM_ERP_EX_DeepLink_plattform
Id: GEM-ERP-EX-DeepLink-plattform
Title: "Plattform for DiGA-DeepLink"
Description: "States the redeem code for a DiGA."
* value[x] only Coding
* value[x] from GEM_ERP_VS_Mobile_Plattform (required)
  * ^short = "States a deep link for a DiGA."

Extension: GEM_ERP_EX_DeepLink_link
Id: GEM-ERP-EX-DeepLink-link
Title: "Link for DiGA-DeepLink"
Description: "States the deep link for a DiGA."
* value[x] only url