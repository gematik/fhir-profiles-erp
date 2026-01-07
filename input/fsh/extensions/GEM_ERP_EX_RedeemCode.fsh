Extension: GEM_ERP_EX_RedeemCode
Id: GEM-ERP-EX-RedeemCode
Title: "GEM ERP EX RedeemCode"
Description: "Gibt den Einlösecode für eine DiGA an."
* insert StructureDefinition(GEM_ERP_EX_RedeemCode)
* ^context[0].type = #element
* ^context[=].expression = "MedicationDispense"
* value[x] only string
  * ^short = "Gibt den Einlösecode für eine DiGA an."
