Extension: GEM_ERP_EX_PrescriptionType
Id: GEM-ERP-EX-PrescriptionType
Description: "Definies the Type of a prescription."
* insert StructureDefinition(GEM_ERP_EX_PrescriptionType)
* . ^short = "Type of the prescription"
* . ^definition = "Definies the Type of the prescription. The codesystem contains all \"Muster 16\" forms."
* ^context[0].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "Communication.payload"
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only Coding
* value[x] from GEM_ERP_VS_FlowType (required)
* value[x].system 1..
* value[x].code 1..
