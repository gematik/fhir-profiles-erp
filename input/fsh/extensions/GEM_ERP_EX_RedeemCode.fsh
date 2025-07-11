Extension: GEM_ERP_EX_RedeemCode
Id: GEM-ERP-EX-RedeemCode
Title: "DiGA-RedeemCode"
Description: "States the redeem code for a DiGA."
* insert StructureDefinition(GEM_ERP_EX_RedeemCode)
* ^context[0].type = #element
* ^context[=].expression = "MedicationDispense"
* value[x] only string
  * ^short = "States the redeem code for a DiGA."