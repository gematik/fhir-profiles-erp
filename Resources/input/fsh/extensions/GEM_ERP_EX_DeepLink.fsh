Extension: GEM_ERP_EX_DeepLink
Id: GEM-ERP-EX-DeepLink
Title: "DiGA-DeepLink"
Description: "Contains information regarding a deep link for a DiGA."
* ^context[0].type = #element
* ^context[=].expression = "MedicationDispense"
* extension contains 
  GEM_ERP_EX_DeepLink_plattform 1..1
  and GEM_ERP_EX_DeepLink_link 1..1


Extension: GEM_ERP_EX_DeepLink_plattform
Id: GEM-ERP-EX-DeepLink-plattform
Title: "Plattform for DiGA-DeepLink"
Description: "States the redeem code for a DiGA."
* ^context[0].type = #element
* ^context[=].expression = "Extension"
* value[x] only Coding
* value[x] from GEM_ERP_VS_Plattform (required)
  * ^short = "States a deep link for a DiGA."

Extension: GEM_ERP_EX_DeepLink_link
Id: GEM-ERP-EX-DeepLink-link
Title: "Link for DiGA-DeepLink"
Description: "States the deep link for a DiGA."
* ^context[0].type = #element
* ^context[=].expression = "Extension"
* value[x] only url

CodeSystem: GEM_ERP_CS_Plattform
Id: GEM-ERP-CS-Plattform
Title: "GEM ERP CS Plattform"
Description: "Supported Plattforms for Deep Links"
* insert CodeSystem(GEM_ERP_CS_Plattform)
* #ios "iOS"
* #android "Android"
* #huawei "Huawei"

ValueSet: GEM_ERP_VS_Plattform
Id: GEM-ERP-VS-Plattform
Title: "GEM ERP VS Plattform"
Description: "Supported Plattforms for Deep Links"
* insert ValueSet(GEM_ERP_VS_Plattform)
* include codes from system GEM_ERP_CS_Plattform
